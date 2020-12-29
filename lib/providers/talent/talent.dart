import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hololive/model/ResultItem.dart';
import 'package:hololive/model/Talent/TalentFilterModel.dart';
import 'package:hololive/providers/talent/filtes.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class TalentController with ChangeNotifier {
  final _pagingController = PagingController<int, ReusltItem>(
    firstPageKey: 0,
  );
  String _nextPageToken = "";
  bool collapsed = true;
  final microsecondsAn = 250;
  TalentFilterModel filters = new TalentFilterModel();

  String get nextPageToken => _nextPageToken;
  PagingController<int, ReusltItem> get pagingController => _pagingController;

  // List<bool> _medias = List.generate(2, (_) => true);
  // double _youtubePerPage = 10;
  // double _twitterPerPage = 10;

  set nextPageToken(String value) {
    _nextPageToken = value;
    notifyListeners();
  }

  TalentController() {
    _pagingController.addPageRequestListener((pageKey) {
      fetchPage(pageKey);
    });
  }

  Future<void> fetchPage(int pageKey) async {
    try {
      var response = await http.get(
          "http://localhost:5000/youtube?token=7f6ca27a-fce1-4da5-a8e8-def2e01b6da2&previusOldest=$nextPageToken&page=$pageKey&show=${filters.medias}");

      var jsonString = convert.utf8.decode(response.bodyBytes);

      var newPage = List<ReusltItem>.from(convert.json
          .decode(jsonString)['result']
          .map((x) => ReusltItem.fromJson(x)));

      nextPageToken = convert.json.decode(jsonString)['oldest'];

      final previouslyFetchedItemsCount =
          // 2
          _pagingController.itemList?.length ?? 0;
      final newItems = newPage;

      var count = convert.json.decode(jsonString)['count'];

      final newItemsCount =
          newPage.where((element) => element.type == 1).length;
      final totalFetchedItemsCount =
          previouslyFetchedItemsCount + newItemsCount;
      final isLastPage = totalFetchedItemsCount == count;

      if (isLastPage) {
        // 3
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      // 4
      _pagingController.error = error;
      throw error;
    }
  }
}
