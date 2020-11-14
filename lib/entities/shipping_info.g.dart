// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShippingInfo _$ShippingInfoFromJson(Map<String, dynamic> json) {
  return ShippingInfo(
    didAddress: json['did_address'] as String,
    type: _$enumDecode(_$ShipmentTypeEnumMap, json['type']),
    status: json['status'] as String,
    hawb: json['hawb'] as String,
    pickupAddress: json['pickup_address'] as String,
    deliveryAddress: json['delivery_address'] as String,
    delivery: json['delivery'] as String,
  );
}

Map<String, dynamic> _$ShippingInfoToJson(ShippingInfo instance) =>
    <String, dynamic>{
      'did_address': instance.didAddress,
      'type': _$ShipmentTypeEnumMap[instance.type],
      'status': instance.status,
      'hawb': instance.hawb,
      'pickup_address': instance.pickupAddress,
      'delivery_address': instance.deliveryAddress,
      'delivery': instance.delivery,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

const _$ShipmentTypeEnumMap = {
  ShipmentType.readyForTransport: 'readyForTransport',
  ShipmentType.transportation: 'transportation',
  ShipmentType.delivered: 'delivered',
};
