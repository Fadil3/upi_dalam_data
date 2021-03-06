import "package:flutter/material.dart";
import 'package:accordion/accordion.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactPage();
}

class _ContactPage extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) =>
                  EntryItem(data[index])),
        ));
  }
}

class Entry {
  final String title;
  final List<Entry>
      children; // Since this is an expansion list ...children can be another list of entries
  Entry(this.title, [this.children = const <Entry>[]]);
}

// This is the entire multi-level list displayed by this app
final List<Entry> data = <Entry>[
  Entry(
    'Pimpinan Universitas',
    <Entry>[
      Entry('Rektor\nEmail:upiedun.itsmydream@upi.edu'),
      Entry('Wakil Rektor\nEmail:wakil.retor12@upi.edu'),
    ],
  ),
  // Second Row
  Entry('Fakultas', <Entry>[
    Entry(
      ' FPMIPA',
      <Entry>[
        Entry('   Dekan FPMIPA\n    iniemailfpmipa@upi.edu\n    08123123123'),
        Entry(
            '   Wakil Dekan FPMIPA\n    emailwakilfpmipa@upi.edu\n    083211233133'),
        Entry(
          '   Departemen',
          <Entry>[
            Entry('     Pendidikan Ilmu Komputer', <Entry>[
              Entry(
                  '       Ketua Prodi Ilmu Komputer\n       ilmukomputer@upi.edu\n       08746028617'),
              Entry(
                  '       Ketua Prodi Pendidikan Ilmu Komputer\n       pendidikanilmukomputer@upi.edu\n       08113927661')
            ]),
            Entry('     Pendidika Kimia', <Entry>[
              Entry(
                  '       Ketua Prodi Kimia\n       kimia@upi.edu\n       08746028617'),
              Entry(
                  '       Ketua Prodi Pendidikan Kimia\n       pendidikankimia@upi.edu\n       08113927661')
            ]),
            Entry('     Pendidika Biologi', <Entry>[
              Entry(
                  '       Ketua Prodi Biolgi\n       biolgi@upi.edu\n       08746028617'),
              Entry(
                  '       Ketua Prodi Pendidikan Biolgi\n       pendidikanbiolgi@upi.edu\n       08113927661')
            ]),
            Entry('     Pendidika Fisika', <Entry>[
              Entry(
                  '       Ketua Prodi Fisika\n       fisika@upi.edu\n       08746028617'),
              Entry(
                  '       Ketua Prodi Pendidikan Fisika\n       pendidikanfisika@upi.edu\n       08113927661')
            ]),
            Entry('     Pendidika Matematika', <Entry>[
              Entry(
                  '       Ketua Prodi Matematika\n       matematika@upi.edu\n       08746028617'),
              Entry(
                  '       Ketua Prodi Pendidikan Matematika\n       pendidikanmatematika@upi.edu\n       08113927661')
            ]),
            Entry('     IPSE', <Entry>[
              Entry(
                  '       Ketua Prodi IPSE\n       IPSE@upi.edu\n       08746028617'),
            ])
          ],
        ),
      ],
    ),
    Entry(' FIP'),
    Entry(' FPIPS'),
    Entry(' FPBS'),
    Entry(' FPTK'),
    Entry(' FPOK'),
    Entry(' FPEB'),
    Entry(' FPSD'),
  ]),
];

// Create the Widget for the row
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);
  final Entry entry;

  // This function recursively creates the multi-level list rows.
  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) {
      return ListTile(
        title: Text(root.title),
      );
    }
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map<Widget>(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
