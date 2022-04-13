import 'package:flutter/material.dart';
import 'package:news_apps/theme.dart';

class CardMenuOtherInfo extends StatelessWidget {
  String? title;
  String? subTitle;

  CardMenuOtherInfo({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(8.0),
      width: double.infinity,
      height: 32,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: greyColor,
            blurRadius: 0.5,
            offset: const Offset(0.0, 0.5),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title!,
            style: TextStyle(
              fontSize: 12,
              color: greyColor6,
              fontWeight: FontWeight.w500,
            ),
          ),
          (subTitle!.isEmpty)
              ? Container()
              : Text(
                  subTitle!,
                  style: TextStyle(
                    fontSize: 10,
                    color: greyColor7,
                    fontWeight: FontWeight.w400,
                  ),
                ),
        ],
      ),
    );
  }
}