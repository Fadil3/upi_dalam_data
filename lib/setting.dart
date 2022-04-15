import "package:flutter/material.dart";

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  @override
  Widget build(BuildContext context) {

  TableRow _tableRow = TableRow(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.all(10),
        child: Text('Jabatan'),
      ),
      Padding(
        padding: EdgeInsets.all(10),
        child: Text('Ketua Departemen Ilmu Komputer'),
      )
    ]
  );
  
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

      Table(
        children: <TableRow>[
          _tableRow
        ],
      ),

      ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.blue, // background
          onPrimary: Colors.white, // foreground
        ),
        onPressed: () { },
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
