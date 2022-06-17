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
                                    child: Column(children: const [
                                  Padding(
                                    padding: EdgeInsets.all(
                                        10), //20 pixel ke semua arah
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(2),
                                    child: Text(
                                      'Jumlah Mahasiswa Belum Bayar UKT \n Universitas Pendidikan Indonesia',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ), //20 pixel ke semua arah
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(
                                        5), //20 pixel ke semua arah
                                  ),
                                  Text(
                                    '52',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  ),
                                  Padding(
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
                                  ], rows: const [
                                    DataRow(cells: [
                                      DataCell(Text('FPMIPA')),
                                      DataCell(Text('Ilmu Komputer')),
                                      DataCell(Text('6')),
                                      DataCell(Text('1900303')),
                                      DataCell(Text('2.000.000')),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('FPMIPA')),
                                      DataCell(Text('Ilmu Komputer')),
                                      DataCell(Text('6')),
                                      DataCell(Text('1900618')),
                                      DataCell(Text('3.000.000')),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('FPMIPA')),
                                      DataCell(Text('Ilmu Komputer')),
                                      DataCell(Text('6')),
                                      DataCell(Text('1903907')),
                                      DataCell(Text('4.000.000')),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('FPMIPA')),
                                      DataCell(Text('Ilmu Komputer')),
                                      DataCell(Text('6')),
                                      DataCell(Text('1907998')),
                                      DataCell(Text('1.000.000')),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('FPMIPA')),
                                      DataCell(Text('Ilmu Komputer')),
                                      DataCell(Text('6')),
                                      DataCell(Text('1900141')),
                                      DataCell(Text('2.000.000')),
                                    ]),
                                  ])
                                ])),
                              ],
                            )),
                        const Padding(padding: EdgeInsets.all(10)),
                        const Padding(padding: EdgeInsets.all(8.0)),
                      ])
                ],
              )
            ])),
      ),
    );
  }
}
