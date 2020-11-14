part of 'scaffold_navigator_cubit.dart';

abstract class ScaffoldNavigatorState extends Equatable {
  const ScaffoldNavigatorState();
}

class ScaffoldNavigatorChangedRoute extends ScaffoldNavigatorState {
  const ScaffoldNavigatorChangedRoute({@required this.selectedIndex});

  final int selectedIndex;

  @override
  List<Object> get props => [selectedIndex];
}
