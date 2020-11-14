import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'collection_total_supply.g.dart';

@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class CollectionTotalSupply extends Equatable {
  const CollectionTotalSupply({
    @required this.denom,
    @required this.supply,
  })  : assert(denom != null),
        assert(supply != null);

  final String denom;
  final int supply;

  factory CollectionTotalSupply.fromJson(Map<String, dynamic> json) =>
      _$CollectionTotalSupplyFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionTotalSupplyToJson(this);

  @override
  List<Object> get props => [denom, supply];
}
