import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'msg_transfer_nft.g.dart';

@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class MsgTransferNFT extends Equatable {
  const MsgTransferNFT({
    @required this.sender,
    @required this.recipient,
    @required this.denom,
    @required this.id,
  })  : assert(sender != null),
        assert(recipient != null),
        assert(denom != null),
        assert(id != null);

  factory MsgTransferNFT.fromJson(Map<String, dynamic> json) =>
      _$MsgTransferNFTFromJson(json);

  Map<String, dynamic> toJson() => _$MsgTransferNFTToJson(this);

  final String sender;
  final String recipient;
  final String denom;
  final String id;

  @override
  List<Object> get props => [sender, recipient, denom, id];
}
