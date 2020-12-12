import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../model/YoutubeModel.dart';

List<T> parseResponse<T>(http.Response response, {Type type}) {
  if (type == null) {
    type = T;
  }

  final jsonResponse = convert.json
      .decode(convert.utf8.decode(response.bodyBytes))
      .cast<Map<String, dynamic>>();

  switch (type) {
    case YoutubeModel:
      return jsonResponse
          .map<YoutubeModel>((json) => YoutubeModel.fromJson(json))
          .toList();
    default:
      throw StateError('Unable to unmarshal value of type \'$type\'');
  }
}
