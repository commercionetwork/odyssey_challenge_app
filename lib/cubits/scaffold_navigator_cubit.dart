import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'scaffold_navigator_cubit_state.dart';

class ScaffoldNavigatorCubit extends Cubit<ScaffoldNavigatorState> {
  ScaffoldNavigatorCubit()
      : super(const ScaffoldNavigatorChangedRoute(selectedIndex: 0));

  void changeRoute(int index) {
    emit(ScaffoldNavigatorChangedRoute(selectedIndex: index));
  }

  void changeRouteNamed(String route) {
    switch (route) {
      case '/':
        return changeRoute(0);
      case '/qr-scan':
        return changeRoute(1);
    }
  }
}
