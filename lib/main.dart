import 'package:flutter/material.dart';
import 'package:header_bar/header_bar.dart';
import 'package:header_bar/date_picker.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime _dateValue = DateTime.now();

  ValueChanged<DateTime?> _valueChangedHandler() {
    return (value) => setState(() => _dateValue = value!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeaderBar(
        title: 'Technische Hotline',
        phone: '0800 123 456 78',
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            DatePicker(
              onChanged: _valueChangedHandler(),
            ),
            Text(DateFormat().addPattern('dd.MM.y').format(_dateValue))
          ],
        ),
      )
    );
  }
}