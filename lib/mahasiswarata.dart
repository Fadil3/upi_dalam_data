import 'package:syncfusion_flutter_charts/charts.dart';
import "package:flutter/material.dart";

class MahasiswaRata extends StatefulWidget {
  const MahasiswaRata({
    Key? key,
  }) : super(key: key);

  @override
  State<MahasiswaRata> createState() => _MahasiswaRataState();
}

class _MahasiswaRataState extends State<MahasiswaRata> {
  late List<RataMHS> _RataMHS;

  @override
  void initState() {
    _RataMHS = getColumnDataMHS();
    // _KepLekData = getColumnDataKepLek();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rata-rata Lama Studi Mahasiswa"),
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 350,
              width: 600,
              child: SfCartesianChart(
                title: ChartTitle(text: 'Rata-rata Lama Studi Mahasiswa'),
                tooltipBehavior: TooltipBehavior(
                    enable: true, activationMode: ActivationMode.longPress),
                series: <ChartSeries>[
                  ColumnSeries<RataMHS, String>(
                      dataSource: _RataMHS,
                      xValueMapper: (RataMHS mahasiswa, _) => mahasiswa.a,
                      yValueMapper: (RataMHS mahasiswa, _) => mahasiswa.b,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color.fromARGB(255, 58, 239, 239),
                      dataLabelSettings: DataLabelSettings(
                        isVisible: false,
                      ))
                ],
                primaryXAxis: CategoryAxis(),
                primaryYAxis: NumericAxis(),
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            SizedBox(
              width: 300,
              height: 35,
              child: ElevatedButton(
                onPressed: () {},
                child: Wrap(
                  children: const <Widget>[
                    Icon(
                      Icons.download,
                      color: Colors.white,
                      size: 20.0,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Download as CSV", style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  List<RataMHS> getColumnDataMHS() {
    List<RataMHS> columnData = <RataMHS>[
      RataMHS('FPMIPA', 4),
      RataMHS('FIP', 4),
      RataMHS('FPOK', 4),
      RataMHS('FPEB', 4),
      RataMHS('FPTK', 4),
      RataMHS('FPIPS', 4),
      RataMHS('FPBS', 4),
      RataMHS('FPSD', 4),
    ];
    return columnData;
  }
}

class RataMHS {
  RataMHS(this.a, this.b);
  final String a;
  final double b;
}
