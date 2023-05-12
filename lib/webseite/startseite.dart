// ignore_for_file: non_constant_identifier_names

import 'ligen/bundesliga.dart';
import 'ligen/premierleague.dart';
import 'ligen/serie_a.dart';
import 'ligen/ligue_1.dart';
import 'ligen/la_liga.dart';
import 'package:cnppredictions/webseite/webseite.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_html/flutter_html.dart';
import 'texte.dart';
import 'datenschutzseite.dart';

ScrollController controller = ScrollController();
GlobalKey StartKey = GlobalKey();
GlobalKey SocialmediaKey = GlobalKey();
GlobalKey AboutUsKey = GlobalKey();
GlobalKey ContributorsKey = GlobalKey();
GlobalKey DataProtectionKey = GlobalKey();
GlobalKey CompetitionsKey = GlobalKey();
GlobalKey TestKey = GlobalKey();

class Startseite extends StatefulWidget {
  const Startseite({super.key});
  static const route = "/home";

  @override
  State<Startseite> createState() => _StartseiteState();
}

class _StartseiteState extends State<Startseite> {
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
      appBar: getAppbar(context),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: (MediaQuery.of(context).size.height),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(image: AssetImage("assets/images/logo.jpg")),
          ),
          child: Center(
              child: Container(
            width: deviceWidth,
            height: deviceHeight,
            color: const Color.fromARGB(215, 0, 0, 0),
            child: ListView(
              semanticChildCount: 12,
              controller: controller,
              children: [
                SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: controller,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(key: StartKey ,child: Start()),
                      Container(key: CompetitionsKey ,child: Competitions(context))
                    ],
                  ),
                ),
                balken,
                Container(key: SocialmediaKey, child: SocialMedia()),
                balken,
                Container(key: AboutUsKey, child: AboutUs()),
                balken,
                Container(key: ContributorsKey, child: Contributors()),
                balken,
                Container(
                    key: DataProtectionKey, child: DataProtection(context)),
                balken,
                SizedBox(
                  child: Center(
                    child: Center(child: Html(data: impressum)),
                  ),
                ),
                balken,
              ],
            ),
          )),
        ),
      ),
    );
  }

  Widget Start() {
    return SizedBox(
        height: deviceHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Html(data: starttext),
            TextButton(
              onPressed: () {
                scrollTo(CompetitionsKey);
              },
              child: SizedBox(
                  width: 130,
                  height: 40,
                  child: Container(
                      color: const Color.fromARGB(255, 84, 17, 145),
                      child: Center(child: Html(data: zuDenSpielen)))),
            )
          ],
        ));
  }

  Widget SocialMedia() {
    return Column(
      children: [
        SizedBox(
            child: Html(
                data:
                    r"""<h1 style="text-align: center;"><span style="color: #ffffff;">Social Media</span></h1>""")),
        InkWell(
          child: const Text("Instagram: @cnp.predictions",
              style: TextStyle(color: Colors.white)),
          onTap: () => launchUrl(
              Uri.parse("https://www.instagram.com/cnp.predictions/")),
        ),
        SizedBox(child: Html(data: r"""""")),
        InkWell(
          child: const Text("Tiktok: @cnp.predictions",
              style: TextStyle(color: Colors.white)),
          onTap: () =>
              launchUrl(Uri.parse("https://www.tiktok.com/@cnp.predictions")),
        ),
        SizedBox(child: Html(data: r"""""")),
      ],
    );
  }

  Widget AboutUs() {
    return Column(
      children: [
        SizedBox(
          child: Html(
              data:
                  r"""<h1 style="text-align: center;"><span style="color: #ffffff;">About Us</span></h1>"""),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.person, color: Colors.white),
                  Text("Christoph Neumeister",
                      style: TextStyle(color: Colors.white)),
                ],
              ),
              onTap: () =>
                  launchUrl(Uri.parse("https://www.instagram.com/chris.nmr/")),
            ),
            const SizedBox(width: 20),
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.person, color: Colors.white),
                  Text("Philipp Staudinger",
                      style: TextStyle(color: Colors.white)),
                ],
              ),
              onTap: () => launchUrl(
                  Uri.parse("https://www.instagram.com/philipp.snr/")),
            ),
          ],
        ),
        SizedBox(child: Html(data: r"""""")),
      ],
    );
  }
}

