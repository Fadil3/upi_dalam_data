import "package:flutter/material.dart";
import 'package:upi_dalam_data/pengabdian_chart.dart';
import 'package:upi_dalam_data/pengajaran_chart.dart';
import 'package:upi_dalam_data/pelatihan_chart.dart';

class Dosen extends StatefulWidget {
  const Dosen({Key? key}) : super(key: key);

  @override
  State<Dosen> createState() => _DosenState();
}

class _DosenState extends State<Dosen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dosen'),
      ),
      body: SingleChildScrollView(
          child: Column(
              // center
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(
                      width: 450,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Card(
                              child: Column(children: [
                            const Padding(
                              padding:
                                  EdgeInsets.all(10), //20 pixel ke semua arah
                            ),
                            Image.network(
                              'https://assets.pikiran-rakyat.com/crop/9x0:1219x852/x/photo/2022/01/24/3094145574.jpg',
                              height: 150,
                              width: 395,
                              fit: BoxFit.cover,
                            ),
                            const Padding(
                              padding:
                                  EdgeInsets.all(10), //20 pixel ke semua arah
                            ),
                            const Text(
                              'Jumlah Dosen',
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
                              padding:
                                  EdgeInsets.all(10), //20 pixel ke semua arah
                            ),
                            const Text(
                              '1338',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            const Padding(
                              padding:
                                  EdgeInsets.all(10), //20 pixel ke semua arah
                            ),
                            Container(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      //refresh
                                    },
                                    child: const Text('Cari Dosen'),
                                  ),
                                  padding: const EdgeInsets.all(20.0),
                                ),
                          ])),
                        ],
                      )),
                  SizedBox(
                      width: 405,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    padding: const EdgeInsets.all(5),
                                    child: Column(children: const [
                                      Text(
                                        "Jabatan Dosen Yang Terdiri Dari",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ])),
                                Container(
                                    padding: const EdgeInsets.all(5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(children: const [
                                            Text(
                                              "24",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text("Asisten Ahli")
                                          ]),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(children: const [
                                            Text(
                                              "24",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text("Lektor")
                                          ]),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(children: const [
                                            Text(
                                              "24",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text("Lektor Kepala")
                                          ]),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(children: const [
                                            Text(
                                              "24",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text("Guru Besar")
                                          ]),
                                        ),
                                      ],
                                    )),
                                Container(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      //refresh
                                    },
                                    child: const Text('Lihat Detail'),
                                  ),
                                  padding: const EdgeInsets.all(20.0),
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                  const Padding(padding: EdgeInsets.all(8.0)),
                ])
              ],
            )
          ])),
    );
  }
}
