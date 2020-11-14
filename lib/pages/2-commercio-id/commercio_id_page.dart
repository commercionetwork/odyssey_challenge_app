import 'package:odyssey_challenge_app/pages/2-commercio-id/export.dart';
import 'package:odyssey_challenge_app/pages/section_page.dart';
import 'package:odyssey_challenge_app/widgets/base_scaffold_widget.dart';
import 'package:odyssey_challenge_app/widgets/base_list_widget.dart';
import 'package:odyssey_challenge_app/widgets/subsection_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CommercioIdPage extends SectionPageWidget {
  const CommercioIdPage({Key key})
      : super('/2-id', 'CommercioIdPage', key: key);

  @override
  Widget build(BuildContext context) {
    return const BaseScaffoldWidget(bodyWidget: CommercioIdBody());
  }
}

class CommercioIdBody extends StatelessWidget {
  const CommercioIdBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BaseListWidget(
      children: [
        SubSectionWidget(
          sectionPage: CreateDDOPage(),
          title: '2.1 Create a Ddo',
          subtitle:
              'Perform a transaction to set the specified DidDocument as being associated with the address present inside the specified wallet.',
        ),
        SubSectionWidget(
          sectionPage: RequestPowerupPage(),
          title: '2.2 Request Powerup',
          subtitle:
              'Creates a new Did power up request for the given pairwiseDid and of the given amount only after you made a did deposit request.',
        ),
      ],
    );
  }
}