Widget Contributors() {
  return Column(
    children: [
      SizedBox(
          child: Html(
              data:
                  r"""<h1 style="text-align: center;"><span style="color: #ffffff;">Contributors</span></h1>""")),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.person, color: Colors.white),
                Text("Felix Göller", style: TextStyle(color: Colors.white)),
              ],
            ),
            onTap: () =>
                launchUrl(Uri.parse("https://www.instagram.com/ifelix.gr/")),
          ),
          const SizedBox(width: 20),
          InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.person, color: Colors.white),
                Text("Alexander Strauss", style: TextStyle(color: Colors.white)),
              ],
            ),
            onTap: () =>
                launchUrl(Uri.parse("https://www.instagram.com/alex.str_/")),
          ),
        ],
      ),
      SizedBox(child: Html(data: r"""""")),
    ],
  );
}

Widget DataProtection(context) {
  return SizedBox(
    child: Center(
      child: TextButton(
        child: Html(
            data:
                r"""<h1 style="text-align: center;"><span style="color: #ffffff;">Data protection</span></h1>"""),
        onPressed: () {
          openPage(context, Datenschutzseite.route);
        },
      ),
    ),
  );
}

Widget Competitions(context){
  TextStyle style = const TextStyle(fontSize: 20 ,color: Colors.white);
  return SizedBox(
    width: deviceWidth,
    height: deviceHeight,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: (){
              openPage(context, Bundesliga.route);
            },
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/flags/deutschland.png"), fit: BoxFit.fill),
              ),
              child: SizedBox(
                width: 200,
                height: 70,
                child: Container(
                  width: 200,
                  height: 70,
                  color: const Color.fromARGB(150, 0, 0, 0),
                  child: Center(child: Text("Bundesliga", style: style)),
                )
                ),
            ),
          ),
          const SizedBox(height: 35),
          TextButton(
            onPressed: (){
              openPage(context, PremierLeague.route);
            },
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/flags/england.png"), fit: BoxFit.fill),
              ),
              child: SizedBox(
                width: 200,
                height: 70,
                child: Container(
                  width: 200,
                  height: 70,
                  color: const Color.fromARGB(150, 0, 0, 0),
                  child: Center(child: Text("Premier League", style: style)),
                )
              ),
            ),
          ),
          const SizedBox(height: 35),
          TextButton(
            onPressed: (){
              openPage(context, La_Liga.route);
            },
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/flags/spanien.png"), fit: BoxFit.fill),
              ),
              child: SizedBox(
                width: 200,
                height: 70,
                child: Container(
                  width: 200,
                  height: 70,
                  color: const Color.fromARGB(150, 0, 0, 0),
                  child: Center(child: Text("La Liga", style: style)),
                )
              ),
            ),
          ),
          const SizedBox(height: 35),
          TextButton(
            onPressed: (){
              openPage(context, Serie_A.route);
            },
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/flags/italien.png"), fit: BoxFit.fill),
              ),
              child: SizedBox(
                width: 200,
                height: 70,
                child: Container(
                  width: 200,
                  height: 70,
                  color: const Color.fromARGB(150, 0, 0, 0),
                  child: Center(child: Text("Serie A", style: style)),
                )
              ),
            ),
          ),
          const SizedBox(height: 35),
          TextButton(
            onPressed: (){
              openPage(context, Ligue_1.route);
            },
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/flags/frankreich.png"), fit: BoxFit.fill),
              ),
              child: SizedBox(
                width: 200,
                height: 70,
                child: Container(
                  width: 200,
                  height: 70,
                  color: const Color.fromARGB(150, 0, 0, 0),
                  child: Center(child: Text("Ligue 1", style: style)),
                )
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

void scrollTo(GlobalKey key) {
  final targetContext = key.currentContext;
  Scrollable.ensureVisible(targetContext!, duration: const Duration(seconds: 1));
}
