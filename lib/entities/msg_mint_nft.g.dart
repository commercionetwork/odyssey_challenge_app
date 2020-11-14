// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'msg_mint_nft.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MsgMintNFT _$MsgMintNFTFromJson(Map<String, dynamic> json) {
  return MsgMintNFT(
    sender: json['sender'] as String,
    recipient: json['recipient'] as String,
    denom: json['denom'] as String,
    id: json['id'] as String,
    tokenUri: json['token_uri'] as String,
  );
}

Map<String, dynamic> _$MsgMintNFTToJson(MsgMintNFT instance) =>
    <String, dynamic>{
      'sender': instance.sender,
      'recipient': instance.recipient,
      'id': instance.id,
      'denom': instance.denom,
      'token_uri': instance.tokenUri,
    };
