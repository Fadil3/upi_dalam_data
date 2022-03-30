import "package:flutter/material.dart";

class Prodi extends StatefulWidget {
  const Prodi({Key? key}) : super(key: key);

  @override
  State<Prodi> createState() => _ProdiState();
}

class _ProdiState extends State<Prodi> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('prodi'),
      ),
      body: Center(
        child: const Text("ini halaman prodi"),
      ),
    );
  }
}