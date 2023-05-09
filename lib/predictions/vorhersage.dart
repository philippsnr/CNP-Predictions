import 'leistung.dart';
import 'spielort.dart';
import 'package:tuple/tuple.dart';
import 'berechnungen.dart';

Future<Tuple2<int,int>> getPrediction(String team1, String team2, int matchday) async {

  Tuple3<double,double,double> durchschnittsLeistung1 = await getDurchschnittlicheLeistung(team1, matchday);
  Tuple3<double,double,double> durchschnittsLeistung2 = await getDurchschnittlicheLeistung(team2, matchday);

  double leistung1 = durchschnittsLeistung1.item1;
  double leistung2 = durchschnittsLeistung2.item1;

  double durchschnittsTore1 = durchschnittsLeistung1.item2;
  double durchschnittsGegentore1 = durchschnittsLeistung1.item3;

  double durchschnittsTore2 = durchschnittsLeistung2.item2;
  double durchschnittsGegentore2 = durchschnittsLeistung2.item3;

  double spielortStaerke1 = await getSpielortstaerke(team1, matchday, true);
  double spielortStaerke2 = await getSpielortstaerke(team2, matchday, false);

  double diff = (leistung1 + spielortStaerke1) - (leistung2 + spielortStaerke2);
  int diffRound = diff.round();

  Tuple2 ergebnis;
  if(diffRound > 0){
    ergebnis = getErgebnis(getBetrag(diff), durchschnittsTore1, durchschnittsGegentore2);
    return Tuple2(ergebnis.item1, ergebnis.item2);
  } else if(diffRound < 0){
    ergebnis = getErgebnis(getBetrag(diff), durchschnittsTore2, durchschnittsGegentore1);
    return Tuple2(ergebnis.item2, ergebnis.item1);
  } else {
    ergebnis = getUnentschieden(durchschnittsTore1, durchschnittsTore2);
    return Tuple2(ergebnis.item1, ergebnis.item2);
  }
}

Tuple2<int,int> getErgebnis(double diff, double durchschnittsToreSieger, double durchschnittsGegentoreVerlierer){
  int toreSieger = (durchschnittsToreSieger * durchschnittsGegentoreVerlierer * diff / 2).round();
  if(toreSieger > 5){toreSieger = 5;}
  int toreVerlierer = toreSieger - diff.round();
  if(toreSieger == 0){toreSieger = 1;}
  if(toreVerlierer < 0){toreVerlierer = 0;}
  return Tuple2(toreSieger, toreVerlierer);
}

Tuple2<int,int> getUnentschieden(double durchschnittsTore1, double durchschnittsTore2){
  int tore = ((durchschnittsTore1 + durchschnittsTore2) / 2).round();
  return Tuple2(tore, tore);
}