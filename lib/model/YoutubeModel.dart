// To parse this JSON data, do
//
//     final youtubeModel = youtubeModelFromJson(jsonString);

import 'dart:convert';

YoutubeModel youtubeModelFromJson(String str) =>
    YoutubeModel.fromJson(json.decode(str));

String youtubeModelToJson(YoutubeModel data) => json.encode(data.toJson());

class YoutubeModel {
  YoutubeModel({
    this.kind,
    this.etag,
    this.nextPageToken,
    this.items,
    this.pageInfo,
  });

  String kind;
  String etag;
  String nextPageToken;
  List<Item> items;
  PageInfo pageInfo;

  factory YoutubeModel.fromJson(Map<String, dynamic> json) => YoutubeModel(
        kind: json["kind"],
        etag: json["etag"],
        nextPageToken: json["nextPageToken"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        pageInfo: PageInfo.fromJson(json["pageInfo"]),
      );

  Map<String, dynamic> toJson() {
    try {
      return {
        "kind": kind,
        "etag": etag,
        "nextPageToken": nextPageToken,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "pageInfo": pageInfo.toJson(),
      };
    } catch (e) {
      print(e);
    }
  }
}

class Item {
  Item({
    this.kind,
    this.etag,
    this.id,
    this.snippet,
  });

  String kind;
  String etag;
  String id;
  Snippet snippet;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        kind: json["kind"],
        etag: json["etag"],
        id: json["id"],
        snippet: Snippet.fromJson(json["snippet"]),
      );

  Map<String, dynamic> toJson() {
    try {
      return {
        "kind": kind,
        "etag": etag,
        "id": id,
        "snippet": snippet.toJson(),
      };
    } catch (e) {
      print(e);
    }
  }
}

class Snippet {
  Snippet({
    this.publishedAt,
    this.channelId,
    this.title,
    this.description,
    this.thumbnails,
    this.channelTitle,
    this.playlistId,
    this.position,
    this.resourceId,
  });

  DateTime publishedAt;
  String channelId;
  String title;
  String description;
  Thumbnails thumbnails;
  String channelTitle;
  String playlistId;
  int position;
  ResourceId resourceId;

  factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
        publishedAt: DateTime.parse(json["publishedAt"]),
        channelId: json["channelId"],
        title: json["title"],
        description: json["description"],
        thumbnails: Thumbnails.fromJson(json["thumbnails"]),
        channelTitle: json["channelTitle"],
        playlistId: json["playlistId"],
        position: json["position"],
        resourceId: ResourceId.fromJson(json["resourceId"]),
      );

  Map<String, dynamic> toJson() {
    try {
      return {
        "publishedAt": publishedAt.toIso8601String(),
        "channelId": channelId,
        "title": title,
        "description": description,
        "thumbnails": thumbnails.toJson(),
        "channelTitle": channelTitle,
        "playlistId": playlistId,
        "position": position,
        "resourceId": resourceId.toJson(),
      };
    } catch (e) {
      print(e);
    }
  }
}

class ResourceId {
  ResourceId({
    this.kind,
    this.videoId,
  });

  String kind;
  String videoId;

  factory ResourceId.fromJson(Map<String, dynamic> json) => ResourceId(
        kind: json["kind"],
        videoId: json["videoId"],
      );

  Map<String, dynamic> toJson() {
    try {
      return {
        "kind": kind,
        "videoId": videoId,
      };
    } catch (e) {
      print(e);
    }
  }
}

class Thumbnails {
  Thumbnails({
    this.thumbnailsDefault,
    this.medium,
    this.high,
    this.standard,
    this.maxres,
  });

  Default thumbnailsDefault;
  Default medium;
  Default high;
  Default standard;
  Default maxres;

  factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
        thumbnailsDefault:
            json["default"] != null ? Default.fromJson(json["default"]) : null,
        medium:
            json["medium"] != null ? Default.fromJson(json["medium"]) : null,
        high: json["high"] != null ? Default.fromJson(json["high"]) : null,
        standard: json["standard"] != null
            ? Default.fromJson(json["standard"])
            : null,
        maxres:
            json["maxres"] != null ? Default.fromJson(json["maxres"]) : null,
      );

  Map<String, dynamic> toJson() {
    try {
      return {
        "default": thumbnailsDefault.toJson(),
        "medium": medium.toJson(),
        "high": high.toJson(),
        "standard": standard.toJson(),
        "maxres": maxres.toJson(),
      };
    } catch (e) {
      print(e);
    }
  }
}

class Default {
  Default({
    this.url,
    this.width,
    this.height,
  });

  String url;
  int width;
  int height;

  factory Default.fromJson(Map<String, dynamic> json) => Default(
        url: json["url"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() {
    try {
      return {
        "url": url,
        "width": width,
        "height": height,
      };
    } catch (e) {
      print(e);
    }
  }
}

class PageInfo {
  PageInfo({
    this.totalResults,
    this.resultsPerPage,
  });

  int totalResults;
  int resultsPerPage;

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
        totalResults: json["totalResults"],
        resultsPerPage: json["resultsPerPage"],
      );

  Map<String, dynamic> toJson() {
    try {
      return {
        "totalResults": totalResults,
        "resultsPerPage": resultsPerPage,
      };
    } catch (e) {
      print(e);
    }
  }
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
