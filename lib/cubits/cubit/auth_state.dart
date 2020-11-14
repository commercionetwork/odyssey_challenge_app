part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  const AuthInitial();

  @override
  List<Object> get props => [];
}

class AuthLoading extends AuthState {
  const AuthLoading();

  @override
  List<Object> get props => [];
}

class PharmaUserAuthenticated extends AuthState {
  const PharmaUserAuthenticated();

  @override
  List<Object> get props => [];
}

class DriverUserAuthenticated extends AuthState {
  const DriverUserAuthenticated();

  @override
  List<Object> get props => [];
}

class LoggedOut extends AuthState {
  const LoggedOut();

  @override
  List<Object> get props => [];
}

class AuthFailure extends AuthState {
  const AuthFailure();

  @override
  List<Object> get props => [];
}

class AuthError extends AuthState {
  const AuthError({
    @required this.error,
    @required this.stackTrace,
  })  : assert(error != null),
        assert(stackTrace != null);

  final Object error;
  final StackTrace stackTrace;

  @override
  List<Object> get props => [error, stackTrace];
}
