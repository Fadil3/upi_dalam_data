import "package:flutter/material.dart";

class Dosen extends StatefulWidget {
  const Dosen({Key? key}) : super(key: key);

  @override
  State<Dosen> createState() => _DosenState();
}

class _DosenState extends State<Dosen> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                          padding: EdgeInsets.all(10), //20 pixel ke semua arah
                        ),
                        Image.network(
                          'https://assets.pikiran-rakyat.com/crop/9x0:1219x852/x/photo/2022/01/24/3094145574.jpg',
                          height: 150,
                          width: 395,
                          fit: BoxFit.cover,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10), //20 pixel ke semua arah
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
                          padding: EdgeInsets.all(10), //20 pixel ke semua arah
                        ),
                        const Text(
                          '1338',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10), //20 pixel ke semua arah
                        )
                      ])),
                    ],
                  )),
              SizedBox(
                  width: 450,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Card(
                          child: Column(children: [
                        const Padding(
                          padding: EdgeInsets.all(10), //20 pixel ke semua arah
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10), //20 pixel ke semua arah
                        ),
                        const Text(
                          'Tridarma Perguruan Tinggi',
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
                            label: Text('Data'),
                          ),
                          DataColumn(
                            label: Text('Presentase'),
                          ),
                          DataColumn(
                            label: Text(''),
                          ),
                        ], rows: [
                          DataRow(cells: [
                            const DataCell(Text('Pengabdian')),
                            const DataCell(Text('50%')),
                            DataCell(ElevatedButton.icon(
                                icon: const Text('Lihat'),
                                label: const Icon(Icons.arrow_forward_rounded),
                                onPressed: () {}))
                          ]),
                          DataRow(cells: [
                            const DataCell(Text('Pelatihan')),
                            const DataCell(Text('80%')),
                            DataCell(ElevatedButton.icon(
                                icon: const Text('Lihat'),
                                label: const Icon(Icons.arrow_forward_rounded),
                                onPressed: () {}))
                          ]),
                          DataRow(cells: [
                            const DataCell(Text('Pengajaran')),
                            const DataCell(Text('75%')),
                            DataCell(ElevatedButton.icon(
                                icon: const Text('Lihat'),
                                label: const Icon(Icons.arrow_forward_rounded),
                                onPressed: () {}))
                          ])
                        ])
                      ])),
                    ],
                  )),
              const Padding(padding: EdgeInsets.all(8.0)),
            ])
          ],
        )
      ]));
  }
}