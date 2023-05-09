import 'package:requests/requests.dart';
import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'berechnungen.dart';
import 'teamnamen.dart';
import 'package:tuple/tuple.dart';

Future<Tuple3<double,double,double>> getDurchschnittlicheLeistung(String team, int currentmatchday) async {

  String buliTeam = "${footballdata_bundesligaURL[team]}";  //football-data-Name zu Bundesliga-Name

  String spielplanURL = "https://www.bundesliga.com/de/bundesliga/spieltag/2022-2023/$buliTeam"; //Link zum Spielplan des zu bewertenden Teams

  var r = await Requests.get("https://proxy.bundesliga-prediction.de/get.php?url=${Uri.encodeFull(spielplanURL)}");      //
  r.raiseForStatus();                           //  liefert Quelltext der Spielplan-Seite
  String body = r.content();                   //
  BeautifulSoup bs = BeautifulSoup(body);     //

  List<Bs4Element?> allGames = bs.findAll("div", class_: "matchRow elevation-t-card ng-star-inserted");   //Liste aller Spiele der aktuellen Bundesligaspielzeit

  List<Bs4Element?> last5Games = [];
  if(currentmatchday >= 6){
    last5Games = [                    //Liste mit ausschließlich den letzten fünf Spielen
      allGames[currentmatchday - 2],
      allGames[currentmatchday - 3],
      allGames[currentmatchday - 4],
      allGames[currentmatchday - 5],
      allGames[currentmatchday - 6],
    ];
  } else {  //falls noch keine fünf Spiele gespielt wurden
    for(int i = 2; i <= currentmatchday; i ++){
      last5Games.add(allGames[currentmatchday - i]);
    }
  }

  List<double> leistungen = [];   //Array für die letzten fünf Leistungen
  int toreGesamt = 0;
  int gegentoreGesamt = 0;
  for (Bs4Element? game in last5Games) {
    Tuple3<double,int,int> leistungUndTore = await getSingleLeistung(buliTeam, game);  //für jedes der fünf Spiele die Leistung berechnen und dem Array hinzufügen
    double leistung = leistungUndTore.item1;
    int tore = leistungUndTore.item2;
    int gegentore = leistungUndTore.item3;
    leistungen.add(leistung);
    toreGesamt += tore;
    gegentoreGesamt += gegentore;
  }
  double durchschnittsTore = toreGesamt / last5Games.length;
  double durchschnittsGegentore = gegentoreGesamt / last5Games.length;

  double durchschnittsLeistung = 0;
  if(leistungen.length == 5){
    durchschnittsLeistung += 0.3 * leistungen[0];     //
    durchschnittsLeistung += 0.25 * leistungen[1];    //
    durchschnittsLeistung += 0.2 * leistungen[2];     //  Gewichtung der einzelnen Leistungen
    durchschnittsLeistung += 0.15 * leistungen[3];    //
    durchschnittsLeistung += 0.1 * leistungen[4];     //
  } else {    //falls noch keine 5 Spiele gespielt wurden
    for(int i = 0; i < leistungen.length; i ++){
      durchschnittsLeistung += leistungen[i];
    }
    durchschnittsLeistung /= leistungen.length;
  }

  return Tuple3(durchschnittsLeistung, durchschnittsTore, durchschnittsGegentore);
}

Future<Tuple3<double,int,int>> getSingleLeistung(buliTeam, game) async {        //Leistung für ein einzelnes Spiel

  String matchlink = game.find("a", class_: "matchFixture")["href"];  //liefert den Link zum betrachteten Spiel
  String statURL = "https://www.bundesliga.com$matchlink/stats";      //fügt "/stats" hinzu um zu den Statistiken zu gelangen

  var r = await Requests.get("https://proxy.bundesliga-prediction.de/get.php?url=${Uri.encodeFull(statURL)}");            //
  r.raiseForStatus();                            //  liefert Quelltext der Statistiken-Seite
  String body = r.content();                    //
  BeautifulSoup bs = BeautifulSoup(body);      //

  int spieltag = getSpieltag(bs);
  int prevSpieltag = spieltag - 1;  //wir benötigen den vorherigen Spieltag, um die Tabellensituation vor Spielbeginn zu analysieren

  Bs4Element? ergebnis = bs.find("div", class_: "row matchInfos");
  List<Bs4Element?> teams = ergebnis!.findAll("img");
  String? team1 = teams[0]!["alt"];                                   //Name der Heimmannschaft
  String? team2 = teams[1]!["alt"];                                   //Name der Auswärtsmannschaft
  
  String tabellenLink = "https://www.sportschau.de/live-und-ergebnisse/fussball/deutschland-bundesliga/se45495/2022-2023/ro132754/spieltag/md$prevSpieltag/tabelle/";
  //Link zur Tabelle vor Beginn des Spiels

  int tabellenPlatz1 = await getTabellenplatz(team1, tabellenLink); //Tabellenplatz der Heimmannschaft
  int tabellenPlatz2 = await getTabellenplatz(team2, tabellenLink); //Tabellenplatz der Auswärtsmannschaft

  int diff;
  double xDiff;
  int deltaRank;
  int tore;
  int gegentore;
  if (team1 == URL_name[buliTeam]) {   //zu bewertendes Team = Heimmannschaft
    Tuple3<int,int,int> diffTore = getDiff(bs, true);
    diff = diffTore.item1;
    tore = diffTore.item2;
    gegentore = diffTore.item3;
    xDiff = getXDiff(bs, true);
    deltaRank = tabellenPlatz2 - tabellenPlatz1;
  } else {    //zu bewertendes Team = Auswärtsmannschaft
    Tuple3<int,int,int> diffTore = getDiff(bs, false);
    diff = diffTore.item1;
    tore = diffTore.item2;
    xDiff = getXDiff(bs, false);
    gegentore = diffTore.item3;
    deltaRank = tabellenPlatz1 - tabellenPlatz2;
  }

  double leistung = getLeistung(diff, xDiff, deltaRank);  //Berechnungen in "berechnungen.dart" aufrufen
  return Tuple3(leistung, tore, gegentore);
}

