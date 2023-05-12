import 'dart:convert';
import 'package:cnppredictions/webseite/spieltag.dart';
import 'package:flutter/material.dart';
import 'package:requests/requests.dart';
import 'liga.dart';

class PremierLeague extends Liga {
  const PremierLeague({super.key});
  static const String route = "/premierleague";

  @override
  State<PremierLeague> createState() => _PremierLeagueState();

  @override
  Future<int> getAktuellenSpieltag() async {
    final response = await Requests.get(
        "https://proxy.cnp-predictions.de/get.php?url=${Uri.encodeFull("https://api.football-data.org/v4/competitions/PL")}",
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

class _PremierLeagueState extends State<PremierLeague> {
  @override
  Widget build(BuildContext context) {
    return Spieltag2(leagueID: 'PL', league: const PremierLeague());
  }
}