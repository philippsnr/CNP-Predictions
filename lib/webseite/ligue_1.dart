import 'dart:convert';
import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'spieltag.dart';
import 'package:flutter/material.dart';
import 'package:requests/requests.dart';
import 'liga.dart';

class Ligue_1 extends Liga {
  const Ligue_1({super.key});
  static const String route = "/ligue-1";

  @override
  State<Ligue_1> createState() => _Ligue_1State();

  Future<int> getAktuellenSpieltag() async {
    final response = await Requests.get(
        "https://proxy.cnp-predictions.de/get.php?url=${Uri.encodeFull("https://api.football-data.org/v4/competitions/FL1")}",
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

class _Ligue_1State extends State<Ligue_1> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Spieltag2(leagueID: 'FL1', league: Ligue_1()));
  }
}
