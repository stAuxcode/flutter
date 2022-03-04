import 'package:flutter/material.dart';
import 'package:header_bar/header_bar.dart';
import 'package:intl/intl.dart';

const backgroundColor = Color(0xFF174348);
const textColor = Color(0xFFc3ff18);
const borderColor = Color(0xFF005661);

var firstDate = DateTime(2015, 8);
var lastDate = DateTime(2101);

const containerWidth = 618.00;
const containerHeight = 64.00;

var containerDecoration = BoxDecoration(
    color: backgroundColor,
    border: Border.all(width: 1, color: borderColor),
    borderRadius: const BorderRadius.all(Radius.circular(9)));

const dateTextPadding = EdgeInsets.only(top: 17, bottom: 17, left: 16, right: 0);

const dateTextStyle = TextStyle(color: textColor, fontSize: 20);

const dateTextPattern = 'dd.MM.y';

const iconPadding = EdgeInsets.only(top: 21, bottom: 25, right: 18, left: 0);

class DatePicker extends StatefulWidget {
  final ValueChanged<DateTime?> onChanged;

  const DatePicker({Key? key, required this.onChanged}) : super(key: key);

  @override
  _DatePicker createState() => _DatePicker();
}

class _DatePicker extends State<DatePicker> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked =
        await showDatePicker(context: context, initialDate: selectedDate, firstDate: firstDate, lastDate: lastDate);
    if (picked != null && picked != selectedDate) {
      {
        setState(() {
          selectedDate = picked;
        });
        widget.onChanged(picked);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: containerWidth,
        height: containerHeight,
        decoration: containerDecoration,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
                padding: dateTextPadding,
                child: Text(DateFormat().addPattern(dateTextPattern).format(selectedDate), style: dateTextStyle)),
            Padding(
                padding: iconPadding,
                child: GestureDetector(
                  onTap: () => _selectDate(context),
                  // Image tapped
                  child: Image.asset(
                    'icons-mobile-calendar.png',
                  ),
                ))
          ],
        ));
  }
}
