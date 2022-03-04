import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const backgroundColor = Color(0xFF174348);
const textColor = Color(0xFFc3ff18);
const borderColor = Color(0xFF005661);

class DatePicker extends StatefulWidget {
  final ValueChanged<DateTime?> onChanged;

  const DatePicker({Key? key, required this.onChanged}) : super(key: key);

  @override
  _DatePicker createState() => _DatePicker();
}

class _DatePicker extends State<DatePicker> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
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
        width: 618,
        height: 64,
        decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(width: 1, color: borderColor),
            borderRadius: const BorderRadius.all(Radius.circular(9))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 17, bottom: 17, left: 16),
                child: Text(
                    DateFormat().addPattern('dd.MM.y').format(selectedDate),
                    style: const TextStyle(color: textColor, fontSize: 20))),
            Padding(
                padding: const EdgeInsets.only(top: 21, bottom: 25, right: 18),
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
