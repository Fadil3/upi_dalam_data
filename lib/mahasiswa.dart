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
        child: Column(children: <Widget>[
          Image.asset(
            "images/logo-upi.png",
            height: 50,
            width: 50,
          ),
          SizedBox(
            width: 300,
            child: Column(children: [
              Card(
                  elevation: 2,
                  child: Column(
                    children: const [
                      Text(
                          "Jumlah Mahasiswa Universitas Pendidikan Indonesia",
                          textAlign: TextAlign.center),
                      Text(
                        '41.633',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  )),
            ]),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
          ),
          SizedBox(
            width: 300,
            height: 35,
            child: ElevatedButton(
              onPressed: () {
                // Respond to button press
              },
              child: const Text('DATA MAHASISWA BELUM BAYAR UKT'),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
          ),
          SizedBox(
            width: 300,
            height: 35,
            child: ElevatedButton(
              onPressed: () {
                // Respond to button press
              },
              child: const Text('RATA-RATA LAMA STUDI'),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
          ),
          SizedBox(
            width: 300,
            height: 35,
            child: ElevatedButton(
              onPressed: () {
                // Respond to button press
              },
              child: const Text('MAHASISWA PROGRAM DI LUAR KAMPUS'),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
          ),
          SizedBox(
            width: 300,
            height: 35,
            child: ElevatedButton(
              onPressed: () {
                // Respond to button press
              },
              child: const Text('DATA PENGAJUAN BEASISWA'),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
          ),
        ]),
      ),
    );
  }
}
