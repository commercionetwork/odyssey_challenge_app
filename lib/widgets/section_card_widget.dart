import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:odyssey_challenge_app/entities/section_page.dart';
import 'package:odyssey_challenge_app/widgets/paragraph_widget.dart';
import 'package:odyssey_challenge_app/widgets/section_button_widget.dart';
import 'package:odyssey_challenge_app/widgets/title_widget.dart';

class SectionCardWidget extends StatelessWidget {
  final SectionPage sectionPage;
  final void Function() onTap;

  const SectionCardWidget({
    Key key,
    @required this.sectionPage,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 2.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TitleWidget(
                sectionPage.title,
                padding: const EdgeInsets.all(0.0),
              ),
              ParagraphWidget(sectionPage.description),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SectionButtonWidget(sectionPage: sectionPage),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
