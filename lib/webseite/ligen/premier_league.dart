// ignore_for_file: camel_case_types

import 'dart:convert';
import 'package:cnppredictions/webseite/spieltag.dart';
import 'package:flutter/material.dart';
import 'package:requests/requests.dart';
import 'liga.dart';

class Premier_League extends Liga {
  const Premier_League({super.key});
  static const String route = "/premier-league";
  
  @override
  final String name = "England";

  @override
  State<Premier_League> createState() => _Premier_LeagueState();

}

class _Premier_LeagueState extends State<Premier_League> {
  @override
  Widget build(BuildContext context) {
    return Spieltag2(leagueID: 'PL', league: const Premier_League());
  }
}