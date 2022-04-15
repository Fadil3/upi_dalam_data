import "package:flutter/material.dart";
import 'package:upi_dalam_data/contact.dart';
import "package:upi_dalam_data/home.dart";
import 'package:upi_dalam_data/setting.dart';

class Mahasiswa extends StatefulWidget {
  const Mahasiswa({Key? key}) : super(key: key);

  @override
  State<Mahasiswa> createState() => _MahasiswaState();
}

class _MahasiswaState extends State<Mahasiswa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mahasiswa'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Image.asset(
              "images/logo-upi.png",
              height: 50,
              width: 50,
            ),
            SizedBox(
              width: 350,
              child: Column(children: [
                Card(
                  elevation: 2,
                  child: Column(
                    children: const [
                      Text("Jumlah Mahasiswa Universitas Pendidikan Indonesia",
                          textAlign: TextAlign.center),
                      Text(
                        '41.633',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ]),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
            ),
            SizedBox(
              width: 350,
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {},
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text('Data Belum Bayar UKT'),
                        subtitle: Text(
                          'Jumlah Belum Bayar UKT:                        52 Mahasiswa',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                        isThreeLine: true,
                        leading: const Icon(Icons.supervisor_account_outlined),
                      ),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
            ),
            SizedBox(
              width: 350,
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {},
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text('Rata-rata Lama Studi'),
                        subtitle: Text(
                          'Rata-rata Lama Studi Mahasiswa:                4 Tahun',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                        isThreeLine: true,
                        leading: const Icon(Icons.supervisor_account_outlined),
                      ),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
            ),
            SizedBox(
              width: 350,
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {},
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text('Mahasiswa Program di Luar Kampus'),
                        subtitle: Text(
                          'Jumlah Mahasiswa Program di Luar Kampus: 20 Mahasiswa',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                        leading: const Icon(Icons.supervisor_account_outlined),
                        isThreeLine: true,
                      ),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
            ),
            SizedBox(
              width: 350,
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {},
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text('Data Pengajuan Beasiswa'),
                        subtitle: Text(
                          'Jumlah Mahasiswa yang Mengajukan Beasiswa: 15 Mahasiswa',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                        isThreeLine: true,
                        leading: const Icon(Icons.supervisor_account_outlined),
                      ),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
            ),
          ]),
        ),
      ),
    );
  }
}
