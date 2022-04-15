import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<AstData> _AstData;
  late List<LekData> _LektorData;
  late List<KepLekData> _KepLekData;
  late List<ProfData> _ProfData;

  @override
  void initState() {
    _AstData = getColumnDataAst();
    _LektorData = getColumnDataLektor();
    _KepLekData = getColumnDataKepLek();
    _ProfData = getColumnDataProf();
    // _KepLekData = getColumnDataKepLek();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 250,
              width: 400,
              child: SfCartesianChart(
                title: ChartTitle(text: 'Asisten Ahli'),
                tooltipBehavior: TooltipBehavior(
                    enable: true, activationMode: ActivationMode.longPress),
                series: <ChartSeries>[
                  ColumnSeries<AstData, String>(
                      dataSource: _AstData,
                      xValueMapper: (AstData dosen, _) => dosen.a,
                      yValueMapper: (AstData dosen, _) => dosen.b,
                      dataLabelSettings: DataLabelSettings(
                        isVisible: true,
                      ))
                ],
                primaryXAxis: CategoryAxis(),
                primaryYAxis: NumericAxis(),
              ),
            ),
            Container(
              height: 250,
              width: 400,
              child: SfCartesianChart(
                title: ChartTitle(text: 'Lektor'),
                tooltipBehavior: TooltipBehavior(
                    enable: true, activationMode: ActivationMode.longPress),
                series: <ChartSeries>[
                  ColumnSeries<LekData, String>(
                      dataSource: _LektorData,
                      xValueMapper: (LekData dosen, _) => dosen.a,
                      yValueMapper: (LekData dosen, _) => dosen.b,
                      dataLabelSettings: DataLabelSettings(
                        isVisible: true,
                      ))
                ],
                primaryXAxis: CategoryAxis(),
                primaryYAxis: NumericAxis(),
              ),
            ),
            Container(
              height: 250,
              width: 400,
              child: SfCartesianChart(
                title: ChartTitle(text: 'Lektor Kepala'),
                tooltipBehavior: TooltipBehavior(
                    enable: true, activationMode: ActivationMode.longPress),
                series: <ChartSeries>[
                  ColumnSeries<KepLekData, String>(
                      dataSource: _KepLekData,
                      xValueMapper: (KepLekData dosen, _) => dosen.a,
                      yValueMapper: (KepLekData dosen, _) => dosen.b,
                      dataLabelSettings: DataLabelSettings(
                        isVisible: true,
                      ))
                ],
                primaryXAxis: CategoryAxis(),
                primaryYAxis: NumericAxis(),
              ),
            ),
            Container(
              height: 250,
              width: 400,
              child: SfCartesianChart(
                title: ChartTitle(text: 'Guru Besar/Profesor'),
                tooltipBehavior: TooltipBehavior(
                    enable: true, activationMode: ActivationMode.longPress),
                series: <ChartSeries>[
                  ColumnSeries<ProfData, String>(
                      dataSource: _ProfData,
                      xValueMapper: (ProfData dosen, _) => dosen.a,
                      yValueMapper: (ProfData dosen, _) => dosen.b,
                      dataLabelSettings: DataLabelSettings(
                        isVisible: true,
                      ))
                ],
                primaryXAxis: CategoryAxis(),
                primaryYAxis: NumericAxis(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<AstData> getColumnDataAst() {
    List<AstData> columnData = <AstData>[
      AstData('III/A', 20),
      AstData('III/B', 15),
    ];
    return columnData;
  }

  List<LekData> getColumnDataLektor() {
    List<LekData> columnData = <LekData>[
      LekData('III/C', 25),
      LekData('III/D', 30),
    ];
    return columnData;
  }

  List<KepLekData> getColumnDataKepLek() {
    List<KepLekData> columnData = <KepLekData>[
      KepLekData('IV/A', 10),
      KepLekData('IV/B', 15),
      KepLekData('IV/C', 13),
    ];
    return columnData;
  }

  List<ProfData> getColumnDataProf() {
    List<ProfData> columnData = <ProfData>[
      ProfData('IV/D', 10),
      ProfData('IV/E', 8),
    ];
    return columnData;
  }
}

class AstData {
  AstData(this.a, this.b);
  final String a;
  final double b;
}

class LekData {
  LekData(this.a, this.b);
  final String a;
  final double b;
}

class KepLekData {
  KepLekData(this.a, this.b);
  final String a;
  final double b;
}

class ProfData {
  ProfData(this.a, this.b);
  final String a;
  final double b;
}
