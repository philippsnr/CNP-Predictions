import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'texte.dart';
import 'webseite.dart';

class Impressumseite extends StatelessWidget {
  const Impressumseite({super.key});
  static const String route = "/impressum";

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
                        child: Center(
                          child: SingleChildScrollView(
                            child: Html(data: impressum),
                          ),
                        )
                    )
                )
            )
        )
    );
  }
}
