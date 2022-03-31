
import "package:flutter/material.dart";

class Dosen extends StatefulWidget {
  const Dosen({Key? key}) : super(key: key);

  @override
  State<Dosen> createState() => _DosenState();
}

class _DosenState extends State<Dosen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dosen'),
      ),
      body: Center(
        child: const Text("ini halaman Dosen"),
      ),
    );
  }
}