int getSpieltag(bs) {
  Bs4Element? box = bs.find("div", class_: "allMatches col-2 col-md-3");
  String? spieltag = box!.find("span", class_: "ng-star-inserted")!.text; //gibt zurück: "Spieltag XX"
  spieltag = spieltag.replaceAll(RegExp(r"[^0-9]"), "");              //nur die Zahlen beibehalten -> "XX"
  int spieltagsNumber = int.parse(spieltag);                              //String zu einem int casten

  return spieltagsNumber;
}

Tuple3<int,int,int> getDiff(bs, bool home) {
  Bs4Element? ergebnis = bs.find("div", class_: "row matchInfos");
  List<Bs4Element?> tore = ergebnis!.findAll("div", class_: "scoreCardContentGoals ng-star-inserted");
  int toreHeim = int.parse(tore[0]!.text);      //Tore der Heimmannschaft
  int toreAuswaerts = int.parse(tore[1]!.text);     //Tore der Auswärtsmannschaft

  if (home == true) { //zu bewertendes Team = Heimmannschaft
    return Tuple3((toreHeim - toreAuswaerts), toreHeim, toreAuswaerts);
  } else {  //zu bewertendes Team = Auswärtsmannschaft
    return Tuple3((toreAuswaerts - toreHeim), toreAuswaerts, toreHeim);
  }
}

double getXDiff(bs, bool home) {
  Bs4Element? xGoals = bs.find("div", class_: "col col-12");
  Bs4Element? columnHome = xGoals!.find("div", class_: "column home");
  String homeXGString = columnHome!.find("span", class_: "value")!.text;
  double homeXG = StringToDouble(homeXGString);

  Bs4Element? columnAway = xGoals.find("div", class_: "column away");
  String awayXGString = columnAway!.find("span", class_: "value")!.text;
  double awayXG = StringToDouble(awayXGString);


  if (home == true) { //zu bewertendes Team = Heimmannschaft
    return homeXG - awayXG;
  } else {  //zu bewertendes Team = Auswärtsmannschaft
    return awayXG - homeXG;
  }
}

Future<int> getTabellenplatz(String? gesuchtesTeam, String tabellenLink) async {

  var r = await Requests.get("https://proxy.bundesliga-prediction.de/get.php?url=${Uri.encodeFull(tabellenLink)}");   //
  r.raiseForStatus();                         //  liefert Quelltext zur Tabelle von vor dem Spiel
  String body = r.content();                  //
  BeautifulSoup bs = BeautifulSoup(body);     //

  List<Bs4Element> plaetze = bs.findAll("td", class_: "team-name team-name-");  //liefert alle Mannschaften in Reihenfolge der Platzierungen (1. Plaz -> [0])
  List<String> teams = []; 
  for (int i = 0; i < plaetze.length; i++) {
    teams.add(plaetze[i].text); //erstellen einer Liste mit den Teamnamen als String
  }

  for (int i = 0; i < teams.length; i++) {
    if (teams[i] == bundesliga_sportschau[gesuchtesTeam]) { //jedes Team vergleichen mit dem gesuchten Team
      return i + 1;
    }
  }
  return 0;
}

// ignore: non_constant_identifier_names
double StringToDouble(String s) {       //String-Zahl in ein double casten
  s = s.replaceAll(",", ".");
  return double.parse(s);
}