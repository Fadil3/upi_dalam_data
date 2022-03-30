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
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    const Home(),
    const Contact(),
    const Setting(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
            height: 50,
            child: Card(
                elevation: 2,
                child: Text(
                  "Jumlah Mahasiwa Pendidikan Indonesia",
                  textAlign: TextAlign.center,
                )),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
          ),
          Container(
            width: 300,
            height: 35,
            child: ElevatedButton(
              onPressed: () {
                // Respond to button press
              },
              child: Text('DATA MAHASISWA BELUM BAYAR UKT'),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
          ),
          Container(
            width: 300,
            height: 35,
            child: ElevatedButton(
              onPressed: () {
                // Respond to button press
              },
              child: Text('RATA-RATA LAMA STUDI'),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
          ),
          Container(
            width: 300,
            height: 35,
            child: ElevatedButton(
              onPressed: () {
                // Respond to button press
              },
              child: Text('MAHASISWA PROGRAM DI LUAR KAMPUS'),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
          ),
          Container(
            width: 300,
            height: 35,
            child: ElevatedButton(
              onPressed: () {
                // Respond to button press
              },
              child: Text('DATA PENGAJUAN BEASISWA'),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
          ),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: 'Contact',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal[400],
        onTap: _onItemTapped,
      ),
    );
  }
}
