// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'msg_edit_nft_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MsgEditNFTMetadata _$MsgEditNFTMetadataFromJson(Map<String, dynamic> json) {
  return MsgEditNFTMetadata(
    sender: json['sender'] as String,
    denom: json['denom'] as String,
    id: json['id'] as String,
    tokenUri: json['token_uri'] as String,
  );
}

Map<String, dynamic> _$MsgEditNFTMetadataToJson(MsgEditNFTMetadata instance) =>
    <String, dynamic>{
      'sender': instance.sender,
      'id': instance.id,
      'denom': instance.denom,
      'token_uri': instance.tokenUri,
    };
