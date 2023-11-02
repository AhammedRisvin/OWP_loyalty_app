import '../env.dart';

class Urls {
  static const baseUrl = Environments.baseUrl;
  static const getCountryList =
      'https://theowpc.com/api/world/get-all-countries-list';
  static const getStateListAndCity =
      'https://theowpc.com/api/world/get-all-states-list-by-country-id';
  static const createAccount = '${baseUrl}auth/signup';
  static const logIn = '${baseUrl}auth/signin';
  static const fcmSendToBackend = '${baseUrl}user/update-fcm';
  static const getPassbook = '${baseUrl}transaction/passbook';
  static const getSingleUser = '${baseUrl}user/profile';
  static const changePassword = 'https://theowpc.com/api/auth/change-password';
  static const getWallet = '${baseUrl}wallet';
  static const getCoinCost = '${baseUrl}wallet/get-cost';
  static const rechargeWallet = '${baseUrl}wallet/recharge-wallet';
  static const validatePayment = '${baseUrl}wallet/validate-transaction';
  static const contactUs = '${baseUrl}contact-us';
  static const getuserSupport = '${baseUrl}support';
  static const getToken = '${baseUrl}token';
  static const getWhatsNew = '${baseUrl}new-offer';
  static const getBanners = '${baseUrl}banner/';
  static const optitOut = '${baseUrl}opt-it-out/add';
  static const getProjects = '${baseUrl}projects/';
  static const getAllTiers = '${baseUrl}tier';
  static const purchaseTier = '${baseUrl}tier/upgrade-tier';
  static const convertTokenToCoin = '${baseUrl}token/convert-tokens';
  static const getTokensForNexTier = '${baseUrl}tier/tokens-for-tier';
  static const getMyTodaySteps = "http://54.238.10.51:3001/api/steps";
  static const walletTransfer = '${baseUrl}wallet/wallet-transfer';
  static const getMyRedeemPassbook = '${baseUrl}redeem/get-my-redeem';
  static const walletWithdraw = '${baseUrl}redeem/add-redeem';
  static const getMyRedeemCountryList =
      'https://theowpc.com/api/world/get-bank-countries';
  static const getCountrybasedBankDetails =
      'https://theowpc.com/api/world/get-banklist-by-country/';
}
