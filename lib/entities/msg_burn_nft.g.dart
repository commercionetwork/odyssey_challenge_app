// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'msg_burn_nft.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MsgBurnNFT _$MsgBurnNFTFromJson(Map<String, dynamic> json) {
  return MsgBurnNFT(
    sender: json['sender'] as String,
    id: json['id'] as String,
    denom: json['denom'] as String,
  );
}

Map<String, dynamic> _$MsgBurnNFTToJson(MsgBurnNFT instance) =>
    <String, dynamic>{
      'sender': instance.sender,
      'id': instance.id,
      'denom': instance.denom,
    };
