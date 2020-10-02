import 'dart:convert';
import 'package:http/http.dart' as http;
import '../SecretLoader.dart';
import '../Secret.dart';

class ApiRepo {
  static Future<List<dynamic>> callWithHeaserParams(
      String procName, String params) async {
    //params must be a json with key values of parameters that backend needed
    Secret secret = await SecretLoader().load();
    String finalUrl =
        '${secret.apiurl}/?procname=' + procName + '&params=' + params;

    final response = await http.post(finalUrl);
    if (response.statusCode == 200) {
      var standardJson =
          json.encode(json.decode(utf8.decode(response.bodyBytes)));
      var data = json.decode(standardJson);
      List<dynamic> test = json.decode(data);
      return test;
    } else {
      return null;
    }
  }

  static Future<List<dynamic>> callWithBodyParams(String body) async {
    //body must be a standard json
    Secret secret = await SecretLoader().load();
    String finalUrl = '${secret.apiurlbody}';

    final response = await http.post(finalUrl);

    if (response.statusCode == 200) {
      var standardJson =
          json.encode(json.decode(utf8.decode(response.bodyBytes)));
      var data = json.decode(standardJson);
      List<dynamic> test = json.decode(data);
      return test;
    } else {
      return null;
    }
  }
}
