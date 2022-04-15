import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final textEditController = TextEditingController();
  String dropdownvalue = '↑ Nama';
  var items = [
    '↑ Nama',
    '↓ Nama',
    '↑ Jabatan',
    '↓ Jabatan',
  ];

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello'),
          bottom: AppBar(
            backgroundColor: Colors.white,
            title: Container(
              width: double.infinity,
              height: 40,
              color: Colors.white,
              child: Center(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Masukan Nama Dosen',
                    prefixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      tooltip: 'search',
                      onPressed: () {
                        // kalau ditap
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: ListView(children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text(
                      'Urutkan berdasarkan:',
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 32, 30, 30)),
                    ),
                    DropdownButton(
                      // Initial Value
                      value: dropdownvalue,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? value) {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ]), //column center
      ), //Scaffold
    ); //Material APP
  }
}
