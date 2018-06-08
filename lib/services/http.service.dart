import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpService {
  static String defaultUrl = "";
  static Map<String, String> defaultHeaders = {
    "Content-Type": "application/json"
  };

  static post(Object data, {String url, Map<String, String> headers}) {
    if (url == null) url = defaultUrl;
    if (headers == null) headers = defaultHeaders;
    print(data);
    return http.post(
      Uri.encodeFull(url),
      headers: headers,
      body: jsonEncode(data)
    );
  }
}