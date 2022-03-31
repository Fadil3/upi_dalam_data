import "package:flutter/material.dart";

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  List<String> items1 = <String>[
    'PIMPINAN UNIVERSITAS',
    'Rektor',
    'Wakil Rektor',
  ];

  String dropdownValue1 = 'PIMPINAN UNIVERSITAS';

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 300,
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: Color.fromARGB(255, 96, 96, 96), width: 1)),
                      child: DropdownButton<String>(
                        onChanged: (String? newValue1) {
                          setState(() {
                            dropdownValue1 = newValue1!;
                          });
                        },
                        value: dropdownValue1,
                        items: items1.map<DropdownMenuItem<String>>(
                          (String value1) {
                            return DropdownMenuItem<String>(
                              value: value1,
                              child: Text(value1),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  ],
                ),
              const Padding(padding: EdgeInsets.all(10.0)),
              ],
            ),
          ],
        ),        
      )
    );
  }
}