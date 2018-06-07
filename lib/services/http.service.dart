import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpService {
  static String defaultUrl = "https://glacial-refuge-10252.herokuapp.com/users/login";
  static Map<String, String> defaultHeaders = {
    "Content-Type": "application/json"
  };

  static post(Object data, {String url, Map<String, String> headers}) {
    if (url == null) url = defaultUrl;
    if (headers == null) headers = defaultHeaders;
    return http.post(
      Uri.encodeFull(url),
      headers: headers,
      body: jsonEncode(data)
    );
  }
}