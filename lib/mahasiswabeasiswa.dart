import "package:flutter/material.dart";
import 'package:upi_dalam_data/contact.dart';
import "package:upi_dalam_data/home.dart";
import 'package:upi_dalam_data/setting.dart';

class MahasiswaBeasiswa extends StatefulWidget {
  const MahasiswaBeasiswa({Key? key}) : super(key: key);

  @override
  State<MahasiswaBeasiswa> createState() => _MahasiswaBeasiswaState();
}

class _MahasiswaBeasiswaState extends State<MahasiswaBeasiswa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Pengajuan Beasiswa'),
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
                                      'Data Pengajuan Beasiswa \n Universitas Pendidikan Indonesia',
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
                                    '15',
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
                                    'Data Pengajuan Beasiswa',
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
                                      label: Text('NIM'),
                                    ),
                                    DataColumn(
                                      label: Text('Nama'),
                                    ),
                                    DataColumn(
                                      label: Text('Beasiswa'),
                                    ),
                                  ], rows: const [
                                    DataRow(cells: [
                                      DataCell(Text('FPMIPA')),
                                      DataCell(Text('Ilmu Komputer')),
                                      DataCell(Text('123456')),
                                      DataCell(Text('Bimantoro')),
                                      DataCell(Text('Djarum')),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('FPMIPA')),
                                      DataCell(Text('Ilmu Komputer')),
                                      DataCell(Text('123456')),
                                      DataCell(Text('Bimantoro')),
                                      DataCell(Text('Djarum')),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('FPMIPA')),
                                      DataCell(Text('Ilmu Komputer')),
                                      DataCell(Text('123456')),
                                      DataCell(Text('Bimantoro')),
                                      DataCell(Text('Djarum')),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('FPMIPA')),
                                      DataCell(Text('Ilmu Komputer')),
                                      DataCell(Text('123456')),
                                      DataCell(Text('Bimantoro')),
                                      DataCell(Text('Djarum')),
                                    ]),
                                  ])
                                ])),
                              ],
                            )),
                        const Padding(padding: EdgeInsets.all(10)),
                        SizedBox(
                          width: 300,
                          height: 35,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Wrap(
                              children: const <Widget>[
                                Icon(
                                  Icons.download,
                                  color: Colors.white,
                                  size: 20.0,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Download as CSV",
                                    style: TextStyle(fontSize: 16)),
                              ],
                            ),
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
