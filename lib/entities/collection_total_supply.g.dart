// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_total_supply.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionTotalSupply _$CollectionTotalSupplyFromJson(
    Map<String, dynamic> json) {
  return CollectionTotalSupply(
    denom: json['denom'] as String,
    supply: json['supply'] as int,
  );
}

Map<String, dynamic> _$CollectionTotalSupplyToJson(
        CollectionTotalSupply instance) =>
    <String, dynamic>{
      'denom': instance.denom,
      'supply': instance.supply,
    };
