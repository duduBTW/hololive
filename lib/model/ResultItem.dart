// enum ResultItemType { Youtube, Reddit }

import 'package:json_annotation/json_annotation.dart';

part 'ResultItem.g.dart';

@JsonSerializable()
class ImageProp {
  final String low, medium, higth;

  ImageProp(this.low, this.medium, this.higth);

  factory ImageProp.fromJson(Map<String, dynamic> data) =>
      _$ImagePropFromJson(data);

  Map<String, dynamic> toJson() => _$ImagePropToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ReusltItem {
  final String resultItemType, id, title;
  final DateTime date;
  final ImageProp image;

  ReusltItem(this.resultItemType, this.id, this.image, this.title, this.date);

  factory ReusltItem.fromJson(Map<String, dynamic> data) =>
      _$ReusltItemFromJson(data);

  Map<String, dynamic> toJson() => _$ReusltItemToJson(this);
}
