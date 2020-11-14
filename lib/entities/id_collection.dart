import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'id_collection.g.dart';

@JsonSerializable(nullable: false)
class IDCollection extends Equatable {
  const IDCollection({
    @required this.denom,
    @required this.ids,
  })  : assert(denom != null),
        assert(ids != null);

  factory IDCollection.fromJson(Map<String, dynamic> json) =>
      _$IDCollectionFromJson(json);

  Map<String, dynamic> toJson() => _$IDCollectionToJson(this);

  final String denom;
  final List<String> ids;

  @override
  List<Object> get props => [denom, ids];
}
