// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResultItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageProp _$ImagePropFromJson(Map<String, dynamic> json) {
  return ImageProp(
    json['low'] as String,
    json['medium'] as String,
    json['higth'] as String,
  );
}

Map<String, dynamic> _$ImagePropToJson(ImageProp instance) => <String, dynamic>{
      'low': instance.low,
      'medium': instance.medium,
      'higth': instance.higth,
    };

ReusltItem _$ReusltItemFromJson(Map<String, dynamic> json) {
  return ReusltItem(
    json['resultItemType'] as String,
    json['id'] as String,
    json['image'] == null
        ? null
        : ImageProp.fromJson(json['image'] as Map<String, dynamic>),
    json['title'] as String,
    json['date'] == null ? null : DateTime.parse(json['date'] as String),
  );
}

Map<String, dynamic> _$ReusltItemToJson(ReusltItem instance) =>
    <String, dynamic>{
      'resultItemType': instance.resultItemType,
      'id': instance.id,
      'title': instance.title,
      'date': instance.date?.toIso8601String(),
      'image': instance.image?.toJson(),
    };
