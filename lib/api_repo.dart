import 'dart:convert';
import 'package:http/http.dart' as http;
import 'SecretLoader.dart';
import 'Secret.dart';

class ApiService {
  static Future<List<dynamic>> callWithHeaserParams() async {
    Secret secret = await SecretLoader().load();
    String finalUrl =
        '${secret.apiurl}/e71234d056b056c794a321e54fffc92f/?getall=0';

    final response = await http.post(finalUrl);
    if (response.statusCode == 200) {
      var jjssoonn = json.encode(json.decode(utf8.decode(response.bodyBytes)));
      var responseJson1 = json.decode(jjssoonn);
      List<dynamic> test = json.decode(responseJson1);
      return test;
    } else {
      return null;
    }
  }

  static Future<bool> callWithBodyParams(body) async {
    // BODY
    // {
    //   "name": "test",
    //   "age": "23"
    // }
    Future<Secret> secret = SecretLoader().load();
    final response = await http
        .post('${secret.then((value) => value.apiurl)}/create', body: body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
