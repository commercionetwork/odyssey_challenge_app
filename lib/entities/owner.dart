import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:odyssey_challenge_app/entities/id_collection.dart';

part 'owner.g.dart';

@JsonSerializable(nullable: false)
class Owner extends Equatable {
  const Owner({
    @required this.address,
    @required this.idCollections,
  })  : assert(address != null),
        assert(idCollections != null);

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);

  Map<String, dynamic> toJson() => _$OwnerToJson(this);

  final String address;
  final List<IDCollection> idCollections;

  @override
  List<Object> get props => throw UnimplementedError();
}
