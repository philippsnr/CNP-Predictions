import 'dart:collection';
import 'dart:convert';

import 'package:cnppredictions/webseite/datenbank.dart';
import 'package:flutter/material.dart';

class Liga extends StatefulWidget {
  const Liga({super.key});

  @override
  State<Liga> createState() => _LigaState();
  final String name = "";

  Future<int> getAktuellenSpieltag() async {

    String sql = "SELECT MAX(Spieltag) FROM $name WHERE Saison = '2022-2023'";

    String res = await query(sql);

    Map tag = jsonDecode(res)[0];

    return int.parse(tag["MAX(Spieltag)"]);
  }
}

class _LigaState extends State<Liga> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}