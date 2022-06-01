import 'package:flutter/material.dart';
import 'package:upi_dalam_data/detail_dosen.dart';

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
  String _nama = "";
  String pilihanSalam = "DAA";
  String pilihanSalamOut = "";

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
    List<DropdownMenuItem<String>> filter = [];
    var itm1 = const DropdownMenuItem<String>(
      value: "DAA",
      child: Text("Nama A-Z"),
    );
    var itm2 = const DropdownMenuItem<String>(
      value: "DAB",
      child: Text("Nama Z-A"),
    );
    var itm3 = const DropdownMenuItem<String>(
      value: "Golting",
      child: Text("Golongan Tertinggi"),
    );
    var itm4 = const DropdownMenuItem<String>(
      value: "Golren",
      child: Text("Golongan Terendah"),
    );
    var itm5 = const DropdownMenuItem<String>(
      value: "Jabting",
      child: Text("Jabatan Teringgi"),
    );
    var itm6 = const DropdownMenuItem<String>(
      value: "Jabren",
      child: Text("Jabatan Terendah"),
    );
    filter.add(itm1);
    filter.add(itm2);
    filter.add(itm5);
    filter.add(itm6);
    filter.add(itm3);
    filter.add(itm4);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cari Dosen"),
      ),
      body: ListView(children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  SizedBox(
                    width: 500,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Cari Dosen',
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Urutkan berdasarkan:',
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 32, 30, 30)),
                    ),
                  ),
                  DropdownButton(
                    value: pilihanSalam,
                    items: filter,
                    onChanged: (String? newValue) {
                      setState(() {
                        if (newValue != null) {
                          pilihanSalam = newValue;
                        }
                      });
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(10), //20 pixel ke semua arah
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _nama = textEditController
                              .text; //akses text via controller
                          pilihanSalamOut = pilihanSalam;
                        }); //refresh
                      },
                      child: const Text('Urutkan'),
                    ),
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
                                child: Column(children: [
                              const Padding(
                                padding:
                                    EdgeInsets.all(10), //20 pixel ke semua arah
                              ),
                              const Text(
                                'Daftar Dosen',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              const Padding(
                                padding:
                                    EdgeInsets.all(10), //20 pixel ke semua arah
                              ),
                              DataTable(columns: const [
                                DataColumn(
                                  label: Text('Nama'),
                                ),
                                DataColumn(
                                  label: Text('Jabatan'),
                                ),
                                DataColumn(
                                  label: Text('Golongan'),
                                ),
                                DataColumn(
                                  label: Text(''),
                                ),
                              ], rows: [
                                DataRow(cells: [
                                  DataCell(Text('Fadlurahman MT')),
                                  DataCell(Text('Guru Besar')),
                                  DataCell(Text('IV/d')),
                                  DataCell(TextButton(
                                      onPressed: () {
                                        // route to detail dosen
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailDosen()),
                                        );
                                      },
                                      child: const Text('Lihat')))
                                ]),
                              ])
                            ])),
                          ),
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
