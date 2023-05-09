import 'package:flutter/material.dart';

class Liga extends StatefulWidget {
  const Liga({super.key});

  @override
  State<Liga> createState() => _LigaState();

  Future<int> getAktuellenSpieltag() {
    return Future(() => 1);
  }
}

class _LigaState extends State<Liga> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}