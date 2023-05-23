// ignore_for_file: camel_case_types

import 'dart:convert';
import 'package:cnppredictions/webseite/spieltag.dart';
import 'package:flutter/material.dart';
import 'package:requests/requests.dart';
import 'liga.dart';

class La_Liga extends Liga {
  const La_Liga({super.key});
  static const String route = "/la-liga";
  
  @override
  final String name = "Spanien";

  @override
  State<La_Liga> createState() => _La_LigaState();

}

class _La_LigaState extends State<La_Liga> {
  @override
  Widget build(BuildContext context) {
    return Spieltag2(leagueID: 'PD', league: const La_Liga());
  }
}
