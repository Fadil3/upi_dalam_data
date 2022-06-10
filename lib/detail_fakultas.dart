import "package:flutter/material.dart";
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:upi_dalam_data/detail_prodi.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

var informationTextStyle = const TextStyle(fontFamily: 'Oxygen');

class IsiDataProdi {
  late String name;
  late String jenjang;
  late String akreditasi;
  late String urlImage;
  late String slug;

  IsiDataProdi({
    required this.slug,
    required this.name,
    required this.urlImage,
    required this.akreditasi,
    required this.jenjang,
  });
}

class IsiDataFakultas {
  String slug;
  String name;
  String urlImage;
  String ratio;
  String avgStudyTime;
  List<IsiDataProdi> listProdi = <IsiDataProdi>[];

  IsiDataFakultas({
    required this.name,
    required this.slug,
    required this.urlImage,
    required this.ratio,
    required this.avgStudyTime,
    required this.listProdi,
  });

  factory IsiDataFakultas.fromJson(Map<String, dynamic> json) {
    var prodi = json["data"]["prodi"];
    List<IsiDataProdi> listProdi = <IsiDataProdi>[];
    for (var val in prodi) {
      var slug = val["slug"];
      var name = val["name"];
      var urlImage = val["url_image"];
      var akreditasi = val["akreditasi"];
      var jenjang = val["jenjang"];

      listProdi.add(IsiDataProdi(
          slug: slug,
          name: name,
          urlImage: urlImage,
          akreditasi: akreditasi,
          jenjang: jenjang));
    }

    return IsiDataFakultas(
      slug: json["data"]["slug"],
      name: json["data"]["name"],
      urlImage: json["data"]["url_image"],
      ratio: json["data"]["ratio"],
      avgStudyTime: json["data"]["avg_study_time"],
      listProdi: listProdi,
    );
  }
}

class DetailFakultas extends StatefulWidget {
  final String slug;
  const DetailFakultas(
    this.slug, {
    Key? key,
  }) : super(key: key);

  @override
  State<DetailFakultas> createState() => _DetailFakultasState();
}

class _DetailFakultasState extends State<DetailFakultas> {
  late Future<IsiDataFakultas> futureIsiDataFakultas;
  late String slug = widget.slug;

