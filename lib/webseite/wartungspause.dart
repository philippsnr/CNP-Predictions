// ignore_for_file: non_constant_identifier_names
import 'ligen/bundesliga.dart';
import 'ligen/premier_league.dart';
import 'ligen/serie_a.dart';
import 'ligen/ligue_1.dart';
import 'ligen/la_liga.dart';
import 'package:cnppredictions/webseite/webseite.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_html/flutter_html.dart';
import 'texte.dart';
import 'datenschutzseite.dart';

class Wartungspause extends StatefulWidget {
  const Wartungspause({super.key});
  static const route = "/wartungspause";

  @override
  State<Wartungspause> createState() => _WartungspauseState();
}

class _WartungspauseState extends State<Wartungspause> {
  @override
  Widget build(BuildContext context) {
    updateDeviceSize(context);
    Widget balken = SizedBox(
      child: Container(
          width: deviceWidth,
          height: 5,
          color: const Color.fromARGB(255, 84, 17, 145)),
    );
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Center(
          child: SizedBox(
              width: 100,
              child: Center(
                child: SizedBox(
                    width: 75,
                    child: Image.asset("assets/images/logoIcon.png")),
              )),
        ),
      ),
      body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: (MediaQuery.of(context).size.height),
          child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    image: AssetImage("assets/images/logo.jpg")),
              ),
              child: Center(
                  child: Container(
                width: deviceWidth,
                height: deviceHeight,
                color: const Color.fromARGB(215, 0, 0, 0),
                child: Center(child: Html(data: wartungspauseText)),
              )))),
    );
  }
}
