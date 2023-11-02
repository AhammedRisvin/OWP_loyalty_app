import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:owp_loyalty/app/backend/model/wallet/get_my_redeem_modal.dart';
import 'package:owp_loyalty/app/backend/services/wallet_services.dart';
import 'package:owp_loyalty/app/env.dart';

import '../../backend/model/wallet/get_bank_modal.dart';
import '../../backend/model/wallet/get_transaction_modal.dart';
import '../../backend/model/wallet/get_wallet_modal.dart';
import '../../utils/prefference.dart';
import '../../view/widgets/bottom_bar.dart';
import '../../view/widgets/common_widgets.dart';
import '../user/user_controller.dart';

class WalletController extends GetxController implements GetxService {
  DateTime date = DateTime.now();
  RxBool isDataCome = false.obs;
  RxBool isMyRedeems = false.obs;
  RxList<History> getPassbookDetails = <History>[].obs;
  RxList<MyRedeemsModal> getMyRedeemDetails = <MyRedeemsModal>[].obs;
  RxList<dynamic> getCountryList = <dynamic>[].obs;
  RxList<CountryBankModal> getCountrybasedBankList = <CountryBankModal>[].obs;
  bool isLoading = false;
  TextEditingController amountController = TextEditingController();
  TextEditingController numberOfCoinController = TextEditingController();
  TextEditingController withdrawCoinAmountController = TextEditingController();
  TextEditingController withdrawCountryController = TextEditingController();
  TextEditingController withdrawBankController = TextEditingController();
  TextEditingController withdrawAccountNumberController =
      TextEditingController();
  TextEditingController transferCoinAdressController = TextEditingController();
  TextEditingController transferCoinAmountController = TextEditingController();
  TextEditingController transferCoinRemarksController = TextEditingController();
  var walletModal = GetWalletModal().obs;
  String countrycode = "";
  String currencycode = "";
  RxInt cost = 0.obs;
  RxBool isCostZero = true.obs;
  @override
  void onInit() {
    final UserController controller = Get.put(UserController());
    getPassbook(3);
    getWallet();
    getRedeemPassbook();
    getCountryDetails();
    if (controller.singleUser.value.data != null) {
      countrycode = controller.singleUser.value.data!.countryCode.toString();
      currencycode = controller.singleUser.value.data!.currency.toString();
    }

    super.onInit();
  }

//find before 3,6,9, month dates
  String getMonthsBeforeDate(int before) {
    // Subtract 3 months from the current date
    int year = date.year;
    int month = date.month - before;
    int day = date.day;

    // Handle negative or zero months
    while (month <= 0) {
      month += 12;
      year--;
    }
    log("3 month"
        "${year.toString()}-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}");
    return "${year.toString()}-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}";
  }

//get getPassbook
  void getPassbook(int beforeMonth) async {
    isLoading = true;
    // showLoading();
    String startDate = getMonthsBeforeDate(beforeMonth);
    String currentDate =
        "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
    var response = await WalletServices.getPassbook(
        startDate: startDate, endDate: currentDate);
    log(response!.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = jsonDecode(response.body.toString());

      getPassbookDetails.clear();
      for (var item in data['data']['history']) {
        History history = History.fromJson(item);
        getPassbookDetails.add(history);
      }
      hideLoading();
      isLoading = false;
    } else {
      hideLoading();
      log(response.body);
    }
    update();
  }

//get User data
  void getWallet() async {
    var response = await WalletServices.getWallet();
    if (response!.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body.toString());
      walletModal.value = GetWalletModal.fromJson(data);
      isDataCome.value = true;
    } else {
      log(response.body);
    }
    update();
  }

//get coin cost
  void getCoinCost() async {
    var params = {"amount": numberOfCoinController.text.toString()};
    var response = await WalletServices.getCoinCost(params);
    if (response.statusCode == 201) {
      isCostZero.value = false;
      Map<String, dynamic> data = jsonDecode(response.body.toString());
      cost.value = data['data']['cost'];
    } else {
      log(response.body);
    }
    update();
  }

//stripe payment

  calculateAmount(String amount) {
    final calculatedAmount = (int.parse(amount)) * 100;
    return calculatedAmount.toString();
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount.toString()),
        'currency': currency,
        'payment_method_types[]': 'card'
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer ${Environments.stripeToken}',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      return jsonDecode(response.body);
    } catch (e) {
      log("erre change user $e");
    }
  }

  Map<String, dynamic>? paymentIntentData;
  Future<void> makePayment(context, amount, currency) async {
    int? amounttt = int.tryParse(numberOfCoinController.text);
    log(amount.toString());
    var params = {"amount": amounttt};
    try {
      // var gpay = PaymentSheetGooglePay(
      //     merchantCountryCode: countrycode,
      //     currencyCode: currencycode,
      //     testEnv: true);
      var response = await WalletServices.rechargeWallet(params);

      log(response.body.toString());
      if (response.statusCode == 201) {
        var data = jsonDecode(response.body.toString());
        log("clientSecret ${data!["data"]['stripe_payment']['clientSecret']}");
        prefs.setString("transactionId",
            data!["data"]['stripe_payment']['transactionId'].toString());
        prefs.setString("clientSecret",
            data!["data"]['stripe_payment']['clientSecret'].toString());
        log(prefs.getString("transactionId").toString());
        try {
          paymentIntentData = await createPaymentIntent(amount, currency);
          log("paymentIntentData$paymentIntentData");
          if (paymentIntentData != null) {
            await Stripe.instance.initPaymentSheet(
                paymentSheetParameters: SetupPaymentSheetParameters(
                    googlePay:
                        const PaymentSheetGooglePay(merchantCountryCode: "AED"),
                    merchantDisplayName: "prospect",
                    customerId: paymentIntentData!["customer"],
                    paymentIntentClientSecret: data!["data"]['stripe_payment']
                        ['clientSecret'],
                    customerEphemeralKeySecret:
                        paymentIntentData!["ephemeralkey"]));
          }
        } catch (e) {
          log("message$e");
        }
        //STEP 3: Display Payment sheet
        try {
          await Stripe.instance.presentPaymentSheet().then((value) {
            validatePayment(context);
          });
          log("success");
        } on Exception catch (e) {
          if (e is StripeException) {
            log("error from stripe $e");
          } else {
            log("Unforeseen erro $e");
          }
        } catch (e) {
          log("Exceptio   ---$e");
        }
        // displayPaymentSheet();
      }
    } catch (err) {
      log(err.toString());
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance
          .presentPaymentSheet(options: const PaymentSheetPresentOptions())
          .then((value) {
        // log("datas" + datas.toString());
        log("message");
        successtoast(title: "Payment Successfully");
        // log("Payment Successfully");
      });
    } catch (e) {
      log('$e');
    }
  }