  //fetch data
  Future<IsiDataFakultas> fetchData() async {
    String url = "http://165.22.109.98:9999/fakultas/$slug";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // jika server mengembalikan 200 OK (berhasil),
      // parse json
      return IsiDataFakultas.fromJson(jsonDecode(response.body));
    } else {
      // jika gagal (bukan  200 OK),
      // lempar exception
      throw Exception('Gagal load');
    }
  }

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
  List<_ChartKeketatan>? chartKeketatan;
  List<_ChartJabatanFungsional>? chartJabatanFungsional;
  List<_ChartPendidikan>? chartPendidikan;
  List<_ChartGender>? chartGender;

  TooltipBehavior? _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior =
        TooltipBehavior(enable: true, header: '', canShowMarker: false);
    chartJabatanFungsional = <_ChartJabatanFungsional>[
      _ChartJabatanFungsional(
        '2020',
        4,
        8,
        12,
        22,
        5,
      ),
      _ChartJabatanFungsional(
        '2021',
        2,
        20,
        9,
        21,
        10,
      ),
    ];
    chartKeketatan = <_ChartKeketatan>[
      _ChartKeketatan(2017, 18, 17, 7),
      _ChartKeketatan(2018, 29, 29, 11),
      _ChartKeketatan(2019, 18, 17, 7),
      _ChartKeketatan(2020, 18, 11, 7),
      _ChartKeketatan(2021, 20, 12, 8),
      _ChartKeketatan(2022, 18, 10, 4),
    ];
    chartPendidikan = <_ChartPendidikan>[
      _ChartPendidikan("2021", 53, 47),
      _ChartPendidikan("2022", 41, 59),
    ];
    chartGender = <_ChartGender>[
      _ChartGender("2021", 38, 62),
      _ChartGender("2022", 40, 60),
    ];
    super.initState();
    futureIsiDataFakultas = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    Map data =
        infoFakultas.firstWhere((fakultas) => fakultas["name"] == "FPMIPA");
    return Scaffold(
      body: SingleChildScrollView(
          child: Center(
              child: SizedBox(
                  width: 500,
                  child: FutureBuilder<IsiDataFakultas>(
                      future: futureIsiDataFakultas,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return (Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Image.asset(data["url_image"]),
                                  SafeArea(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                margin:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        const Icon(Icons
                                            .align_horizontal_left_outlined),
                                        const SizedBox(height: 8.0),
                                        Text(
                                          "Rasio ${snapshot.data!.ratio}",
                                          style: informationTextStyle,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        const Icon(Icons.timelapse_outlined),
                                        const SizedBox(height: 8.0),
                                        Text(
                                          "${snapshot.data!.avgStudyTime} tahun masa studi",
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
                              SfCartesianChart(
                                plotAreaBorderWidth: 0,
                                title: ChartTitle(
                                    text: 'Keketatan Penerimaan Mahasiswa'),
                                legend: Legend(
                                    isVisible: true,
                                    overflowMode: LegendItemOverflowMode.wrap),
                                primaryXAxis: NumericAxis(
                                    edgeLabelPlacement:
                                        EdgeLabelPlacement.shift,
                                    interval: 2,
                                    majorGridLines:
                                        const MajorGridLines(width: 0)),
                                primaryYAxis: NumericAxis(
                                    labelFormat: '{value}',
                                    axisLine: const AxisLine(width: 0),
                                    majorTickLines: const MajorTickLines(
                                        color: Colors.transparent)),
                                series: _getDefaultLineSeries(),
                                tooltipBehavior: TooltipBehavior(enable: true),
                              ),
                              SfCartesianChart(
                                plotAreaBorderWidth: 1,
                                title: ChartTitle(
                                    text:
                                        'Rasio Dosen Berdasarkan Jabatan Fungsional'),
                                legend: Legend(
                                    isVisible: true,
                                    overflowMode: LegendItemOverflowMode.wrap),
                                primaryXAxis: CategoryAxis(
                                  majorGridLines:
                                      const MajorGridLines(width: 0),
                                ),
                                series: _getStackedColumnSeries(),
                                tooltipBehavior: _tooltipBehavior,
                              ),
                              SfCartesianChart(
                                plotAreaBorderWidth: 1,
                                title: ChartTitle(
                                    text:
                                        'Rasio Dosen Berdasarkan Jenjang Pendidikan Terakhir'),
                                legend: Legend(
                                    isVisible: true,
                                    overflowMode: LegendItemOverflowMode.wrap),
                                primaryXAxis: CategoryAxis(
                                  majorGridLines:
                                      const MajorGridLines(width: 0),
                                ),
                                series: _getStackedColumnSeriesPendidikan(),
                                tooltipBehavior: _tooltipBehavior,
                              ),
                              SfCartesianChart(
                                plotAreaBorderWidth: 1,
                                title: ChartTitle(
                                    text: 'Rasio Dosen Berdasarkan Gender'),
                                legend: Legend(
                                    isVisible: true,
                                    overflowMode: LegendItemOverflowMode.wrap),
                                primaryXAxis: CategoryAxis(
                                  majorGridLines:
                                      const MajorGridLines(width: 0),
                                ),
                                series: _getStackedColumnSeriesGender(),
                                tooltipBehavior: _tooltipBehavior,
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
                              Column(
                                children: snapshot.data!.listProdi
                                    .map<Widget>((prodi) {
                                  return Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: InkWell(
                                        splashColor: Colors.blue.withAlpha(30),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            // bring state to detail prodi
                                            // hardcode route
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailProdi(prodi.slug)),
                                          );
                                        },
                                        child: Card(
                                          child: ListTile(
                                            title: Text(prodi.name),
                                            subtitle: Text(prodi.jenjang),
                                            trailing: Text(
                                                "Akreditasi : ${prodi.akreditasi}"),
                                          ),
                                        ),
                                      ));
                                }).toList(),
                              ),
                            ],
                          ));
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return CircularProgressIndicator();
                      })

                  // ),
                  ))),
    );
  }

  /// The method returns line series to chart.
  List<LineSeries<_ChartKeketatan, num>> _getDefaultLineSeries() {
    return <LineSeries<_ChartKeketatan, num>>[
      LineSeries<_ChartKeketatan, num>(
          animationDuration: 2500,
          dataSource: chartKeketatan!,
          xValueMapper: (_ChartKeketatan data, _) => data.x,
          yValueMapper: (_ChartKeketatan data, _) => data.y,
          width: 2,
          name: 'SNMPTN',
          markerSettings: const MarkerSettings(isVisible: true)),
      LineSeries<_ChartKeketatan, num>(
          animationDuration: 2500,
          dataSource: chartKeketatan!,
          width: 2,
          name: 'SBMPTN',
          xValueMapper: (_ChartKeketatan data, _) => data.x,
          yValueMapper: (_ChartKeketatan data, _) => data.y2,
          markerSettings: const MarkerSettings(isVisible: true)),
      LineSeries<_ChartKeketatan, num>(
          animationDuration: 2500,
          dataSource: chartKeketatan!,
          width: 2,
          name: 'SMUPI',
          xValueMapper: (_ChartKeketatan data, _) => data.x,
          yValueMapper: (_ChartKeketatan data, _) => data.y3,
          markerSettings: const MarkerSettings(isVisible: true))
    ];
  }

  List<StackedColumn100Series<_ChartJabatanFungsional, String>>
      _getStackedColumnSeries() {
    return <StackedColumn100Series<_ChartJabatanFungsional, String>>[
      StackedColumn100Series<_ChartJabatanFungsional, String>(
          dataSource: chartJabatanFungsional!,
          xValueMapper: (_ChartJabatanFungsional data, _) => data.tahun,
          yValueMapper: (_ChartJabatanFungsional data, _) => data.tp,
          name: 'Tenaga Pengajar'),
      StackedColumn100Series<_ChartJabatanFungsional, String>(
          dataSource: chartJabatanFungsional!,
          xValueMapper: (_ChartJabatanFungsional data, _) => data.tahun,
          yValueMapper: (_ChartJabatanFungsional data, _) => data.aa,
          name: 'Asisten Ahli'),
      StackedColumn100Series<_ChartJabatanFungsional, String>(
          dataSource: chartJabatanFungsional!,
          xValueMapper: (_ChartJabatanFungsional data, _) => data.tahun,
          yValueMapper: (_ChartJabatanFungsional data, _) => data.lk,
          name: 'Lektor'),
      StackedColumn100Series<_ChartJabatanFungsional, String>(
          dataSource: chartJabatanFungsional!,
          xValueMapper: (_ChartJabatanFungsional data, _) => data.tahun,
          yValueMapper: (_ChartJabatanFungsional data, _) => data.lkp,
          name: 'Lektor Kepala'),
      StackedColumn100Series<_ChartJabatanFungsional, String>(
          dataSource: chartJabatanFungsional!,
          xValueMapper: (_ChartJabatanFungsional data, _) => data.tahun,
          yValueMapper: (_ChartJabatanFungsional data, _) => data.gb,
          name: 'Guru Besar')
    ];
  }

  List<StackedColumn100Series<_ChartPendidikan, String>>
      _getStackedColumnSeriesPendidikan() {
    return <StackedColumn100Series<_ChartPendidikan, String>>[
      StackedColumn100Series<_ChartPendidikan, String>(
          dataSource: chartPendidikan!,
          xValueMapper: (_ChartPendidikan data, _) => data.tahun,
          yValueMapper: (_ChartPendidikan data, _) => data.s2,
          name: 'S2'),
      StackedColumn100Series<_ChartPendidikan, String>(
          dataSource: chartPendidikan!,
          xValueMapper: (_ChartPendidikan data, _) => data.tahun,
          yValueMapper: (_ChartPendidikan data, _) => data.s3,
          name: 'S3'),
    ];
  }

  List<StackedColumn100Series<_ChartGender, String>>
      _getStackedColumnSeriesGender() {
    return <StackedColumn100Series<_ChartGender, String>>[
      StackedColumn100Series<_ChartGender, String>(
          dataSource: chartGender!,
          xValueMapper: (_ChartGender data, _) => data.tahun,
          yValueMapper: (_ChartGender data, _) => data.l,
          name: 'Laki-Laki'),
      StackedColumn100Series<_ChartGender, String>(
          dataSource: chartGender!,
          xValueMapper: (_ChartGender data, _) => data.tahun,
          yValueMapper: (_ChartGender data, _) => data.p,
          name: 'Perempuan'),
    ];
  }
}

class _ChartJabatanFungsional {
  _ChartJabatanFungsional(
      this.tahun, this.tp, this.aa, this.lk, this.lkp, this.gb);
  final String tahun;
  final double tp;
  final double aa;
  final double lk;
  final double lkp;
  final double gb;
}

class _ChartKeketatan {
  _ChartKeketatan(this.x, this.y, this.y2, this.y3);
  final double x;
  final double y;
  final double y2;
  final double y3;
}

class _ChartPendidikan {
  _ChartPendidikan(this.tahun, this.s2, this.s3);
  final String tahun;
  final int s2;
  final int s3;
}

class _ChartGender {
  _ChartGender(this.tahun, this.l, this.p);
  final String tahun;
  final int l;
  final int p;
}
