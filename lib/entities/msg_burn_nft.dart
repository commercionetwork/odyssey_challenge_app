import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'msg_burn_nft.g.dart';

@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class MsgBurnNFT extends Equatable {
  const MsgBurnNFT({
    @required this.sender,
    @required this.id,
    @required this.denom,
  })  : assert(sender != null),
        assert(id != null),
        assert(denom != null);

  final String sender;
  final String id;
  final String denom;

  factory MsgBurnNFT.fromJson(Map<String, dynamic> json) =>
      _$MsgBurnNFTFromJson(json);

  Map<String, dynamic> toJson() => _$MsgBurnNFTToJson(this);

  @override
  List<Object> get props => [sender, denom, id];
}
