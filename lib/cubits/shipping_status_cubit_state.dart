import 'package:equatable/equatable.dart';

abstract class ShippingStatusState extends Equatable {
  const ShippingStatusState();
}

class ShippingStatusInitial extends ShippingStatusState {
  const ShippingStatusInitial();

  @override
  List<Object> get props => [];
}

class ShippingStatusLoading extends ShippingStatusState {
  const ShippingStatusLoading();

  @override
  List<Object> get props => [];
}

class ShippingInfoSuccess extends ShippingStatusState {
  const ShippingInfoSuccess();

  @override
  List<Object> get props => [];
}

class ShippingInfoError extends ShippingStatusState {
  const ShippingInfoError();

  @override
  List<Object> get props => [];
}
