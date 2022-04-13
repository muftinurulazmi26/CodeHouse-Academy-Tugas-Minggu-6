import 'package:flutter/material.dart';
import 'package:news_apps/theme.dart';

class CardMenuAccount extends StatelessWidget {
  String? iconLeft;
  String? iconRight;
  String? title;

  CardMenuAccount({
    Key? key,
    required this.iconLeft,
    required this.iconRight,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset(iconLeft!),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  title!,
                  style: TextStyle(
                    fontSize: 12,
                    color: greyColor6,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 16,
            height: 16,
            child: (iconRight!.isEmpty) ? Container() : Image.asset(iconRight!),
          )
        ],
      ),
    );
  }
}