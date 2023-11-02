import 'package:flutter/material.dart';
import 'package:owp_loyalty/app/utils/constants.dart';
import 'package:owp_loyalty/app/utils/size_config.dart';
import 'package:owp_loyalty/app/view/widgets/common_widgets.dart';

class CustomRowPassbookHistory extends StatefulWidget {
  final bool? status;
  final String name;
  final String details;
  const CustomRowPassbookHistory({
    super.key,
    required this.name,
    required this.details,
    this.status,
  });

  @override
  State<CustomRowPassbookHistory> createState() =>
      _CustomRowPassbookHistoryState();
}

class _CustomRowPassbookHistoryState extends State<CustomRowPassbookHistory> {
  String status = "";
  @override
  void initState() {
    statusCheck();
    super.initState();
  }

  void statusCheck() {
    if (widget.details == "2") {
      status = "Success";
    } else if (widget.details == "1") {
      status = "Pending";
    } else if (widget.details == "0") {
      status = "Failed"; //Failed
    }
  }

  // void modeCheck() {
  //   if (widget.details == "DEPOSIT") {
  //     status = "Success";
  //   } else if (widget.details == "1") {
  //     status = "Failed";
  //   } else if (widget.details == "0") {
  //     status = "Pending";
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.name,
          style: customTextStyle(
              size: 13.0.sp,
              color: widget.status == false
                  ? Constants.blackColor
                  : status == "Success" || widget.details == "DEPOSIT"
                      ? Colors.green
                      : status == "Failed" || widget.details == "WITHDRAWAL"
                          ? Colors.red
                          : Colors.orange,
              weight:
                  widget.status == false ? FontWeight.w400 : FontWeight.w500),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          width: 53.wp,
          child: Text(
            widget.status == true
                ? widget.details == "DEPOSIT"
                    ? widget.details
                    : widget.details == "WITHDRAWAL"
                        ? widget.details
                        : status
                : widget.details,
            style: customTextStyle(
              size: 11.0.sp,
              color: widget.status == false
                  ? Constants.blackColor
                  : status == "Success" || widget.details == "DEPOSIT"
                      ? Colors.green
                      : status == "Failed" || widget.details == "WITHDRAWAL"
                          ? Colors.red
                          : Colors.orange,
              weight:
                  widget.status == false ? FontWeight.w400 : FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
