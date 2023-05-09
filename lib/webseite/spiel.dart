// ignore_for_file: non_constant_identifier_names

import 'farben.dart';
import 'webseite.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';
import 'package:cnppredictions/predictions/vorhersage.dart';
import 'package:tuple/tuple.dart';

class Spiel extends StatefulWidget {
  String homeTeam;
  int homeId;
  String awayTeam;
  int awayId;
  int homeScore;
  int awayScore;
  DateTime date;
  String status;
  int spieltag;

  Spiel({
    required this.homeTeam,
    required this.homeId,
    required this.awayTeam,
    required this.awayId,
    required this.homeScore,
    required this.awayScore,
    required this.date,
    required this.status,
    required this.spieltag,
  });

  factory Spiel.fromJson(Map<String, dynamic> json) {
    return Spiel(
      homeTeam: json['homeTeam']['name'] ?? '',
      homeId: json['homeTeam']['id'],
      awayTeam: json['awayTeam']['name'] ?? '',
      awayId: json['awayTeam']['id'],
      homeScore: json['score']['fullTime']['home'] ?? 0,
      awayScore: json['score']['fullTime']['away'] ?? 0,
      date: DateTime.parse(json['utcDate']),
      status: json['status'] ?? '',
      spieltag: json["matchday"] ?? '',
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
    Tuple2<int, int> diff = await getPrediction(homeTeam, awayTeam, spieltag);
    homeScore = diff.item1;
    awayScore = diff.item2;
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
              disabledColor: Colors.green,
              onPressed: null,
              child: SizedBox(
                width: 180,
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
          SizedBox(height: 5),
          MaterialButton(
              color: Colors.green,
              onPressed: () {
                setState(() {
                  widget.status = "LOADING";
                });
              },
              child: SizedBox(
                width: 180,
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
              return const GFLoader(type: GFLoaderType.android);
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
                        disabledColor: Colors.green,
                        onPressed: null,
                        child: SizedBox(
                          width: 180,
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
              disabledColor: Colors.green,
              onPressed: null,
              child: SizedBox(
                width: 180,
                height: 20,
                child: Center(child: Text("Vorhersage", style: textStyle)),
              )),
        ],
      );
    }
    
    Color defaultColor = const Color.fromARGB(0, 0, 0, 0);

    Color leftColor = teamColors[widget.homeTeam]!;
    leftColor = leftColor.withAlpha(175);
    Color rightColor;
    if (colorNames[widget.homeTeam] != colorNames[widget.awayTeam]) {
      rightColor = teamColors[widget.awayTeam]!;
    } else {
      rightColor = secondColors[widget.awayTeam]!;
    }
    rightColor = rightColor.withAlpha(175);


    if(deviceWidth > 600){
      return getPCLayout(defaultColor, leftColor, rightColor, middle);
    }
    else{
      return getHandyLayout(defaultColor, leftColor, rightColor, middle);
    }
    
  }

  Container getPCLayout(defaultColor, leftColor, rightColor, middle){
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          defaultColor,
          leftColor,
          leftColor,
          rightColor,
          rightColor,
          defaultColor
        ],
        stops: const [0.15, 0.2, 0.3, 0.7, 0.8, 0.85],
      )),
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
          ],
        ),
      ),
    );
  }

  Container getHandyLayout(defaultColor, leftColor, rightColor, middle){
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          leftColor,
          leftColor,
          rightColor,
          rightColor,
        ],
        stops: const [0.2, 0.3, 0.7, 0.8],
      )),
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 0.02 * deviceWidth),
            SizedBox(
                width: 0.2 * deviceWidth,
                child: Text(
                  widget.homeTeam,
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                  textAlign: TextAlign.left,
                )),
            SizedBox(width: 0.02 * deviceWidth),
            SizedBox(width: 0.3 * 400, child: middle),
            SizedBox(width: 0.02 * deviceWidth),
            SizedBox(
                width: 0.2 * deviceWidth,
                child: Text(
                  widget.awayTeam,
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                  textAlign: TextAlign.right,
                )),
            SizedBox(width: 0.02 * deviceWidth),
          ],
        ),
      ),
    );
  }
}
