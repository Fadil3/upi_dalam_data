import 'package:flutter/material.dart';
import 'package:upi_dalam_data/detail_dosen.dart';

void main() {
  runApp(const DetailDosen());
}

class DetailDosen extends StatefulWidget {
  const DetailDosen({Key? key}) : super(key: key);
  @override
  DetailDosenState createState() {
    return DetailDosenState();
  }
}

class DetailDosenState extends State<DetailDosen> {
  final textEditController = TextEditingController();

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
          title: const Text("Detail Dosen"),
        ),
        body: ListView(children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(padding: EdgeInsets.all(10)),
              SizedBox(
                height: 115,
                width: 115,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2022/01/21/992560672.png"),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Text(
                      'Prof. Turmudi, M.Ed., M.Sc., Ph.D.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Text(
                      '2009017502',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              Container(
                  padding: const EdgeInsets.all(25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(children: const [
                        Text("Jabatan:",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                        Text("Pendidikan:",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                        Text("Status Ikatan Kerja:",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ))
                      ]),
                      Column(children: const [
                        Text("Guru Besar",
                            style: const TextStyle(
                              fontSize: 16,
                            )),
                        Text("S3",
                            style: const TextStyle(
                              fontSize: 16,
                            )),
                        Text("Dosen Tetap",
                            style: const TextStyle(
                              fontSize: 16,
                            ))
                      ])
                    ],
                  ))
            ],
          ),
          Column(children: [
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
                          padding: EdgeInsets.all(10), //20 pixel ke semua arah
                        ),
                        const Text(
                          'Riwayat Pendidikan',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10), //20 pixel ke semua arah
                        ),
                        DataTable(columns: const [
                          DataColumn(
                            label: Text('No'),
                          ),
                          DataColumn(
                            label: Text('PT'),
                          ),
                          DataColumn(
                            label: Text('Gelar'),
                          ),
                          DataColumn(
                            label: Text('Jenjang'),
                          ),
                        ], rows: [
                          DataRow(cells: [
                            DataCell(Text('1')),
                            DataCell(Text('Institut Teknologi Bandung')),
                            DataCell(Text('S.T')),
                            DataCell(Text('S1')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('2')),
                            DataCell(Text('Institut Teknologi Bandung')),
                            DataCell(Text('M.T')),
                            DataCell(Text('S2')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('3')),
                            DataCell(Text('Institut Teknologi Bandung')),
                            DataCell(Text('Dr')),
                            DataCell(Text('S3')),
                          ]),
                        ])
                      ])),
                    ),
                  ],
                )),
          ]),
          Column(children: [
            SizedBox(
                width: 520,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Card(
                          child: Column(children: [
                        const Padding(
                          padding: EdgeInsets.all(10), //20 pixel ke semua arah
                        ),
                        const Text(
                          'Riwayat Mengajar',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10), //20 pixel ke semua arah
                        ),
                        DataTable(columns: const [
                          DataColumn(
                            label: Text('No'),
                          ),
                          DataColumn(
                            label: Text('Semester'),
                          ),
                          DataColumn(
                            label: Text('Mata Kuliah'),
                          )
                        ], rows: [
                          DataRow(cells: [
                            DataCell(Text('1')),
                            DataCell(Text('Genap 2004')),
                            DataCell(Text('BASIS DATA')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('2')),
                            DataCell(Text('Ganjil 2005')),
                            DataCell(Text('ARSITEKTUR KOMPUTER I')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('3')),
                            DataCell(Text('Ganjil 2006')),
                            DataCell(Text('SISTEM OPERASI')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('4')),
                            DataCell(Text('Genap 2007')),
                            DataCell(Text('SISTEM OPERASI')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('5')),
                            DataCell(Text('Ganjil 2007')),
                            DataCell(Text('HCI')),
                          ]),
                        ])
                      ])),
                    ),
                  ],
                )),
          ]),
          Column(children: [
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
                          padding: EdgeInsets.all(10), //20 pixel ke semua arah
                        ),
                        const Text(
                          'Riwayat Prestasi',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10), //20 pixel ke semua arah
                        ),
                        DataTable(columns: const [
                          DataColumn(
                            label: Text('No'),
                          ),
                          DataColumn(
                            label: Text('Prestasi'),
                          ),
                          DataColumn(
                            label: Text('Tahun'),
                          ),
                          DataColumn(
                            label: Text('Tingkat'),
                          ),
                        ], rows: [
                          DataRow(cells: [
                            DataCell(Text('1')),
                            DataCell(Text('Lulusan Yudisium dengan pujian')),
                            DataCell(Text('2012')),
                            DataCell(Text('Nasional')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('2')),
                            DataCell(Text('Satyalancana karya Satya X')),
                            DataCell(Text('2012')),
                            DataCell(Text('Nasional')),
                          ])
                        ])
                      ])),
                    ),
                  ],
                )),
          ])
        ]));
  }
}
