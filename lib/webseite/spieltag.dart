// ignore_for_file: must_be_immutable

import 'datenbank.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:requests/requests.dart';
import 'spiel.dart';
import 'dart:convert';
import 'webseite.dart';
import 'ligen/liga.dart';

class Spieltag2 extends StatelessWidget {
  double fontsize = 15;
  int aktuellerSpieltag = 1;

  String leagueID;
  Liga league;

  Spieltag2({super.key, 
    required this.leagueID,
    required this.league,
    });

  @override
  Widget build(BuildContext context) {
    updateDeviceSize(context);
    return Scaffold(
      appBar: getAppbar(context),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage("assets/images/logo.jpg"),
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: FutureBuilder(
                  future: getSpiele2(league,"2022-2023"),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return Center(
                            child: Container(
                          width: deviceWidth,
                          height: deviceHeight,
                          color: const Color.fromARGB(215, 0, 0, 0),
                          child: const GFLoader(type: GFLoaderType.android, androidLoaderColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 84, 17, 145))),
                        ));
                      default:
                        if (snapshot.hasError) {
                          return Center(
                            child: Text('Error: ${snapshot.error}'),
                          );
                        } else {
                          return Container(
                            color: const Color.fromARGB(215, 0, 0, 0),
                            child: getSpieltag(snapshot.data),
                          );
                        }
                    }
                  }),
            ),
          ),
        ),
      ),
    );
  }

  Column getSpieltag(List<Spiel> games) {
    List<Widget> spiele = [];
    String prevDate = "";

    spiele.add(SizedBox(
      height: 70,
      child: Center(
          child: Text("Spieltag $aktuellerSpieltag",
              style: TextStyle(color: Colors.white, fontSize: fontsize))),
    ));
    for (Spiel game in games) {
      List<String> split = game.formattedDate.split(" ");
      String date = split[0];
      if (date != prevDate) {
        spiele.add(SizedBox(
          height: 70,
          child: Container(
              //color: const Color.fromARGB(100, 75, 75, 75),
              color: const Color.fromARGB(100, 84, 17, 145),
              child: Center(
                  child: Text(date,
                      style:
                          TextStyle(color: Colors.white, fontSize: fontsize)))),
        ));
        prevDate = date;
      }

      spiele.add(const SizedBox(height: 25));
      spiele.add(game);
      spiele.add(const SizedBox(height: 25));
    }
    return Column(children: spiele);
  }

  Future<List<Spiel>> getSpiele() async {

    aktuellerSpieltag = await league.getAktuellenSpieltag();

    final response = await Requests.get(
        "https://proxy.cnp-predictions.de/get.php?url=${Uri.encodeFull("https://api.football-data.org/v4/competitions/$leagueID/matches?matchday=$aktuellerSpieltag")}",
        headers: {"Access-Control-Allow-Origin": "*"});
    if (response.statusCode == 200) {
      // Parse JSON data and return a list of FootballResults
      Map<String, dynamic> data = jsonDecode(response.body);
      List<dynamic> matches = data['matches'];
      List<Spiel> results =
          matches.map((match) => Spiel.fromJson(match)).toList();

      // Sort results by date
      results.sort((a, b) => a.date.compareTo(b.date));

      return results;
    } else {
      // Handle error
      throw Exception('Failed to fetch football results');
    }
  }

  Future<List<Spiel>> getSpiele2(Liga liga, String Saison) async{

    aktuellerSpieltag = await liga.getAktuellenSpieltag();

    String sql = "Select * from ${liga.name} where Saison = '$Saison' and Spieltag = $aktuellerSpieltag";
    
    String jsonSpiele = await query(sql);

    dynamic spieleListe = jsonDecode(jsonSpiele);


    List<Spiel> spiele = [];

    for(var spiel in spieleListe){
      spiele.add(Spiel.fromJson(spiel));
    }
    //spiele.sort((a, b) => a.date.compareTo(b.date));

    return spiele;
  }

}