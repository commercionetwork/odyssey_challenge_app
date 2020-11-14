import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shipping_info.g.dart';

@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ShippingInfo extends Equatable {
  const ShippingInfo({
    @required this.didAddress,
    @required this.type,
    @required this.status,
    @required this.hawb,
    @required this.pickupAddress,
    @required this.deliveryAddress,
    @required this.delivery,
  })  : assert(didAddress != null),
        assert(type != null),
        assert(status != null),
        assert(hawb != null),
        assert(pickupAddress != null),
        assert(deliveryAddress != null),
        assert(delivery != null);

  factory ShippingInfo.fromJson(Map<String, dynamic> json) =>
      _$ShippingInfoFromJson(json);

  final String didAddress;
  final ShipmentType type;
  final String status;
  final String hawb;
  final String pickupAddress;
  final String deliveryAddress;
  final String delivery;

  Map<String, dynamic> toJson() => _$ShippingInfoToJson(this);

  @override
  String toString() =>
      'ShippingInfo { didAddress: $didAddress, type: $type, status: $status, hawb: $hawb, pickupAddress: $pickupAddress, deliveryAddress: $deliveryAddress, delivery: $delivery }';

  @override
  List<Object> get props => [
        didAddress,
        type,
        status,
        hawb,
        pickupAddress,
        deliveryAddress,
        delivery,
      ];
}

enum ShipmentType {
  readyForTransport,
  transportation,
  delivered,
}

extension ShipmentTypeExtension on ShipmentType {
  String get stringified {
    switch (this) {
      case ShipmentType.readyForTransport:
        return 'Ready for transport';
      case ShipmentType.transportation:
        return 'Transportation';
      case ShipmentType.delivered:
        return 'Delivered';
      default:
        return null;
    }
  }
}
