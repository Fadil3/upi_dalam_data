import "package:flutter/material.dart";

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  TableRow buildRow(List<String> cells) => TableRow(
    children: cells.map((cell){
      return Padding(
        padding: EdgeInsets.all(8),
        child: Text(cell),
      );
    }).toList()
  );

  @override
  Widget build(BuildContext context) {

  
  return Column(
    children: [

      Padding(
        padding: EdgeInsets.all(20)
      ),

      SizedBox(
        height: 115,
        width: 115,
        child: CircleAvatar(
          backgroundImage: NetworkImage("https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2022/01/21/992560672.png"),
        ),
      ),

      Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 8),
            child: Text(
              'Dadang Dindang',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
          ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                '2009017502',
                style: TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
        ],
      ),

      Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Table(
          defaultColumnWidth: IntrinsicColumnWidth(),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            buildRow(['Jabatan', ':' ,'Ketua Departemen Ilmu Komputer']),
            buildRow(['Pendidikan', ':', 'S3']),
            buildRow(['Status Aktivasi', ':', 'Aktif'])
          ],
        ),
      ),

      TextButton(
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.blue
        ),
        onPressed: () {},
        child: Text('Ganti Bahasa'),
      ),

      TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.grey),
        ),
        onPressed: () {},
        child: Text('Logout'),
      )
    ],
  );
  }
}
