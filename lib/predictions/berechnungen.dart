// ignore_for_file: no_leading_underscores_for_local_identifiers, non_constant_identifier_names

import 'dart:math';

int Z = -7;

double getLeistung(_diff, _Xdiff, _deltaRank) {
  if (_diff > 0) {
    return getLeistungSieg(_diff, _Xdiff, _deltaRank);
  }
  if (_diff < 0) {
    return getLeistungNiederlage(_diff, _Xdiff, _deltaRank);
  }
  if (_diff == 0) {
    return getLeistungUnentschieden(_diff, _Xdiff, _deltaRank);
  }
  return 0;
}

double getLeistungSieg(diff, Xdiff, deltaRank) {
  double faktor = getFaktorSieg(diff, Xdiff);
  double leistung = faktor * diff;
  leistung *= pow(10, -Z);
  leistung *= pow(10 - (deltaRank / 10), Z);
  return leistung;
}

double getLeistungNiederlage(diff, Xdiff, deltaRank) {
  double faktor = getFaktorNiederlage(diff, Xdiff);
  double leistung = faktor * diff;
  leistung *= pow(10, -Z);
  leistung *= pow(10 + (deltaRank / 10), Z);
  return leistung;
}

double getLeistungUnentschieden(diff, Xdiff, deltaRank) {
  double faktor = getFaktorUnentschieden(diff, Xdiff);
  double leistung = faktor;
  leistung *= pow(10, -Z);
  leistung *= pow(10 - (deltaRank / 10), Z);
  return leistung;
}

double getFaktorSieg(int diff, double Xdiff) {
  double faktor = 1;
  if (Xdiff > 0) {
    faktor = Xdiff / diff;
  } else if (Xdiff < 0) {
    faktor = 1 / (1 + getBetrag(Xdiff));
  } else {
    faktor = 1 - (diff / 10);
  }
  return faktor;
}

double getFaktorNiederlage(int diff, double Xdiff) {
  double faktor = 1;
  if (Xdiff > 0) {
    faktor = 1 / (1 + Xdiff);
  } else if (Xdiff < 0) {
    faktor = Xdiff / diff;
  } else {
    faktor = 1 + (diff / 10);
  }
  return faktor;
}

double getFaktorUnentschieden(int diff, double Xdiff) {
  double faktor = 1;
  if (Xdiff > 0) {
    faktor = 1 + (Xdiff / 10);
  } else if (Xdiff < 0) {
    faktor = 1 + (Xdiff / 10);
  } else {
    faktor = 1;
  }
  return faktor;
}

double getBetrag(x) {
  if (x >= 0) {
    return x;
  } else {
    return -x;
  }
}