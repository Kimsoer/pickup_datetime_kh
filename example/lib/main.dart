import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pickup_datetime_kh/pickup_datetime_kh.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pickup datetime kh demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime? startDate = DateTime.now();
  DateTime? endDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pickup Datetime Kh"),
      ),
      body: SafeArea(
        child: PickUpDateTimeKh(
          header: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                const Text('Select date range', style: TextStyle(fontSize: 14)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(startDate != null ? DateFormat('dd MMM yyyy').format(startDate!) : 'Start', style: const TextStyle(fontSize: 18)),
                    Container(
                      width: 12,
                      height: 2,
                      decoration: BoxDecoration(color: Theme.of(context).iconTheme.color),
                    ),
                    Text(endDate != null ? DateFormat('dd MMM yyyy').format(endDate!) : 'End', style: const TextStyle(fontSize: 18))
                  ],
                ),
              ],
            ),
          ),
          barrierDismissible: true,
          minimumDate: DateTime(2000),
          maximumDate: DateTime.now().add(const Duration(days: 30)),
          initialStartDate: startDate,
          initialEndDate: endDate,
          btnLeftBackgroundColor: Colors.grey,
          onApplyClick: (start, end) {
            setState(() {
              endDate = end;
              startDate = start;
            });
            print("Start Date $startDate");
            print("End Date $endDate");
          },
          btnRightBackgroundColor: Colors.blue,
          onCancelClick: () {
            setState(() {
              endDate = DateTime.now();
              startDate = DateTime.now();
            });
          },
        ),
      ),
    );
  }
}
