import 'dart:convert';

import 'package:dart_utility/logger/logger_factory.dart';
import 'package:http/http.dart' as http;

class AmosHttpClient {
  static final Logger _logger = LoggerFactory.getLogger(AmosHttpClient);

  late final http.Client _client;

  AmosHttpClient({
    http.Client? httpClient,
  }) {
    _client = httpClient ?? http.Client();
  }

  Future<http.Response> get({
    required String route,
    Map<String, String>? headers,
  }) async {
    Uri uri = _buildUri(route);

    _logRequest(uri);

    http.Response response = await _client.get(
      uri,
      headers: headers,
    );

    _logResponse(uri, response);

    return response;
  }

  Future<http.Response> post({
    required String route,
    Object? body,
    Map<String, String>? headers,
  }) async {
    Uri uri = _buildUri(route);

    _logRequest(uri);

    http.Response response = await _client.post(
      uri,
      body: body,
      headers: headers,
      encoding: Encoding.getByName("utf-8"),
    );

    _logResponse(uri, response);

    return response;
  }

  Future<http.Response> put({
    required String route,
    Object? body,
    Map<String, String>? headers,
  }) async {
    Uri uri = _buildUri(route);

    _logRequest(uri);

    http.Response response = await _client.put(
      uri,
      body: body,
      headers: headers,
    );

    _logResponse(uri, response);

    return response;
  }

  Future<http.Response> delete({
    required String route,
    Map<String, String>? headers,
  }) async {
    Uri uri = _buildUri(route);

    _logRequest(uri);

    http.Response response = await _client.delete(
      uri,
      headers: headers,
    );

    _logResponse(uri, response);

    return response;
  }

  Uri _buildUri(String route) {
    return Uri.parse(route);
  }

  void _logRequest(Uri uri) {
    _logger.debug("sending http request to uri: ${uri.path}");
  }

  void _logResponse(Uri uri, http.Response response) {
    _logger.debug(
        "received response of size ${response.bodyBytes.length} bytes, with code ${response.statusCode}, from call to route ${uri.path}");
  }
}