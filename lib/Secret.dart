class Secret {
  final String apiurl;
  final String apiurlbody;

  Secret({this.apiurl = "", this.apiurlbody = ""});

  factory Secret.fromJson(Map<String, dynamic> jsonMap) {
    return new Secret(
        apiurl: jsonMap["apiurl"], apiurlbody: jsonMap["apiurlbody"]);
  }
}
