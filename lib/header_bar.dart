import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const titleStyle = TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14);

const phoneStyle = TextStyle(fontWeight: FontWeight.normal, color: Colors.white, fontSize: 18);

const backgroundColor = Color(0xFF00282D);
const borderColor = Color(0xFF005661);
const screenWidthValue = 767;
const containerDecoration =
    BoxDecoration(color: backgroundColor, border: Border(bottom: BorderSide(width: 1, color: borderColor)));

const logoPadding = EdgeInsets.only(top: 9, bottom: 9, left: 0, right: 0);

const iconPadding = EdgeInsets.only(top: 9, right: 15, bottom: 9, left: 0);

const textPadding = EdgeInsets.only(top: 10, bottom: 6, left: 0, right: 0);

const logoWidth = 140.00;

const iconWidth = 42.00;

const containerHeight = 58.00;
const containerWidth = double.infinity;

class HeaderBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String phone;

  double getScreenWidth(BuildContext context) => MediaQuery.of(context).size.width;

  EdgeInsets getPadding(BuildContext context) {
    var padding = getScreenWidth(context) > screenWidthValue ? 43.00 : 0.00;
    return EdgeInsets.only(left: 14, right: padding);
  }

  const HeaderBar({
    required this.title,
    required this.phone,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: containerDecoration,
        height: containerHeight,
        padding: getPadding(context),
        width: containerWidth,
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                    padding: logoPadding,
                    child: Image.asset(
                      'logo.png',
                      width: logoWidth,
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: iconPadding,
                  child: Image.asset(
                    'icon.png',
                    width: iconWidth,
                  ),
                ),
                if (getScreenWidth(context) > screenWidthValue)
                  Padding(
                      padding: textPadding,
                      child: Column(
                        children: [Text(title, style: titleStyle), Text(phone, style: phoneStyle)],
                      )),
              ],
            )
          ],
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(containerHeight);
}
