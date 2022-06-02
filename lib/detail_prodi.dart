import "package:flutter/material.dart";
import 'package:syncfusion_flutter_charts/charts.dart';

var informationTextStyle = const TextStyle(fontFamily: 'Oxygen');

class DetailProdi extends StatefulWidget {
  final String prodi;
  const DetailProdi(this.prodi, {Key? key}) : super(key: key);

  @override
  State<DetailProdi> createState() => _DetailProdiState();
}

class _DetailProdiState extends State<DetailProdi> {
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

  TooltipBehavior? _tooltipBehavior;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Text("slug : ${widget.prodi}"),
    ));
  }
}