//validate payment
  void validatePayment(context) async {
    String clintUrl = prefs.getString("clientSecret").toString();
    String transactionId = prefs.getString("transactionId").toString();
    String trimedId = clintUrl.substring(0, 27);
    var params = {'paymentIntentId': trimedId, 'transactionId': transactionId};
    var response = await WalletServices.validatePayment(params);
    log(response.body);
    if (response.statusCode >= 200 || response.statusCode <= 299) {
      Get.offAll(const BottomBar());
      successtoast(
        title: json.decode(response.body)["data"]["message"].toString(),
      );
      getWallet();
      getPassbook(3);
      amountController.clear();
      log(response.statusCode.toString());
    } else {
      log(response.body);
    }
    update();
  }

//wallet transfer payment
  void walletTransfer() async {
    var params = {
      'amount': int.parse(transferCoinAmountController.text),
      'user_id': transferCoinAdressController.text
    };
    var response = await WalletServices.walletTransfer(params);
    log(response.statusCode.toString());
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      getWallet();
      getPassbook(3);
      transferCoinAmountController.clear();
      transferCoinAdressController.clear();

      Get.back();
      successtoast(
        duration: 3,
        title: json.decode(response.body)["data"]["message"].toString(),
      );
    } else {
      log(response.body);
      failurtoast(
        duration: 3,
        title: json.decode(response.body)["data"]["message"].toString(),
      );
    }
    update();
  }

//wallet withdraw payment
  void walletWithdraw() async {
    var params = {
      "amount": int.parse(withdrawCoinAmountController.text),
      "bank": withdrawBankController.text,
      "country": withdrawCountryController.text,
      "i_ban": withdrawAccountNumberController.text
    };
    log("params $params");
    var response = await WalletServices.walletWithdraw(params);
    log(response.statusCode.toString());
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      getWallet();
      getPassbook(3);
      getRedeemPassbook();
      withdrawAccountNumberController.clear();
      withdrawBankController.clear();
      withdrawCoinAmountController.clear();
      withdrawCountryController.clear();

      Get.back();
      successtoast(
        duration: 3,
        title: json.decode(response.body)["data"]["message"].toString(),
      );
    } else {
      log(response.body);
      failurtoast(
        duration: 3,
        title: json.decode(response.body)["data"]["message"].toString(),
      );
    }
    update();
  }

//get getMy Redeem Passbook
  void getRedeemPassbook() async {
    isLoading = true;

    var response = await WalletServices.getRedeemPassbook();
    log("getRedeemPassbook${response!.body}");
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      var data = jsonDecode(response.body.toString());
      List<MyRedeemsModal> list = [];
      list.clear();
      getMyRedeemDetails.clear();
      for (var item in data['data']) {
        MyRedeemsModal history = MyRedeemsModal.fromJson(item);

        list.add(history);
      }
      getMyRedeemDetails.addAll(list.reversed);
      hideLoading();
      isLoading = false;
    } else {
      hideLoading();
      log(response.body);
    }
    update();
  }

  void getMyRedeemScreen({required bool value}) {
    isMyRedeems.value = value;
    update();
  }

//get my redeem - country details
  void getCountryDetails() async {
    var response = await WalletServices.getCountryDetails();

    if (response!.statusCode >= 200 && response.statusCode <= 299) {
      var data = jsonDecode(response.body.toString());

      List datalist = data;

      getCountryList.clear();
      getCountryList.value = datalist;
    } else {
      hideLoading();
      log(response.body);
    }
    update();
  }

//get my redeem - country  based bank details
  void getCountrybasedBankDetails({required String countryName}) async {
    isLoading = true;

    var response = await WalletServices.getCountrybasedBankDetails(
        countryName: countryName.toUpperCase());

    if (response!.statusCode >= 200 && response.statusCode <= 299) {
      var data = jsonDecode(response.body.toString());

      getCountrybasedBankList.clear();
      for (var item in data) {
        CountryBankModal history = CountryBankModal.fromJson(item);
        getCountrybasedBankList.add(history);
      }
      log("getCountrybasedBankList$getCountrybasedBankList");
      hideLoading();
      isLoading = false;
    } else {
      hideLoading();
      log(response.body);
    }
    update();
  }
}
