import 'package:cnppredictions/webseite/bundesliga.dart';
import 'package:cnppredictions/webseite/premierleague.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'startseite.dart';
import 'datenschutzseite.dart';
import 'impressumseite.dart';
import 'package:get/get.dart';

Future<void> runWebseite() async {
  runApp(const BLPrediction());
}

double deviceWidth = 0;
double deviceHeight = 0;


class BLPrediction extends StatefulWidget {
  const BLPrediction({super.key});

  @override
  State<BLPrediction> createState() => _BLPredictionState();
}

class _BLPredictionState extends State<BLPrediction> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Startseite.route,
      routes: {
        Startseite.route: (context) => const Startseite(),
        Impressumseite.route: (context) => const Impressumseite(),
        Datenschutzseite.route:(context) => const Datenschutzseite(),
        Bundesliga.route:(context) => const Bundesliga(),
        PremierLeague.route:(context) => const PremierLeague(),
      },
      title: 'CNP-Predictions',
      theme: ThemeData(primaryColor: Colors.black),
    );
  }
}

AppBar getAppbar(context) {
  if (deviceWidth > 600) {
    return getAppbarPC(context);
  } else {
    return getAppbarHandy(context);
  }
}

AppBar getAppbarPC(context) {
  TextStyle style =
      TextStyle(color: Color.fromARGB(255, 183, 111, 250), fontSize: 18);
  return AppBar(
    toolbarHeight: 56,
    automaticallyImplyLeading: false,
    backgroundColor: Colors.black,
    title: TextButton(
        onPressed: () {
          openPage(context, Startseite.route);
        },
        child: SizedBox(
          width: 220,
          child: Row(
            children: [
              SizedBox(
                  width: 75, child: Image.asset("assets/images/logoIcon.png")),
              Text(style: style, "CNP-Predictions")
            ],
          ),
        )),
    actions: [
      TextButton(
          onPressed: () {
            openPage(context, Startseite.route);
          },
          child: Text("Home", style: style)),
      SizedBox(width: 20),
      TextButton(
          onPressed: () {
            openPage(context, Bundesliga.route);
          },
          child: Text("Bundesliga", style: style)),
      SizedBox(width: 20),
      TextButton(
          onPressed: () {
            openPage(context, PremierLeague.route);
          },
          child: Text("Premier League", style: style)),
      SizedBox(width: 20),
      TextButton(
          onPressed: () {
            
          },
          child: Text("La Liga", style: style)),
      SizedBox(width: 20),
      TextButton(
          onPressed: () {
            
          },
          child: Text("Serie A", style: style)),
      SizedBox(width: 20),
      TextButton(
          onPressed: () {
            
          },
          child: Text("Ligue 1", style: style)),
      SizedBox(width: 20),
      TextButton(
          onPressed: () {
            openPage(context, Impressumseite.route);
          },
          child: Text("Imprint", style: style)),
    ],
  );
}

AppBar getAppbarHandy(context) {
  TextStyle style =
      TextStyle(color: Color.fromARGB(255, 183, 111, 250), fontSize: 18);
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.black,
    title: Center(
      child: SizedBox(
        width: 100,
        child: TextButton(
          onPressed: () {
            openPage(context, Startseite.route);
          },
          child: Center(
            child: SizedBox(width: 75, child: Image.asset("assets/images/logoIcon.png")),
          )
        ),
      ),
    ),
  );
}

void updateDeviceSize(context) {
  deviceWidth = MediaQuery.of(context).size.width;
  deviceHeight = MediaQuery.of(context).size.height;
}

void openPage(context, route) {
  if (ModalRoute.of(context)!.settings.name != route) {
    Navigator.pop(context);
    Navigator.pushNamed(context, route);
  }
  else if(route == Startseite.route){
    scrollTo(StartKey);
  }
}
