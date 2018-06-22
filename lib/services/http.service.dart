// Dart requirements
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

// Complementary Services
import 'base.service.dart';

/// Static class to wrap all the HTTP Request functionality
class HttpService {
  
  /// Timeout for the requests in miliseconds (default 10000)
  static int timeout = 10000;

  /// Url to use if none is provided
  static String defaultUrl = "";

  /// Headers Map to use if none is provided
  static Map<String, String> defaultHeaders = {
    "Content-Type": "application/json"
  };

  /// Make a post request
  /// * [data] (mandatory) : a JSON parseable object to send as parameters of the request
  /// * [url] (optional) : a String with the target url for the request
  /// * [headers] (optional) : a Map containing request headers
  static Future<http.Response> post(Object data, {String url, Map<String, String> headers}) {
    if (url == null) url = defaultUrl; // Sets the url to default if none is provided
    if (headers == null) headers = defaultHeaders; // Sets the headers to default if none are provided
    BaseService.log(data); // Log the data object to the developers console
    
    // Returning the Future<Response> of the post request
    return http.post(
      Uri.encodeFull(url),
      headers: headers,
      body: jsonEncode(data)
    ).timeout( // Setting the timeout (will throw an exception if Future isn't complete after [timeout] miliseconds)
      new Duration(milliseconds: timeout)
    );
  }

}