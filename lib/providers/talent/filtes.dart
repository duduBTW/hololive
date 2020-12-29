// import 'package:flutter/foundation.dart';
// // import 'package:http/http.dart' as http;

// class FiltersTalent with ChangeNotifier {
//   List<bool> _medias = List.generate(2, (_) => true);
//   double _youtubePerPage = 10;
//   double _twitterPerPage = 10;

//   List<bool> get medias => _medias;
//   double get youtubePerPage => _youtubePerPage;
//   double get twitterPerPage => _twitterPerPage;

//   set youtubePerPage(double value) {
//     _youtubePerPage = value;
//     notifyListeners();
//   }

//   set twitterPerPage(double value) {
//     _twitterPerPage = value;
//     notifyListeners();
//   }

//   setMedia(int index) {
//     _medias[index] = !_medias[index];
//     notifyListeners();
//   }
// }
