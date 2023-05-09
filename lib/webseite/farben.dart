import 'package:flutter/material.dart';

int vis = 230;

var teamColors = {
  // Bundesliga:
  "FC Bayern München": Color.fromARGB(vis, 237, 18, 40),
  "SC Freiburg": Color.fromARGB(vis, 228, 0, 43),
  "1. FC Union Berlin": Color.fromARGB(vis, 212, 1, 29),
  "Borussia Dortmund": Color.fromARGB(vis, 180, 180, 0),
  "RB Leipzig": Color.fromARGB(vis, 255, 255, 255),
  "Eintracht Frankfurt": Color.fromARGB(vis, 204, 0, 0),
  "VfL Wolfsburg": Color.fromARGB(vis, 0, 55, 0),
  "Borussia Mönchengladbach": Color.fromARGB(vis, 40, 161, 68),
  "1. FSV Mainz 05": Color.fromARGB(vis, 160, 0, 0),
  "Bayer 04 Leverkusen": Color.fromARGB(vis, 226, 0, 26),
  "SV Werder Bremen": Color.fromARGB(vis, 29, 120, 83),
  "1. FC Köln": Color.fromARGB(vis, 226, 6, 19),
  "FC Augsburg": Color.fromARGB(vis, 186, 55, 51),
  "VfB Stuttgart": Color.fromARGB(vis, 255, 255, 255),
  "TSG 1899 Hoffenheim": Color.fromARGB(vis, 0, 85, 158),
  "Hertha BSC": Color.fromARGB(vis, 0, 82, 158),
  "FC Schalke 04": Color.fromARGB(vis, 0, 56, 120),
  "VfL Bochum 1848": Color.fromARGB(vis, 0, 101, 174),

  //Premier League:
  "Manchester City FC": Color.fromARGB(vis, 84, 175, 228),
  "Arsenal FC": Color.fromARGB(vis, 238,0,23),
  "Newcastle United FC": Color.fromARGB(vis, 0, 0, 0),
  "Manchester United FC": Color.fromARGB(vis, 247,0,0),
  "Liverpool FC": Color.fromARGB(vis, 228,0,25),
  "Tottenham Hotspur FC": Color.fromARGB(vis, 12,33,85),
  "Brighton & Hove Albion FC": Color.fromARGB(vis, 0, 95, 176),
  "Aston Villa FC": Color.fromARGB(vis, 127,9,65),
  "Brentford FC": Color.fromARGB(vis, 248,0,0),
  "Fulham FC": Color.fromARGB(vis, 0, 0, 0),
  "Chelsea FC": Color.fromARGB(vis, 0, 21, 143),
  "Crystal Palace FC": Color.fromARGB(vis, 250, 5, 6),
  "Wolverhampton Wanderers FC": Color.fromARGB(vis, 251, 164, 6),
  "AFC Bournemouth": Color.fromARGB(vis, 225, 0, 0),
  "West Ham United FC": Color.fromARGB(vis, 132, 36, 60),
  "Nottingham Forest FC": Color.fromARGB(vis, 242, 0, 0),
  "Everton FC": Color.fromARGB(vis, 0, 0, 165),
  "Leicester City FC": Color.fromARGB(vis, 0, 49, 150),
  "Leeds United FC": Color.fromARGB(vis, 255, 222, 0),
  "Southampton FC": Color.fromARGB(vis, 234, 0, 20),
 


};

