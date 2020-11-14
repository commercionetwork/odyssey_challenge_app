import 'package:odyssey_challenge_app/pages/export.dart';
import 'package:odyssey_challenge_app/widgets/base_scaffold_widget.dart';
import 'package:odyssey_challenge_app/widgets/base_list_widget.dart';
import 'package:odyssey_challenge_app/widgets/subsection_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CommercioKYCPage extends SectionPageWidget {
  const CommercioKYCPage({Key key})
      : super('/6-kyc', 'CommercioKYCPage', key: key);

  @override
  Widget build(BuildContext context) {
    return const BaseScaffoldWidget(bodyWidget: CommercioKYCPageBody());
  }
}

class CommercioKYCPageBody extends StatelessWidget {
  const CommercioKYCPageBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BaseListWidget(
      children: [
        SubSectionWidget(
          sectionPage: BuyMembershipPage(),
          title: '6.1 Buy a membership with Cash Coins',
          subtitle: 'Buys the membership with the given membershipType.',
        ),
        SubSectionWidget(
          sectionPage: InviteMemberPage(),
          title: '6.2 Invite a Member',
          subtitle:
              'Sends a new transaction in order to invite the given userDid.',
        ),
      ],
    );
  }
}
