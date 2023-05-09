import 'dart:convert';

import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'spieltag.dart';
import 'package:flutter/material.dart';
import 'package:requests/requests.dart';
import 'liga.dart';

class Bundesliga extends Liga {
  const Bundesliga({super.key});
  static const String route = "/bundesliga";

  @override
  State<Bundesliga> createState() => _BundesligaState();

  Future<int> getAktuellenSpieltag() async {
    final response = await Requests.get(
        "https://proxy.cnp-predictions.de/get.php?url=${Uri.encodeFull("https://api.football-data.org/v4/competitions/2002")}",
        headers: {"Access-Control-Allow-Origin": "*"});
    if (response.statusCode == 200) {
      // Parse JSON data and return a list of FootballResults
      Map<String, dynamic> data = jsonDecode(response.body);

      int aktuellerSpieltag = data["currentSeason"]["currentMatchday"];

      return aktuellerSpieltag;
    } else {
      // Handle error
      throw Exception('Failed to fetch current matchday results');
    }
  }
}

class _BundesligaState extends State<Bundesliga> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Spieltag2(leagueID: '2002', league: Bundesliga()));
  }
}
