import "package:flutter/material.dart";
import 'detail_fakultas.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class IsiDataFakultas {
  String slug;
  String name;
  String url_image;
  IsiDataFakultas(
      {required this.name, required this.slug, required this.url_image});
}

class DataFakultas {
  List<IsiDataFakultas> ListPop = <IsiDataFakultas>[];

  DataFakultas(Map<String, dynamic> json) {
    // isi listPop disini
    var data = json["data"]["fakultas"];
    // print(data);
    for (var val in data) {
      var slug = val["slug"];
      var name = val["name"];
      var url_image = val["url_image"];
      ListPop.add(
          IsiDataFakultas(slug: slug, name: name, url_image: url_image));
      // print(val);
    }
  }
  //map dari json ke atribut
  factory DataFakultas.fromJson(Map<String, dynamic> json) {
    return DataFakultas(json);
  }
}

class Fakultas extends StatefulWidget {
  const Fakultas({Key? key}) : super(key: key);

  @override
  State<Fakultas> createState() => _FakultasState();
}

class _FakultasState extends State<Fakultas> {
  late Future<DataFakultas> futureDataFakultas;

  String url = "http://165.22.109.98:9999/fakultas";

  //fetch data
  Future<DataFakultas> fetchData() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // jika server mengembalikan 200 OK (berhasil),
      // parse json
      return DataFakultas.fromJson(jsonDecode(response.body));
    } else {
      // jika gagal (bukan  200 OK),
      // lempar exception
      throw Exception('Gagal load');
    }
  }

  @override
  void initState() {
    super.initState();
    futureDataFakultas = fetchData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fakultas"),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        const Padding(padding: EdgeInsets.all(10)),
        SizedBox(
          width: 480,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Bumi Siliwangi & Kampus Daerah",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
              ]),
        ),
        const Padding(padding: EdgeInsets.all(10)),
        Center(
            child: SizedBox(
                width: 480,
                child: FutureBuilder<DataFakultas>(
                  future: futureDataFakultas,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Wrap(
                        spacing: 20.0,
                        runSpacing: 20.0,
                        children: snapshot.data!.ListPop
                            .map((data) => Column(
                                  children: [
                                    InkWell(
                                        splashColor: Colors.blue.withAlpha(30),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            // bring slug to detail_fakultas
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailFakultas(data.slug)),
                                          );
                                        },
                                        child: Container(
                                          width: 100,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              image:
                                                  NetworkImage(data.url_image),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        )),
                                    const Padding(padding: EdgeInsets.all(5)),
                                    Text(
                                      data.name,
                                    ),
                                  ],
                                ))
                            .toList(),
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return CircularProgressIndicator();
                  },
                ))),
      ])),
    );
  }
}
