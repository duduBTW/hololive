import 'package:json_annotation/json_annotation.dart';

part 'ResultItem.g.dart';

enum ResultItemType { None, Youtube, Reddit, Twitter }

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
  final String id, title, image;
  final int type;
  final DateTime date;

  String getType() {
    switch (this.type) {
      case 1:
        return 'Youtube';
        break;
      case 2:
        return 'Reddit';
        break;
      case 3:
        return 'Twitter';
        break;
      default:
        return 'idk';
    }
  }

  // ReusltItem(this.type, this.id, this.image, this.title, this.date);
  ReusltItem(this.id, this.title, this.image, this.date, this.type);

  factory ReusltItem.fromJson(Map<String, dynamic> data) =>
      _$ReusltItemFromJson(data);

  Map<String, dynamic> toJson() => _$ReusltItemToJson(this);
}
