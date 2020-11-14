import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'auth_state.dart';

const pharmaUserPin = '0000';
const driverUserPin = '1111';

const merckMnemonic =
    'better runway ski scissors marriage luggage direct cousin asset ill panel cattle bargain dog inquiry trigger anxiety film curve click romance hurdle road already';
const dhlMnemonic =
    'dream express verb mirror bulk slight fringe crash tornado like series minor art shaft slender reunion kiwi nurse dry pole leopard image infant modify';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthInitial());

  String validatePin(String value) {
    if (value.length < 4) {
      return 'The PIN should have at least a length of 4.';
    }

    return null;
  }

  void authenticate({@required String pin}) {
    emit(const AuthLoading());

    try {
      if (pin == pharmaUserPin) {
        return emit(const PharmaUserAuthenticated(mnemonic: merckMnemonic));
      } else if (pin == driverUserPin) {
        return emit(const DriverUserAuthenticated(mnemonic: dhlMnemonic));
      } else {
        return emit(const AuthFailure());
      }
    } catch (e, st) {
      emit(AuthError(error: e, stackTrace: st));
    }
  }

  void logout() {
    emit(const AuthLoading());
    emit(const LoggedOut());
  }
}
