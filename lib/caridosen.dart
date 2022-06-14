import 'package:flutter/material.dart';
import 'package:upi_dalam_data/detail_dosen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class IsiDataDosen {
  String nama;
  String jabatan;
  String golongan;
  IsiDataDosen(
      {required this.nama, required this.jabatan, required this.golongan});
}

class DataDosen {
  List<IsiDataDosen> ListPop = <IsiDataDosen>[];

  DataDosen(Map<String, dynamic> json) {
    // isi listPop disini
    var data = json["data"]["dosen"];
    // print(data);
    for (var val in data) {
      print(val);
      var nama = val["nama"];
      var jabatan = val["jabatan"];
      var golongan = val["golongan"];
      ListPop.add(
          IsiDataDosen(nama: nama, jabatan: jabatan, golongan: golongan));
      // print(val);
    }
  }
  //map dari json ke atribut
  factory DataDosen.fromJson(Map<String, dynamic> json) {
    return DataDosen(json);
  }
}

void main() {
  runApp(const CariDosen());
}

class CariDosen extends StatefulWidget {
  const CariDosen({Key? key}) : super(key: key);
  @override
  CariDosenState createState() {
    return CariDosenState();
  }
}

class CariDosenState extends State<CariDosen> {
  late Future<DataDosen> futureDataDosen;

  String url = "http://165.22.109.98:9999/dosen";

  //fetch data
  Future<DataDosen> fetchData() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // jika server mengembalikan 200 OK (berhasil),
      // parse json
      return DataDosen.fromJson(jsonDecode(response.body));
    } else {
      // jika gagal (bukan  200 OK),
      // lempar exception
      throw Exception('Gagal load');
    }
  }

  final textEditController = TextEditingController();
  String _nama = "";
  String pilihanSalam = "DAA";
  String pilihanSalamOut = "";

  TableRow buildRow(List<String> cells) => TableRow(
          children: cells.map((cell) {
        return Padding(
          padding: EdgeInsets.all(30),
          child: Text(cell),
        );
      }).toList());

  @override
  void initState() {
    super.initState();
    futureDataDosen = fetchData();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> filter = [];
    var itm1 = const DropdownMenuItem<String>(
      value: "DAA",
      child: Text("Nama A-Z"),
    );
    var itm2 = const DropdownMenuItem<String>(
      value: "DAB",
      child: Text("Nama Z-A"),
    );
    var itm3 = const DropdownMenuItem<String>(
      value: "Golting",
      child: Text("Golongan Tertinggi"),
    );
    var itm4 = const DropdownMenuItem<String>(
      value: "Golren",
      child: Text("Golongan Terendah"),
    );
    var itm5 = const DropdownMenuItem<String>(
      value: "Jabting",
      child: Text("Jabatan Teringgi"),
    );
    var itm6 = const DropdownMenuItem<String>(
      value: "Jabren",
      child: Text("Jabatan Terendah"),
    );
    filter.add(itm1);
    filter.add(itm2);
    filter.add(itm5);
    filter.add(itm6);
    filter.add(itm3);
    filter.add(itm4);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cari Dosen"),
      ),
      body: ListView(children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  SizedBox(
                    width: 500,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Cari Dosen',
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Urutkan berdasarkan:',
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 32, 30, 30)),
                    ),
                  ),
                  DropdownButton(
                    value: pilihanSalam,
                    items: filter,
                    onChanged: (String? newValue) {
                      setState(() {
                        if (newValue != null) {
                          pilihanSalam = newValue;
                        }
                      });
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(10), //20 pixel ke semua arah
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _nama = textEditController
                              .text; //akses text via controller
                          pilihanSalamOut = pilihanSalam;
                        }); //refresh
                      },
                      child: const Text('Urutkan'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Padding(padding: EdgeInsets.all(10)),
        Center(
            child: SizedBox(
                width: 480,
                child: FutureBuilder<DataDosen>(
                  future: futureDataDosen,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Center(
                        //gunakan listview builder
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot
                              .data!.ListPop.length, //asumsikan data ada isi
                          itemBuilder: (context, index) {
                            return Container(
                                decoration: BoxDecoration(border: Border.all()),
                                padding: const EdgeInsets.all(14),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(snapshot.data!.ListPop[index].nama),
                                    Text(snapshot.data!.ListPop[index].jabatan),
                                    Text(
                                        snapshot.data!.ListPop[index].golongan),
                                    Padding(
                                      padding: EdgeInsets.all(
                                          10), //20 pixel ke semua arah
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailDosen()),
                                          );
                                          ; //refresh
                                        },
                                        child: const Text('Detail Dosen'),
                                      ),
                                    ),
                                  ],
                                ));
                          },
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return CircularProgressIndicator();
                  },
                )))
      ]), //column center
    );
  }
}
