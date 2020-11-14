import 'package:commercio_ui/commercio_ui.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class MsgOwnedNTFCollections extends StdMsg implements EquatableMixin {
  MsgOwnedNTFCollections({
    @required this.address,
    @required this.idCollections,
  })  : assert(address != null),
        assert(idCollections != null),
        super(type: 'commercio/Owner', value: {
          'address': address,
          'idCollections': idCollections,
        });

  MsgOwnedNTFCollections.fromJson(Map<String, dynamic> json)
      : address = json['address'],
        idCollections = json['idCollections'];

  final String address;
  final String idCollections;

  @override
  List<Object> get props => [address, idCollections];

  @override
  bool get stringify => true;

  @override
  String toString() =>
      'MsgOwnedNTFCollections { address: $address, idCollections: $idCollections }';
}
