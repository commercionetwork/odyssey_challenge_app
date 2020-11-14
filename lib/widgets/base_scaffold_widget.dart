import 'package:odyssey_challenge_app/repositories/layout_repository.dart';
import 'package:odyssey_challenge_app/widgets/base_app_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BaseScaffoldWidget extends StatelessWidget {
  final List<Widget> appBarWidgets;
  final Widget bodyWidget;
  final Color backgroundColor;

  const BaseScaffoldWidget({
    @required this.bodyWidget,
    this.appBarWidgets,
    this.backgroundColor,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.repository<LayoutRepository>().width(context),
      ),
      child: Scaffold(
        backgroundColor:
            backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
        appBar: BaseAppBarWidget(
          title: 'Odyssey Challenge App',
          widgets: appBarWidgets,
        ),
        extendBodyBehindAppBar: true,
        body: SafeArea(
          child: LayoutBuilder(
            builder: (_, __) => bodyWidget,
          ),
        ),
      ),
    );
  }
}
