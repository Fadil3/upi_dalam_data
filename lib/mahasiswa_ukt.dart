import "package:flutter/material.dart";
import 'package:upi_dalam_data/contact.dart';
import "package:upi_dalam_data/home.dart";
import 'package:upi_dalam_data/setting.dart';

class MahasiswaUKT extends StatefulWidget {
  const MahasiswaUKT({Key? key}) : super(key: key);

  @override
  State<MahasiswaUKT> createState() => _MahasiswaUKTState();
}

class _MahasiswaUKTState extends State<MahasiswaUKT> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mahasiswa Belum Bayar UKT'),
      ),
      body: Center(
        child: SingleChildScrollView(
            child: Column(
                // center
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: 450,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Card(
                                    child: Column(children: [
                                  const Padding(
                                    padding: EdgeInsets.all(
                                        10), //20 pixel ke semua arah
                                  ),
                                  const Text(
                                    'Jumlah Mahasiswa Belum Bayar UKT',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  const Text(
                                    'Universitas Pendidikan Indonesia',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(
                                        10), //20 pixel ke semua arah
                                  ),
                                  const Text(
                                    '52',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(
                                        10), //20 pixel ke semua arah
                                  )
                                ])),
                              ],
                            )),
                        SizedBox(
                            width: 600,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Card(
                                    child: Column(children: [
                                  const Padding(
                                    padding: EdgeInsets.all(
                                        10), //20 pixel ke semua arah
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(
                                        10), //20 pixel ke semua arah
                                  ),
                                  const Text(
                                    'Mahasiswa Belum Bayar UKT',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(
                                        10), //20 pixel ke semua arah
                                  ),
                                  DataTable(columns: const [
                                    DataColumn(
                                      label: Text('Fakultas'),
                                    ),
                                    DataColumn(
                                      label: Text('Prodi'),
                                    ),
                                    DataColumn(
                                      label: Text('Semester'),
                                    ),
                                    DataColumn(
                                      label: Text('NIM'),
                                    ),
                                    DataColumn(
                                      label: Text('Tagihan'),
                                    ),
                                  ], rows: [
                                    DataRow(cells: [
                                      const DataCell(Text('FPMIPA')),
                                      const DataCell(Text('Ilmu Komputer')),
                                      const DataCell(Text('6')),
                                      const DataCell(Text('123456')),
                                      const DataCell(Text('2.000.000')),
                                    ]),
                                    DataRow(cells: [
                                      const DataCell(Text('FPMIPA')),
                                      const DataCell(Text('Ilmu Komputer')),
                                      const DataCell(Text('6')),
                                      const DataCell(Text('123456')),
                                      const DataCell(Text('2.000.000')),
                                    ]),
                                    DataRow(cells: [
                                      const DataCell(Text('FPMIPA')),
                                      const DataCell(Text('Ilmu Komputer')),
                                      const DataCell(Text('6')),
                                      const DataCell(Text('123456')),
                                      const DataCell(Text('2.000.000')),
                                    ]),
                                    DataRow(cells: [
                                      const DataCell(Text('FPMIPA')),
                                      const DataCell(Text('Ilmu Komputer')),
                                      const DataCell(Text('6')),
                                      const DataCell(Text('123456')),
                                      const DataCell(Text('2.000.000')),
                                    ]),
                                  ])
                                ])),
                              ],
                            )),
                        SizedBox(
                          width: 300,
                          height: 35,
                          child: ElevatedButton(
                            onPressed: () {
                              // Respond to button press
                            },
                            child: const Text('Download as CSV'),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(8.0)),
                      ])
                ],
              )
            ])),
      ),
    );
  }
}
