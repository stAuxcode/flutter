import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const backgroundColor = Color(0xFF00282D);
const borderColor = Color(0xFF005661);

class HeaderBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String phone;

  double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double getPadding(BuildContext context) {
    if (getScreenWidth(context) > 767) {
      return 43;
    } else {
      return 0;
    }
  }

  const HeaderBar({
    required this.title,
    required this.phone,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: backgroundColor,
          border: Border(bottom: BorderSide(width: 1, color: borderColor))),
      height: 58,
      padding: EdgeInsets.only(left: 14, right: getPadding(context)),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 9, bottom: 9),
              child: Image.asset(
                'logo.png',
                width: 140,
              )),
          Padding(
            padding:
                const EdgeInsets.only(left: 600, top: 9, right: 15, bottom: 9),
            child: Image.asset(
              'icon.png',
              width: 42,
            ),
          ),
          if (getScreenWidth(context) > 767)
            Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 6),
                child: Column(
                  children: [
                    Text(title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 14)),
                    Text(phone,
                        style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                            fontSize: 18))
                  ],
                )),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(58);
}
