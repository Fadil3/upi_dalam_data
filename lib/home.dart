import 'package:flutter/material.dart';
import 'package:upi_dalam_data/dosen.dart';
import 'package:upi_dalam_data/mahasiswa.dart';
import './prodi.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
    // center
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        // center
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            // center
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 450,
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Card(
                      child: Column(
                    children: [
                      Image.network(
                        'https://images.unsplash.com/photo-1524178232363-1fb2b075b655?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
                        fit: BoxFit.cover,
                      ),
                      ListTile(
                        title: const Text('Data Dosen'),
                        subtitle: Text(
                          'Penelitian, Pengabdian, dan Pengajaran',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                        leading: const Icon(Icons.supervisor_account_outlined),
                      ),
                      ButtonBar(alignment: MainAxisAlignment.center, children: [
                        TextButton.icon(
                          icon: const Text('Lihat'),
                          label: const Icon(Icons.arrow_forward_rounded),
                          onPressed: () {
                            // navigate to dosen
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Dosen()),
                            );
                          },
                        ),
                      ]),
                    ],
                  )),
                  const Padding(padding: EdgeInsets.all(8.0)),
                ]),
              ),
            ],
          ),
        ],
      ),
      Column(
        // center
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            // center
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 450,
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Card(
                      child: Column(
                    children: [
                      Image.network(
                        'https://images.unsplash.com/photo-1524178232363-1fb2b075b655?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
                        fit: BoxFit.cover,
                      ),
                      ListTile(
                        title: const Text('Data Program Studi'),
                        subtitle: Text(
                          'Penelitian, Pengabdian, dan Pengajaran',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                        leading: const Icon(Icons.supervisor_account_outlined),
                      ),
                      ButtonBar(alignment: MainAxisAlignment.center, children: [
                        TextButton.icon(
                          icon: const Text('Lihat'),
                          label: const Icon(Icons.arrow_forward_rounded),
                          onPressed: () {
                            // navigate to prodi page
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Prodi()));
                          },
                        ),
                      ]),
                    ],
                  )),
                  const Padding(padding: EdgeInsets.all(8.0)),
                ]),
              ),
            ],
          ),
        ],
      ),
      Column(
        // center
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            // center
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 450,
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Card(
                      child: Column(
                    children: [
                      Image.network(
                        'https://images.unsplash.com/photo-1524178232363-1fb2b075b655?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
                        fit: BoxFit.cover,
                      ),
                      ListTile(
                        title: const Text('Data Mahasiswa'),
                        subtitle: Text(
                          'Penelitian, Pengabdian, dan Pengajaran',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                        leading: const Icon(Icons.supervisor_account_outlined),
                      ),
                      ButtonBar(alignment: MainAxisAlignment.center, children: [
                        TextButton.icon(
                          icon: const Text('Lihat'),
                          label: const Icon(Icons.arrow_forward_rounded),
                          onPressed: () {
                            //navigate to mahasiswa
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Mahasiswa()));
                          },
                        ),
                      ]),
                    ],
                  )),
                  const Padding(padding: EdgeInsets.all(8.0)),
                ]),
              ),
            ],
          ),
        ],
      ),
    ],
  )); 
  }
}
