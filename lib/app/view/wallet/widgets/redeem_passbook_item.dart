import 'package:flutter/material.dart';
import 'package:owp_loyalty/app/backend/model/wallet/get_my_redeem_modal.dart';
import 'package:owp_loyalty/app/utils/constants.dart';
import 'package:owp_loyalty/app/utils/size_config.dart';
import 'package:owp_loyalty/app/view/wallet/widgets/custom_text.dart';
import 'package:owp_loyalty/app/view/widgets/common_widgets.dart';

class RedeemPassBookItem extends StatelessWidget {
  final MyRedeemsModal details;
  const RedeemPassBookItem({
    required this.details,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
          Text(
            "My Redeem details",
            style: customTextStyle(
                color: Constants.mainColor,
                size: 13.0.sp,
                weight: FontWeight.w500),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
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
              name: "amount : ",
              details: details.amount.toString()),
          Constants().sbHt5,
          CustomRowPassbookHistory(
              status: false,
              name: "country : ",
              details: details.country.toString()),
          Constants().sbHt5,
          CustomRowPassbookHistory(
              status: false, name: "bank : ", details: details.bank.toString()),
          Constants().sbHt5,
          CustomRowPassbookHistory(
            status: false,
            name: "i_ban : ",
            details: details.iBan.toString(),
          ),
          Constants().sbHt5,
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
