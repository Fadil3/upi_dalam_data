import "package:flutter/material.dart";

class DetailFakultas extends StatefulWidget {
  final String fakultas;
  const DetailFakultas(this.fakultas, {Key? key}) : super(key: key);

  @override
  State<DetailFakultas> createState() => _DetailFakultasState();
}

class _DetailFakultasState extends State<DetailFakultas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fakultas"),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        const Padding(padding: EdgeInsets.all(20)),
        Text("ini adalah detail fakultas ${widget.fakultas}"),
      ])),
    );
  }
}
