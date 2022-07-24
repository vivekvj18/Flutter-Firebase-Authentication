import 'dart:convert';

import 'package:firebase_signin/TU_COMPONENTS/TU_Searchbar.dart';
import 'package:firebase_signin/TU_UTILS/TU_Key.dart';
import 'package:http/http.dart' as http;

Future<List> fetchnews() async {
  final response = await http.get(
    Uri.parse('https://newsapi.org/v2/top-headlines?country=in&category=technology&pageSize=100&apiKey=' +
        Key.key +
        '&q=' +
        SearchBar.searchcontroller.text),
  );
  Map result = jsonDecode(response.body);
  print('Fetched');

  return (result['articles']);
}