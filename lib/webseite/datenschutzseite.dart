import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'texte.dart';
import 'webseite.dart';

class Datenschutzseite extends StatelessWidget {
  const Datenschutzseite({super.key});
  static const String route = "/datenschutz";

  @override
  Widget build(BuildContext context) {
    updateDeviceSize(context);
    return Scaffold(
      appBar: getAppbar(context),
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
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
                        child: SingleChildScrollView(
                          child: Html(data: datenschutzErklaerung),
                        )
                    )
                )
            )
        )
    );
  }
}
