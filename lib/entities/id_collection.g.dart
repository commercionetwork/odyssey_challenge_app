// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'id_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IDCollection _$IDCollectionFromJson(Map<String, dynamic> json) {
  return IDCollection(
    denom: json['denom'] as String,
    ids: (json['ids'] as List).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$IDCollectionToJson(IDCollection instance) =>
    <String, dynamic>{
      'denom': instance.denom,
      'ids': instance.ids,
    };
