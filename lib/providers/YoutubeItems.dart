import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../model/YoutubeModel.dart';
import '../utils/parseResponse.dart';

class YoutubeItems with ChangeNotifier {
  List<YoutubeModel> _youtube = null;
  String _channelId = null;
  bool _loading = false;

  List<YoutubeModel> get youtube => _youtube;
  bool get loading => _loading;

  set youtube(List<YoutubeModel> newModel) {
    _youtube = newModel;
    notifyListeners();
  }

  set loading(bool newValue) {
    _loading = newValue;
    notifyListeners();
  }

  void attStatus(String channelId) {
    if (_youtube == null || channelId != _channelId) {
      _channelId = channelId;
      loading = true;

      http
          .get("http://127.0.0.1/youtube?channelId=$channelId")
          .then((response) {
        var content = parseResponse<YoutubeModel>(response);
        // content.insert(0, TypesModel("Nenhum"));
        _youtube = content;
        _loading = false;
        notifyListeners();
      });
    }
  }
}