var secondColors = {
  "FC Bayern München": Color.fromARGB(vis, 255, 255, 255),
  "SC Freiburg": Color.fromARGB(vis, 0, 0, 0),
  "1. FC Union Berlin": Color.fromARGB(vis, 253, 220, 15),
  "Borussia Dortmund": Color.fromARGB(vis, 180, 180, 0), //braucht keine second Color
  "RB Leipzig": Color.fromARGB(vis, 255, 255, 255), //braucht keine second Color
  "Eintracht Frankfurt": Color.fromARGB(vis, 0, 0, 0),
  "VfL Wolfsburg": Color.fromARGB(vis, 255, 255, 255),
  "Borussia Mönchengladbach": Color.fromARGB(vis, 255, 255, 255),
  "1. FSV Mainz 05": Color.fromARGB(vis, 255, 255, 255),
  "Bayer 04 Leverkusen": Color.fromARGB(vis, 255, 255, 255),
  "SV Werder Bremen": Color.fromARGB(vis, 255, 255, 255),
  "1. FC Köln": Color.fromARGB(vis, 255, 255, 255),
  "FC Augsburg": Color.fromARGB(vis, 255, 255, 255),
  "VfB Stuttgart": Color.fromARGB(vis, 211, 0, 41),
  "TSG 1899 Hoffenheim": Color.fromARGB(vis, 255, 255, 255),
  "Hertha BSC": Color.fromARGB(vis, 255, 255, 255),
  "FC Schalke 04": Color.fromARGB(vis, 255, 255, 255),
  "VfL Bochum 1848": Color.fromARGB(vis, 255, 255, 255),

  "Manchester City FC": Color.fromARGB(vis, 255, 255, 255),
  "Arsenal FC": Color.fromARGB(vis, 12,59,121),
  "Newcastle United FC": Color.fromARGB(vis, 255, 255, 255),
  "Manchester United FC": Color.fromARGB(vis, 255,241,0),
  "Liverpool FC": Color.fromARGB(vis, 255,255,255),
  "Tottenham Hotspur FC": Color.fromARGB(vis, 255,255,255),
  "Brighton & Hove Albion FC": Color.fromARGB(vis, 255, 255, 255),
  "Aston Villa FC": Color.fromARGB(vis, 135,191,233),
  "Brentford FC": Color.fromARGB(vis, 255,255,255),
  "Fulham FC": Color.fromARGB(vis, 255, 255, 255),
  "Chelsea FC": Color.fromARGB(vis, 255, 255, 255),
  "Crystal Palace FC": Color.fromARGB(vis, 0, 87, 171),
  "Wolverhampton Wanderers FC": Color.fromARGB(vis, 0, 0, 0),
  "AFC Bournemouth": Color.fromARGB(vis, 0, 0, 0),
  "West Ham United FC": Color.fromARGB(vis, 0, 178, 234),
  "Nottingham Forest FC": Color.fromARGB(vis, 255, 255, 255),
  "Everton FC": Color.fromARGB(vis, 255, 255, 255),
  "Leicester City FC": Color.fromARGB(vis, 255, 255, 255),
  "Leeds United FC": Color.fromARGB(vis, 255, 255, 255),
  "Southampton FC": Color.fromARGB(vis, 255, 255, 255),
};

var colorNames = {

  "FC Bayern München": "rot",
  "SC Freiburg": "rot",
  "1. FC Union Berlin": "rot",
  "Borussia Dortmund": "gelb",
  "RB Leipzig": "weiß",
  "Eintracht Frankfurt": "rot",
  "VfL Wolfsburg": "grün",
  "Borussia Mönchengladbach": "grün",
  "1. FSV Mainz 05": "rot",
  "Bayer 04 Leverkusen": "rot",
  "SV Werder Bremen": "grün",
  "1. FC Köln": "rot",
  "FC Augsburg": "rot",
  "VfB Stuttgart": "weiß",
  "TSG 1899 Hoffenheim": "blau",
  "Hertha BSC": "blau",
  "FC Schalke 04": "blau",
  "VfL Bochum 1848": "blau",

  "Manchester City FC": "blau",
  "Arsenal FC": "rot",
  "Newcastle United FC": "schwarz",
  "Manchester United FC": "rot",
  "Liverpool FC": "rot",
  "Tottenham Hotspur FC": "blau",
  "Brighton & Hove Albion FC": "blau",
  "Aston Villa FC": "rot",
  "Brentford FC": "rot",
  "Fulham FC": "schwarz",
  "Chelsea FC": "blau",
  "Crystal Palace FC": "blau",
  "Wolverhampton Wanderers FC": "gelb",
  "AFC Bournemouth": "rot",
  "West Ham United FC": "braun",
  "Nottingham Forest FC": "rot",
  "Everton FC": "blau",
  "Leicester City FC": "blau",
  "Leeds United FC": "gelb",
  "Southampton FC": "rot",
};