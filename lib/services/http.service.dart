import 'package:http/http.dart' as http;
//import 'base.service.dart';
import 'dart:convert';

class HttpService {
  static String defaultUrl = "";
  static Map<String, String> defaultHeaders = {
    "Content-Type": "application/json"
  };

  static post(Object data, {String url, Map<String, String> headers}) {
    if (url == null) url = defaultUrl;
    if (headers == null) headers = defaultHeaders;
    //if (BaseService.dev) print(data);
    return http.post(
      Uri.encodeFull(url),
      headers: headers,
      body: jsonEncode(data)
    );
  }
}

main() async {
  HttpService.defaultUrl = "https://glacial-refuge-10252.herokuapp.com/users/login";
  //var a = await HttpService.post({'email':'test@test.com', 'password':'12345678'});
  var a = {'ja': 'lololo'};
  //print(a.j);
  print(a['je']);
}