import 'dart:convert';
import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'spieltag.dart';
import 'package:flutter/material.dart';
import 'package:requests/requests.dart';
import 'liga.dart';

class La_Liga extends Liga {
  const La_Liga({super.key});
  static const String route = "/la-liga";

  @override
  State<La_Liga> createState() => _La_LigaState();

  Future<int> getAktuellenSpieltag() async {
    final response = await Requests.get(
        "https://proxy.cnp-predictions.de/get.php?url=${Uri.encodeFull("https://api.football-data.org/v4/competitions/PD")}",
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

class _La_LigaState extends State<La_Liga> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Spieltag2(leagueID: 'PD', league: La_Liga()));
  }
}
