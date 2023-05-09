import 'package:requests/requests.dart';
import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'teamnamen.dart';

Future<double> getSpielortstaerke(String team, int currentmatchday, bool heim) async {

  String buliTeam = "${footballdata_bundesligaURL[team]}";
  String buliTeamName = "${URL_name[buliTeam]}"; //Name des gesuchten Teams auf der Buli-Seite

  int matchday = currentmatchday - 1;   //-1 um die Tabelle vor Spieltagsbeginn zu betrachten

  if(heim){
    return await getHeimstaerke(buliTeamName, matchday);
  } else{
    return await getAuswaertsstaerke(buliTeamName, matchday);
  }
}

Future<double> getHeimstaerke(String team, int matchday) async {

  String heimtabelleURL = "https://www.sportschau.de/live-und-ergebnisse/fussball/deutschland-bundesliga/se45495/2022-2023/ro132754/spieltag/md$matchday/tabelle-heim/";
  //Link zur sogenannten Heimtabelle (-> Bundesliga Tabelle für alle Heimspiele)

  int tabellenplatz = await getTabellenplatz(team, heimtabelleURL);

  return 1 - (tabellenplatz / 18);
}

Future<double> getAuswaertsstaerke(String team, int matchday) async {

  String auswaertstabelleURL = "https://www.sportschau.de/live-und-ergebnisse/fussball/deutschland-bundesliga/se45495/2022-2023/ro132754/spieltag/md$matchday/tabelle-auswaerts/";
  //Link zur sogenannten Auswärtstabelle (-> Bundesliga Tabelle für alle Auswärtspiele)

  int tabellenplatz = await getTabellenplatz(team, auswaertstabelleURL);

  return 1 - (tabellenplatz / 18);
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