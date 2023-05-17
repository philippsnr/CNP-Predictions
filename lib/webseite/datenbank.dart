import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'dart:html' as html;
import 'dart:convert';


import 'package:requests/requests.dart';

void query(String sqlCommand) async {
  var url = Uri.parse('http://proxy.cnp-predictions.de/query.php');

  var response = await http.post(url, body: {'sql_command': sqlCommand});

  if (response.statusCode == 301) {
    // Umgeleitete URL verwenden
    var redirectedUrl = response.headers['location'];
    var redirectedUri = Uri.parse(redirectedUrl!);

    var redirectedResponse = await http.post(redirectedUri, body: {'sql_command': sqlCommand});

    if (redirectedResponse.statusCode == 200) {
      var result = json.decode(redirectedResponse.body);
      // Hier kannst du das Ergebnis weiterverarbeiten
      print(result);
    } else {
      print('Fehler bei der umgeleiteten Anfrage: ${redirectedResponse.statusCode}');
    }
  } else if (response.statusCode == 200) {
    var result = json.decode(response.body);
    // Hier kannst du das Ergebnis weiterverarbeiten
    print(result);
  } else {
    print('Fehler: ${response.statusCode}');
  }
}

Future<String> query2(String sql) async {
  final url = "https://proxy.cnp-predictions.de/query2.php?sql=${Uri.encodeFull(sql)}";

  final response = await Requests.get(url);
  
  if (response.statusCode == 200) {
    String jsonString = response.body;

    return jsonString;

  } else {
    return('Error: ${response.statusCode}');
  }
}