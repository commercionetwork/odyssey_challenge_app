import 'package:odyssey_challenge_app/cubits/cubit/auth_cubit.dart';
import 'package:odyssey_challenge_app/cubits/scaffold_navigator_cubit.dart';
import 'package:odyssey_challenge_app/login_screen.dart';
import 'package:odyssey_challenge_app/repositories/layout_repository.dart';
import 'package:odyssey_challenge_app/screens/list_packages_screen.dart';
import 'package:odyssey_challenge_app/screens/qr_main_screen.dart';
import 'package:odyssey_challenge_app/widgets/base_app_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odyssey_challenge_app/widgets/default_bottom_navigation_bar.dart';

class BaseScaffoldWidget extends StatefulWidget {
  const BaseScaffoldWidget({
    this.appBarWidgets,
    Key key,
  }) : super(key: key);

  final List<Widget> appBarWidgets;

  @override
  _BaseScaffoldWidgetState createState() => _BaseScaffoldWidgetState();
}

class _BaseScaffoldWidgetState extends State<BaseScaffoldWidget> {
  final _children = const [
    QrMainScreen(),
    ListPackagesScreen(),
    LoginScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoggedOut) {
          Navigator.pushReplacementNamed(context, '/');
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: BaseAppBarWidget(
          title: 'Odyssey Challenge App',
          widgets: widget.appBarWidgets,
        ),
        extendBodyBehindAppBar: true,
        bottomNavigationBar:
            BlocBuilder<ScaffoldNavigatorCubit, ScaffoldNavigatorState>(
          builder: (_, state) => DefaultBottomNavigationBar(
            // ignore: deprecated_member_use
            onTap: context.bloc<ScaffoldNavigatorCubit>().changeRoute,
            selectedIndex: () =>
                (state as ScaffoldNavigatorChangedRoute).selectedIndex,
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              // ignore: deprecated_member_use
              horizontal: context.repository<LayoutRepository>().width(context),
            ),
            child: BlocConsumer<ScaffoldNavigatorCubit, ScaffoldNavigatorState>(
              listener: (context, state) {
                final idx =
                    (state as ScaffoldNavigatorChangedRoute).selectedIndex;

                if (idx == 2) {
                  // ignore: deprecated_member_use
                  context.bloc<AuthCubit>().logout();
                }
              },
              builder: (context, state) {
                final idx =
                    (state as ScaffoldNavigatorChangedRoute).selectedIndex;
                return _children.elementAt(idx);
              },
            ),
          ),
        ),
      ),
    );
  }
}
