import 'dart:convert';
import 'package:cnppredictions/webseite/spieltag.dart';
import 'package:flutter/material.dart';
import 'package:requests/requests.dart';
import 'liga.dart';

class Bundesliga extends Liga {
  const Bundesliga({super.key});
  static const String route = "/bundesliga";
  
  @override
  final String name = "Bundesliga";

  @override
  State<Bundesliga> createState() => _BundesligaState();

  
}

class _BundesligaState extends State<Bundesliga> {
  @override
  Widget build(BuildContext context) {
    return Spieltag2(leagueID: 'BL1', league: const Bundesliga());
  }
}
