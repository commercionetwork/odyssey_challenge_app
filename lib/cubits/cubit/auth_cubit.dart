import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'auth_state.dart';

const pharmaUserPin = '1234';
const driverUserPin = '4321';

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
        return emit(const PharmaUserAuthenticated());
      } else if (pin == driverUserPin) {
        return emit(const DriverUserAuthenticated());
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
