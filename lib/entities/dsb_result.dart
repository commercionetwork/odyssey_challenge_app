import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dsb_result.g.dart';

@JsonSerializable(nullable: false)
class DsbResult {
  const DsbResult({
    @required this.cert,
    @required this.hash,
  })  : assert(cert != null),
        assert(hash != null);

  factory DsbResult.fromJson(Map<String, dynamic> json) =>
      _$DsbResultFromJson(json);

  final String cert;
  final String hash;

  Map<String, dynamic> toJson() => _$DsbResultToJson(this);

  @override
  String toString() => 'GetReponse { cert: $cert, hash: $hash }';
}
