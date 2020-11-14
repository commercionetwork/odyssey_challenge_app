import 'dart:convert';

import 'package:commercio_ui/commercio_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:odyssey_challenge_app/entities/collection_total_supply.dart';
import 'package:odyssey_challenge_app/entities/msg_owned_ntf_collections.dart';

abstract class NFTService {
  static Future<CollectionTotalSupply> getCollectionTotalSupply({
    @required Wallet wallet,
    @required String denom,
  }) async {
    final url = '${wallet.networkInfo.lcdUrl}/nft/supply/$denom';
    final response = await Network.queryChain(url);

    if (response == null) {
      return null;
    }

    return CollectionTotalSupply.fromJson(jsonDecode(response));
  }

  static Future<MsgOwnedNTFCollections> getOwnedNTFCollections({
    @required Wallet wallet,
    @required String delegatorAddress,
  }) async {
    final url = '${wallet.networkInfo.lcdUrl}/nft/owner/$delegatorAddress';
    final response = await Network.queryChain(url);

    if (response == null) {
      return null;
    }

    return MsgOwnedNTFCollections.fromJson(jsonDecode(response));
  }

  static Future getNTFsFromCollection({
    @required Wallet wallet,
    @required String delegatorAddress,
    @required String denom,
  }) async {
    final url =
        '${wallet.networkInfo.lcdUrl}/nft/owner/$delegatorAddress/collection/$denom';
    final response = await Network.queryChain(url);

    if (response == null) {
      return null;
    }

    return response;
    // return MsgOwnedNTFCollections.fromJson(jsonDecode(response));
  }
}
