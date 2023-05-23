// ignore_for_file: non_constant_identifier_names, must_be_immutable
import 'dart:convert';

import 'package:cnppredictions/webseite/datenbank.dart';

import 'trikots.dart';
import 'webseite.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';
import 'package:cnppredictions/predictions/vorhersage.dart';
import 'package:tuple/tuple.dart';

class Spiel extends StatefulWidget {
  String ID;
  String homeTeam;
  String awayTeam;
  int homeScore;
  int awayScore;
  DateTime date;
  String status;
  int spieltag;

  Spiel({super.key, 
  required this.ID,
    required this.homeTeam,
    required this.awayTeam,
    required this.homeScore,
    required this.awayScore,
    required this.date,
    required this.status,
    required this.spieltag,
  });

  factory Spiel.fromJson(Map<String, dynamic> json) {
    DateTime now = DateTime.now();
    String formattedDate = (json['Date'] + " " + json['Time']).replaceAll("/", "-");
    DateTime gameDate = DateFormat("dd-MM-yyyy hh:mm").parse(formattedDate);
    String status;
    if(now.isBefore(gameDate)){
      status = "TIMED";
    }
    else{
      status = "TIMED";
    }
    return Spiel(
      ID: json['ID'],
      homeTeam: json['HomeTeam'],
      awayTeam: json['AwayTeam'],
      homeScore: int.parse(json['FTHG']),
      awayScore: int.parse(json['FTAG']),
      date: gameDate,
      status: status,
      spieltag: int.parse(json["Spieltag"]),
    );
  }

  String get formattedDate {
    return DateFormat('dd.MM.yyyy HH:mm').format(date);
  }

  String get Uhrzeit {
    List<String> split1 = formattedDate.split(" ");
    List<String> split2 = split1[1].split(":");
    int hour = int.parse(split2[0]) + 2;
    return "$hour:${split2[1]}";
  }

  Future<Widget> analyse(int spieltag) async {
    String sql = "Select Prediction from Predictions where ID = '$ID';";
    String result = await query(sql);
    dynamic JSONprediction = jsonDecode(result);
    String prediction = JSONprediction[0]["Prediction"];
    List<String> scores = prediction.split(":");
    homeScore = int.parse(scores[0]);
    awayScore = int.parse(scores[1]);
    status = "PREDICTED";
    return Text(
      "$homeScore : $awayScore",
      style: const TextStyle(color: Colors.white, fontSize: 40),
    );
  }

  @override
  State<Spiel> createState() => _SpielState();
}

class _SpielState extends State<Spiel> {
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = const TextStyle(color: Colors.white, fontSize: 15);

    Widget middle = Container();

    if (widget.status == "FINISHED") {
      middle = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("${widget.homeScore} : ${widget.awayScore}", style: textStyle),
          const SizedBox(height: 5),
          MaterialButton(
            padding: const EdgeInsets.all(0),
              disabledColor: const Color.fromARGB(255, 84, 17, 145),
              onPressed: null,
              child: SizedBox(
                width: 100,
                height: 20,
                child: Center(child: Text("Ergebnis", style: textStyle)),
              )),
        ],
      );
    } else if (widget.status == "TIMED") {
      middle = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.Uhrzeit, style: textStyle),
          const SizedBox(height: 5),
          MaterialButton(
            padding: const EdgeInsets.all(0),
              color: const Color.fromARGB(255, 84, 17, 145),
              onPressed: () {
                setState(() {
                  widget.status = "LOADING";
                });
              },
              child: SizedBox(
                width: 100,
                height: 20,
                child:
                    Center(child: Text("Analyse", style: textStyle)),
              ))
        ],
      );
    } else if (widget.status == "LOADING") {
      middle = FutureBuilder(
        future: widget.analyse(widget.spieltag),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const GFLoader(type: GFLoaderType.android, androidLoaderColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 84, 17, 145)));
            default:
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${widget.homeScore} : ${widget.awayScore}",
                        style: textStyle),
                    const SizedBox(height: 5),
                    MaterialButton(
                        disabledColor: const Color.fromARGB(255, 84, 17, 145),
                        onPressed: null,
                        child: SizedBox(
                          width: 100,
                          height: 20,
                          child: Center(
                              child: Text("Vorhersage", style: textStyle)),
                        )),
                  ],
                );
              }
          }
        },
      );
    }
    if (widget.status == "PREDICTED") {
      middle = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("${widget.homeScore} : ${widget.awayScore}", style: textStyle),
          const SizedBox(height: 5),
          MaterialButton(
            padding: const EdgeInsets.all(0),
              disabledColor: Colors.purple,
              onPressed: null,
              child: SizedBox(
                width: 100,
                height: 20,
                child: Center(child: Text("Vorhersage", style: textStyle)),
              )),
        ],
      );
    }

    if(deviceWidth > 1000){
      return getPCLayout(middle);
    }
    else{
      return getHandyLayout(middle);
    }
    
  }

  SizedBox getPCLayout(middle){
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/trikots/${teamTrikots[widget.homeTeam]}.png"),
          const SizedBox(width: 75),
          SizedBox(
              width: 250,
              child: Text(
                widget.homeTeam,
                style: const TextStyle(color: Colors.white, fontSize: 15),
                textAlign: TextAlign.left,
              )),
          const SizedBox(width: 50),
          SizedBox(width: 140, child: middle),
          const SizedBox(width: 50),
          SizedBox(
              width: 250,
              child: Text(
                widget.awayTeam,
                style: const TextStyle(color: Colors.white, fontSize: 15),
                textAlign: TextAlign.right,
              )),
          const SizedBox(width: 75),
          Image.asset("assets/images/trikots/${teamTrikots[widget.awayTeam]}.png"),
        ],
      ),
    );
  }

  Row getHandyLayout(middle){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 0.4 * deviceWidth,
          child: Column(
            children: [
              Text(
                widget.homeTeam,
                style: const TextStyle(color: Colors.white, fontSize: 15)
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: 50,
                child: Image.asset("assets/images/trikots/${teamTrikots[widget.homeTeam]}.png")
              ),
            ],
          ),
        ),
        SizedBox(
          width: 0.2 * deviceWidth,
          child: middle,
        ),
        SizedBox(
          width: 0.4 * deviceWidth,
          child: Column(
            children: [
              Text(
                widget.awayTeam,
                style: const TextStyle(color: Colors.white, fontSize: 15)
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: 50,
                child: Image.asset("assets/images/trikots/${teamTrikots[widget.awayTeam]}.png")
              ),
            ],
          ),
        ),
      ],
    );
  }
}
