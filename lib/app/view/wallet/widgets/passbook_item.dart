import 'package:flutter/material.dart';
import 'package:owp_loyalty/app/utils/constants.dart';
import 'package:owp_loyalty/app/utils/size_config.dart';
import 'package:owp_loyalty/app/view/wallet/widgets/custom_text.dart';
import 'package:owp_loyalty/app/view/widgets/common_widgets.dart';

import '../../../backend/model/wallet/get_transaction_modal.dart';

class PassBookItem extends StatelessWidget {
  final History details;
  const PassBookItem({
    required this.details,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String transactionDate =
        "${details.txnDate!.year.toString()}-${details.txnDate!.month.toString().padLeft(2, '0')}-${details.txnDate!.day.toString().padLeft(2, '0')}";
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Constants.whitColor,
          boxShadow: const [
            BoxShadow(
                color: Colors.black54,
                blurRadius: 8.0,
                offset: Offset(0.0, 0.75))
          ],
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Transaction details",
                style: customTextStyle(
                    color: Constants.mainColor,
                    size: 13.0.sp,
                    weight: FontWeight.w500),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                transactionDate,
                style: customTextStyle(
                    color: Constants.blackColor,
                    size: 11.0.sp,
                    weight: FontWeight.w500),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          Text(
            details.id != null ? details.id.toString() : "#0000000000000",
            style: TextStyle(fontSize: 10.0.sp, fontWeight: FontWeight.w500),
          ),
          Constants().sbHt10,
          const Divider(
            thickness: 2,
          ),
          Constants().sbHt10,
          CustomRowPassbookHistory(
              status: false,
              name: "App : ",
              details: details.txnApp.toString()),
          Constants().sbHt5,
          CustomRowPassbookHistory(
              status: true,
              name: "Mode : ",
              details: details.txnMode.toString()),
          Constants().sbHt5,
          CustomRowPassbookHistory(
              status: false,
              name: "type : ",
              details: details.txnType.toString()),
          Constants().sbHt5,
          CustomRowPassbookHistory(
              status: false,
              name: "amount : ",
              details: details.amount.toString()),
          Constants().sbHt5,
          details.coin != null
              ? CustomRowPassbookHistory(
                  status: false,
                  name: "coin : ",
                  details: details.coin.toString())
              : const SizedBox(),
          Constants().sbHt5,
          CustomRowPassbookHistory(
            status: false,
            name: "reason : ",
            details: details.txnReason.toString(),
          ),
          Constants().sbHt5,
          details.txnReason.toString() == "Wallet Transfer"
              ? CustomRowPassbookHistory(
                  status: false,
                  name: "senderId: ",
                  details: details.senderId.toString(),
                )
              : const SizedBox(),
          Constants().sbHt5,
          details.txnReason.toString() == "Wallet Transfer"
              ? CustomRowPassbookHistory(
                  status: false,
                  name: "receiverId: ",
                  details: details.receiverId.toString(),
                )
              : const SizedBox(),
          CustomRowPassbookHistory(
            name: "Status : ",
            details: details.status.toString(),
            status: true,
          )
        ]),
      ),
    );
  }
}
