import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'msg_mint_nft.g.dart';

@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class MsgMintNFT extends Equatable {
  const MsgMintNFT({
    @required this.sender,
    @required this.recipient,
    @required this.denom,
    @required this.id,
    @required this.tokenUri,
  })  : assert(sender != null),
        assert(recipient != null),
        assert(denom != null),
        assert(id != null),
        assert(tokenUri != null);

  final String sender;
  final String recipient;
  final String id;
  final String denom;
  final String tokenUri;

  factory MsgMintNFT.fromJson(Map<String, dynamic> json) =>
      _$MsgMintNFTFromJson(json);

  Map<String, dynamic> toJson() => _$MsgMintNFTToJson(this);

  @override
  List<Object> get props => [sender, recipient, denom, id, tokenUri];
}
