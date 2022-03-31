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
                width: 350,
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Dosen()),
                    );
                  },
                  child: 
                  Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
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
                    ],
                    
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                    elevation: 5,
                  ),
                ),
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.all(10.0)),
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
                width: 350,
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Mahasiswa()),
                    );
                  },
                  child: 
                  Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Column(
                    children: [
                      Image.network(
                        'https://images.unsplash.com/photo-1606761568499-6d2451b23c66?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80',
                        fit: BoxFit.cover,
                      ),
                      ListTile(
                        title: const Text('Data Mahasiswa'),
                        subtitle: Text(
                          'Penelitian, Pengabdian, dan Pengajaran',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                        leading: const Icon(Icons.school_outlined),
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
            ],
          ),
          const Padding(padding: EdgeInsets.all(10.0)),
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
                width: 350,
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Prodi()),
                    );
                  },
                  child: 
                  Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Column(
                    children: [
                      Image.network(
                        'https://images.unsplash.com/photo-1562774053-701939374585?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=886&q=80',
                        fit: BoxFit.cover,
                      ),
                      ListTile(
                        title: const Text('Data Prodi'),
                        subtitle: Text(
                          'Penelitian, Pengabdian, dan Pengajaran',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                        leading: const Icon(Icons.home_work_outlined),
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
            ],
          ),
          const Padding(padding: EdgeInsets.all(10.0)),
        ],
      ),
    ],
    )
  ); 
  }
}
