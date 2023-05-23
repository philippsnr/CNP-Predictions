import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'dart:html' as html;
import 'dart:convert';


import 'package:requests/requests.dart';

Future<String> query(String sql) async {
  final url = "https://proxy.cnp-predictions.de/query2.php?sql=${Uri.encodeFull(sql)}";

  final response = await Requests.get(url);
  
  if (response.statusCode == 200) {
    String jsonString = response.body;

    return jsonString;

  } else {
    return('Error: ${response.statusCode}');
  }
}