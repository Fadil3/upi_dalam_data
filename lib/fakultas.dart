import "package:flutter/material.dart";

class Fakultas extends StatefulWidget {
  const Fakultas({Key? key}) : super(key: key);

  @override
  State<Fakultas> createState() => _FakultasState();
}

class _FakultasState extends State<Fakultas> {
  List<Map> listFakultas = [
    {
      "name": "FPMIPA",
      "url_image":
          "images/fakultas/FPMIPA.jpg",
    },
    {
      "name": "FIP",
      "url_image":
          "images/fakultas/FIP.png"
    },
    {
      "name": "FPIPS",
      "url_image":
          "images/fakultas/FPIPS.jpg"
    },
    {
      "name": "FPBS",
      "url_image":
          "images/fakultas/FPBS.jpg"
    },
    {
      "name": "FPSD",
      "url_image":
          "images/fakultas/FPSD.jpg"
    },
    {
      "name": "FPTK",
      "url_image":
          "images/fakultas/FPTK.jpg"
    },
    {
      "name": "FPOK",
      "url_image":
          "images/fakultas/FPOK.jpg"
    },
    {
      "name": "FPEB",
      "url_image":
          "images/fakultas/FPEB.jpeg"
    },
  ];

  List<Map> listKamda = [
    {
      "name": "Tasikmalaya",
      "url_image":
          "https://play-lh.googleusercontent.com/6Uh3fVuBpOZPo2Bkor2rlh1KSrAQj82611ZK4ahzL0gfSFxjhgEdfBRKeSgwrHi2v4I"
    },
    {
      "name": "Cibiru",
      "url_image":
          "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg"
    },
    {
      "name": "Sumedang",
      "url_image":
          "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg"
    },
    {
      "name": "Purwakarta",
      "url_image":
          "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg"
    },
    {
      "name": "Serang",
      "url_image":
          "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fakultas"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children:[
          const Padding(padding: EdgeInsets.all(20)),
          SizedBox(
            width: 480,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Bumi Siliwangi",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                ]),
          ),
          const Padding(padding: EdgeInsets.all(20)),
          Center(
              child: SizedBox(
            width: 480,
            child: Wrap(spacing: 20.0, runSpacing: 20.0, children: [
              ...listFakultas.map(
                (e) => Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(e["url_image"]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(5)),
                    Text(e["name"]),
                  ],
                ),
              ),
            ]),
          )),
          const Padding(padding: EdgeInsets.all(20)),
          SizedBox(
            width: 480,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Kampus Daerah",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                ]),
          ),
          const Padding(padding: EdgeInsets.all(20)),
          Center(
              child: SizedBox(
            width: 480,
            child: Wrap(spacing: 20.0, runSpacing: 20.0, children: [
              ...listFakultas.map(
                (e) => Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(e["url_image"]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(5)),
                    Text(e["name"]),
                  ],
                ),
              ),
            ]),
          )),
          const Padding(padding: EdgeInsets.all(20)),
          ]
        )
      ),
    );
  }
}
