import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:news/api/models/response/news_response.dart';
import 'package:news/api/models/response/source_response.dart';

class EndPoint {
  static const String source = "v2/top-headlines/sources";
  static const String news = "/v2/top-headlines";
}

class ApiManager {
  static const String baseUrl = "newsapi.org";
  static const String apiKey = "454866b9fb0d4ea8bdcba230bb2211fc";

  static Future<SourceResponse?> getSourceByCategory(String catId) async {
    var params = {
      "apiKey": apiKey,
      "category": catId,
    };
    var url = Uri.https(baseUrl, EndPoint.source, params);
    try {
      var response = await http.get(url, headers: {"X-Api-Key": apiKey});
      var json = jsonDecode(response.body);
      var sourceResponse = SourceResponse.fromJson(json);
      return sourceResponse;
    } on SocketException {
      print("No Internet Connection");
    } on HttpException {
      print("Couldn't find the post");
    } on FormatException {
      print("Bad Response format");
    }
    return null;
  }

  static Future<NewsResponse?> getNewsBySources(String sourceId) async {
    var params = {
      "apiKey": apiKey,
      "sources": sourceId,
    };
    var url = Uri.https(baseUrl, EndPoint.news, params);
    try {
      var response = await http.get(url, headers: {"X-Api-Key": apiKey});
      var json = jsonDecode(response.body);
      var newResponse = NewsResponse.fromJson(json);
      return newResponse;
    } on SocketException {
      print("No Internet Connection");
    } on HttpException {
      print("Couldn't find the post");
    } on FormatException {
      print("Bad Response format");
    }
    return null;
  }
}
