import 'package:flutter/material.dart';

void main() {
  runApp(const CariDosen());
}

class CariDosen extends StatefulWidget {
  const CariDosen({Key? key}) : super(key: key);
  @override
  CariDosenState createState() {
    return CariDosenState();
  }
}

class CariDosenState extends State<CariDosen> {
  final textEditController = TextEditingController();
  String dropdownvalue = '↑ Nama';
  var items = [
    '↑ Nama',
    '↓ Nama',
    '↑ Jabatan',
    '↓ Jabatan',
    '↑ Pangkat',
    '↓ Pangkat',
  ];

  TableRow buildRow(List<String> cells) => TableRow(
          children: cells.map((cell) {
        return Padding(
          padding: EdgeInsets.all(30),
          child: Text(cell),
        );
      }).toList());

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fakultas"),
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
                  SizedBox(
                    width: 300,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'NIM / NIP / NIDN',
                        border: const OutlineInputBorder(),
                      ),
                    ),
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
        Container(
          child: Column(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(
                      width: 480,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                              padding: EdgeInsets.all(10),
                              child: Card(
                                child: Table(
                                  defaultColumnWidth: IntrinsicColumnWidth(),
                                  defaultVerticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  children: [
                                    buildRow([
                                      'Al Tair MT',
                                      'Guru Besar',
                                      'PU',
                                    ]),
                                  ],
                                ),
                              )),
                        ],
                      )),
                ])
              ],
            )
          ]),
        )
      ]), //column center
    );
  }
}
