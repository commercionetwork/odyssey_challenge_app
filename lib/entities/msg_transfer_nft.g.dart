// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'msg_transfer_nft.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MsgTransferNFT _$MsgTransferNFTFromJson(Map<String, dynamic> json) {
  return MsgTransferNFT(
    sender: json['sender'] as String,
    recipient: json['recipient'] as String,
    denom: json['denom'] as String,
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$MsgTransferNFTToJson(MsgTransferNFT instance) =>
    <String, dynamic>{
      'sender': instance.sender,
      'recipient': instance.recipient,
      'denom': instance.denom,
      'id': instance.id,
    };
