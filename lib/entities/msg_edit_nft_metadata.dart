import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'msg_edit_nft_metadata.g.dart';

@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class MsgEditNFTMetadata extends Equatable {
  const MsgEditNFTMetadata({
    @required this.sender,
    @required this.denom,
    @required this.id,
    @required this.tokenUri,
  })  : assert(sender != null),
        assert(denom != null),
        assert(id != null),
        assert(tokenUri != null);

  final String sender;
  final String id;
  final String denom;
  final String tokenUri;

  factory MsgEditNFTMetadata.fromJson(Map<String, dynamic> json) =>
      _$MsgEditNFTMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MsgEditNFTMetadataToJson(this);

  @override
  List<Object> get props => [sender, denom, id, tokenUri];
}
