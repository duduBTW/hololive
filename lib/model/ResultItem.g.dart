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
    json['id'] as String,
    json['title'] as String,
    json['image'] as String,
    json['date'] == null ? null : DateTime.parse(json['date'] as String),
    json['type'] as int,
  );
}

Map<String, dynamic> _$ReusltItemToJson(ReusltItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'type': instance.type,
      'date': instance.date?.toIso8601String(),
    };
