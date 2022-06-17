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

class ChartGender {
  late String tahun;
  late int l;
  late int p;
  ChartGender({required this.tahun, required this.l, required this.p});
}

class ChartPendidikan {
  late String tahun;
  late int s2;
  late int s3;
  ChartPendidikan({required this.tahun, required this.s2, required this.s3});
}

class ChartKeketatan {
  late double tahun;
  late double snmptn;
  late double sbmptn;
  late double smupi;
  ChartKeketatan(
      {required this.tahun,
      required this.snmptn,
      required this.sbmptn,
      required this.smupi});
}

class ChartJabatanFungsional {
  late String tahun;
  late double tp;
  late double aa;
  late double lk;
  late double lkp;
  late double gb;
  ChartJabatanFungsional(
      {required this.tahun,
      required this.tp,
      required this.aa,
      required this.lk,
      required this.lkp,
      required this.gb});
}

class IsiDataFakultas {
  String slug;
  String name;
  String fullName;
  String urlImage;
  String ratio;
  String avgStudyTime;
  List<IsiDataProdi> listProdi = <IsiDataProdi>[];
  List<ChartGender> listChartGender = <ChartGender>[];
  List<ChartPendidikan> listChartPendidikan = <ChartPendidikan>[];
  List<ChartKeketatan> listChartKeketatan = <ChartKeketatan>[];
  List<ChartJabatanFungsional> listChartJabatanFungsional =
      <ChartJabatanFungsional>[];
  var gallery = [];

  IsiDataFakultas({
    required this.name,
    required this.slug,
    required this.urlImage,
    required this.ratio,
    required this.avgStudyTime,
    required this.listProdi,
    required this.fullName,
    required this.gallery,
    required this.listChartGender,
    required this.listChartPendidikan,
    required this.listChartKeketatan,
    required this.listChartJabatanFungsional,
  });

  factory IsiDataFakultas.fromJson(Map<String, dynamic> json) {
    var prodi = json["data"]["prodi"];
    List<IsiDataProdi> listProdi = <IsiDataProdi>[];
    List<ChartGender> listChartGender = <ChartGender>[];
    List<ChartPendidikan> listChartPendidikan = <ChartPendidikan>[];
    List<ChartKeketatan> listChartKeketatan = <ChartKeketatan>[];
    List<ChartJabatanFungsional> listChartJabatanFungsional =
        <ChartJabatanFungsional>[];
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

    var stats = json["data"]["stats"];
    for (var val in stats) {
      for (var val2 in val["data"]) {
        var title = val["title"];
        if (title.contains("Gender")) {
          var tahun = val2["tahun"];
          var l = val2["laki_laki"];
          var p = val2["perempuan"];
          listChartGender.add(ChartGender(tahun: tahun, l: l, p: p));
        } else if (title.contains("Pendidikan")) {
          var tahun = val2["tahun"];
          var s2 = val2["s2"];
          var s3 = val2["s3"];
          listChartPendidikan
              .add(ChartPendidikan(tahun: tahun, s2: s2, s3: s3));
        } else if (title.contains("Keketatan")) {
          var tahun = val2["tahun"];
          var snmptn = val2["snmptn"];
          var sbmptn = val2["sbmptn"];
          var smupi = val2["smupi"];
          listChartKeketatan.add(ChartKeketatan(
              tahun: tahun, snmptn: snmptn, sbmptn: sbmptn, smupi: smupi));
        } else if (title.contains("Fungsional")) {
          var tahun = val2["tahun"];
          var tp = val2["tp"];
          var aa = val2["aa"];
          var lk = val2["lk"];
          var lkp = val2["lkp"];
          var gb = val2["gb"];
          listChartJabatanFungsional.add(ChartJabatanFungsional(
              tahun: tahun, tp: tp, aa: aa, lk: lk, lkp: lkp, gb: gb));
        }
      }
    }

    return IsiDataFakultas(
        slug: json["data"]["slug"],
        name: json["data"]["name"],
        urlImage: json["data"]["url_image"],
        ratio: json["data"]["ratio"],
        avgStudyTime: json["data"]["avg_study_time"],
        fullName: json["data"]["full_name"],
        listProdi: listProdi,
        gallery: json["data"]["gallery"],
        listChartGender: listChartGender,
        listChartPendidikan: listChartPendidikan,
        listChartKeketatan: listChartKeketatan,
        listChartJabatanFungsional: listChartJabatanFungsional);
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

  TooltipBehavior? _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior =
        TooltipBehavior(enable: true, header: '', canShowMarker: false);
    super.initState();
    futureIsiDataFakultas = fetchData();
  }

