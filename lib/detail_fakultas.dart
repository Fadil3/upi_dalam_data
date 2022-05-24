import "package:flutter/material.dart";
import 'package:syncfusion_flutter_charts/charts.dart';

var informationTextStyle = const TextStyle(fontFamily: 'Oxygen');

class DetailFakultas extends StatefulWidget {
  final String fakultas;
  const DetailFakultas(this.fakultas, {Key? key}) : super(key: key);

  @override
  State<DetailFakultas> createState() => _DetailFakultasState();
}

class _DetailFakultasState extends State<DetailFakultas> {
  List<Map> infoFakultas = [
    {
      "name": "FPMIPA",
      "url_image": "images/fakultas/FPMIPA.jpg",
      "full_name": "Fakultas Pendidikan Matematika dan Ilmu Pengetahuan Alam",
      "gallery": [
        "images/fakultas/FPMIPA.jpg",
        "images/fakultas/FPMIPA.jpg",
        "images/fakultas/FPMIPA.jpg",
        "images/fakultas/FPMIPA.jpg",
        "images/fakultas/FPMIPA.jpg",
        "images/fakultas/FPMIPA.jpg",
      ],
      "ratio": "1:30",
      "avg_study_time": "3.5",
      "prodi": [
        {
          "name": "Pendidikan Matematika",
          "jenjang": "S1",
          "akreditasi": "A",
          "url_image": "images/fakultas/FPMIPA.jpg",
          "slug": "s1-pendidikan-matematika",
        },
        {
          "name": "Pendidikan Biologi",
          "jenjang": "S1",
          "akreditasi": "A",
          "url_image": "images/fakultas/FPMIPA.jpg",
          "slug": "s1-pendidikan-biologi",
        },
        {
          "name": "Pendidikan Kimia",
          "jenjang": "S1",
          "akreditasi": "A",
          "url_image": "images/fakultas/FPMIPA.jpg",
          "slug": "s1-pendidikan-kimia",
        },
        {
          "name": "Pendidikan Fisika",
          "jenjang": "S1",
          "akreditasi": "A",
          "url_image": "images/fakultas/FPMIPA.jpg",
          "slug": "s1-pendidikan-fisika",
        },
        {
          "name": "Pendidikan Ilmu Komputer",
          "jenjang": "S1",
          "akreditasi": "A",
          "url_image": "images/fakultas/FPMIPA.jpg",
          "slug": "s1-pendidikan-ilmu-komputer",
        },
        {
          "name": "International Program on Science Education",
          "jenjang": "S1",
          "akreditasi": "A",
          "url_image": "images/fakultas/FPMIPA.jpg",
          "slug": "s1-international-program-on-science-education",
        }
      ]
    },
    {"name": "FIP", "url_image": "images/fakultas/FIP.png"},
    {"name": "FPIPS", "url_image": "images/fakultas/FPIPS.jpg"},
    {"name": "FPBS", "url_image": "images/fakultas/FPBS.jpg"},
    {"name": "FPSD", "url_image": "images/fakultas/FPSD.jpg"},
    {"name": "FPTK", "url_image": "images/fakultas/FPTK.jpg"},
    {"name": "FPOK", "url_image": "images/fakultas/FPOK.jpg"},
    {"name": "FPEB", "url_image": "images/fakultas/FPEB.jpeg"},
  ];
  @override
  Widget build(BuildContext context) {
    Map data = infoFakultas
        .firstWhere((fakultas) => fakultas["name"] == widget.fakultas);
    return Scaffold(
      body: SingleChildScrollView(
          child: Center(
              child: SizedBox(
        width: 500,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset(data["url_image"]),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: Text(
                data["full_name"],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Staatliches',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const Icon(Icons.align_horizontal_left_outlined),
                      const SizedBox(height: 8.0),
                      Text(
                        "Rasio ${data["ratio"]}",
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const Icon(Icons.timelapse_outlined),
                      const SizedBox(height: 8.0),
                      Text(
                        "${data["avg_study_time"]} tahun masa studi",
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const Icon(Icons.home_work_sharp),
                      const SizedBox(height: 8.0),
                      Text(
                        "${data["prodi"].length.toString()} Prodi",
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.all(5)),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: data["gallery"].map<Widget>((url) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(url),
                    ),
                  );
                }).toList(),
              ),
            ),
            const Padding(padding: EdgeInsets.all(5)),
            const Text(
              "Statistik Fakultas",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(padding: EdgeInsets.all(5)),
            const Text(
              "Program Studi",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(padding: EdgeInsets.all(5)),
            ...data["prodi"].map((prodi) {
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: Card(
                  child: ListTile(
                    title: Text(prodi["name"]),
                    subtitle: Text(prodi["jenjang"]),
                    trailing: Text("Akreditasi : ${prodi["akreditasi"]}"),
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ))),
    );
  }
}