  @override
  Widget build(BuildContext context) {
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
                                  Image.network(snapshot.data!.urlImage),
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
                                  snapshot.data!.fullName,
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
                                          "${snapshot.data!.listProdi.length.toString()} Prodi",
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
                                  children:
                                      snapshot.data!.gallery.map<Widget>((url) {
                                    return Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(url),
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
                                series: <LineSeries<ChartKeketatan, num>>[
                                  LineSeries<ChartKeketatan, num>(
                                      animationDuration: 2500,
                                      dataSource:
                                          snapshot.data!.listChartKeketatan,
                                      xValueMapper: (ChartKeketatan data, _) =>
                                          data.tahun,
                                      yValueMapper: (ChartKeketatan data, _) =>
                                          data.snmptn,
                                      width: 2,
                                      name: 'SNMPTN',
                                      markerSettings: const MarkerSettings(
                                          isVisible: true)),
                                  LineSeries<ChartKeketatan, num>(
                                      animationDuration: 2500,
                                      dataSource:
                                          snapshot.data!.listChartKeketatan,
                                      width: 2,
                                      name: 'SBMPTN',
                                      xValueMapper: (ChartKeketatan data, _) =>
                                          data.tahun,
                                      yValueMapper: (ChartKeketatan data, _) =>
                                          data.sbmptn,
                                      markerSettings: const MarkerSettings(
                                          isVisible: true)),
                                  LineSeries<ChartKeketatan, num>(
                                      animationDuration: 2500,
                                      dataSource:
                                          snapshot.data!.listChartKeketatan,
                                      width: 2,
                                      name: 'SMUPI',
                                      xValueMapper: (ChartKeketatan data, _) =>
                                          data.tahun,
                                      yValueMapper: (ChartKeketatan data, _) =>
                                          data.smupi,
                                      markerSettings:
                                          const MarkerSettings(isVisible: true))
                                ],
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
                                series: <
                                    StackedColumn100Series<
                                        ChartJabatanFungsional, String>>[
                                  StackedColumn100Series<ChartJabatanFungsional,
                                          String>(
                                      dataSource: snapshot
                                          .data!.listChartJabatanFungsional,
                                      xValueMapper:
                                          (ChartJabatanFungsional data, _) =>
                                              data.tahun,
                                      yValueMapper:
                                          (ChartJabatanFungsional data, _) =>
                                              data.tp,
                                      name: 'Tenaga Pengajar'),
                                  StackedColumn100Series<ChartJabatanFungsional,
                                          String>(
                                      dataSource: snapshot
                                          .data!.listChartJabatanFungsional,
                                      xValueMapper:
                                          (ChartJabatanFungsional data, _) =>
                                              data.tahun,
                                      yValueMapper:
                                          (ChartJabatanFungsional data, _) =>
                                              data.aa,
                                      name: 'Asisten Ahli'),
                                  StackedColumn100Series<ChartJabatanFungsional,
                                          String>(
                                      dataSource: snapshot
                                          .data!.listChartJabatanFungsional,
                                      xValueMapper:
                                          (ChartJabatanFungsional data, _) =>
                                              data.tahun,
                                      yValueMapper:
                                          (ChartJabatanFungsional data, _) =>
                                              data.lk,
                                      name: 'Lektor'),
                                  StackedColumn100Series<ChartJabatanFungsional,
                                          String>(
                                      dataSource: snapshot
                                          .data!.listChartJabatanFungsional,
                                      xValueMapper:
                                          (ChartJabatanFungsional data, _) =>
                                              data.tahun,
                                      yValueMapper:
                                          (ChartJabatanFungsional data, _) =>
                                              data.lkp,
                                      name: 'Lektor Kepala'),
                                  StackedColumn100Series<ChartJabatanFungsional,
                                          String>(
                                      dataSource: snapshot
                                          .data!.listChartJabatanFungsional,
                                      xValueMapper:
                                          (ChartJabatanFungsional data, _) =>
                                              data.tahun,
                                      yValueMapper:
                                          (ChartJabatanFungsional data, _) =>
                                              data.gb,
                                      name: 'Guru Besar')
                                ],
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
                                series: <
                                    StackedColumn100Series<ChartPendidikan,
                                        String>>[
                                  StackedColumn100Series<ChartPendidikan,
                                          String>(
                                      dataSource:
                                          snapshot.data!.listChartPendidikan,
                                      xValueMapper: (ChartPendidikan data, _) =>
                                          data.tahun,
                                      yValueMapper: (ChartPendidikan data, _) =>
                                          data.s2,
                                      name: 'S2'),
                                  StackedColumn100Series<ChartPendidikan,
                                          String>(
                                      dataSource:
                                          snapshot.data!.listChartPendidikan,
                                      xValueMapper: (ChartPendidikan data, _) =>
                                          data.tahun,
                                      yValueMapper: (ChartPendidikan data, _) =>
                                          data.s3,
                                      name: 'S3'),
                                ],
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
                                series: <
                                    StackedColumn100Series<ChartGender,
                                        String>>[
                                  StackedColumn100Series<ChartGender, String>(
                                      dataSource:
                                          snapshot.data!.listChartGender,
                                      xValueMapper: (ChartGender data, _) =>
                                          data.tahun,
                                      yValueMapper: (ChartGender data, _) =>
                                          data.l,
                                      name: 'Laki-Laki'),
                                  StackedColumn100Series<ChartGender, String>(
                                      dataSource:
                                          snapshot.data!.listChartGender,
                                      xValueMapper: (ChartGender data, _) =>
                                          data.tahun,
                                      yValueMapper: (ChartGender data, _) =>
                                          data.p,
                                      name: 'Perempuan'),
                                ],
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
                      })))),
    );
  }
}
