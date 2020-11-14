import 'package:odyssey_challenge_app/pages/section_page.dart';
import 'package:odyssey_challenge_app/widgets/base_list_widget.dart';
import 'package:odyssey_challenge_app/widgets/base_scaffold_widget.dart';
import 'package:odyssey_challenge_app/widgets/paragraph_widget.dart';
import 'package:commercio_ui/commercio_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RestoreWalletFromMnemonicPage extends SectionPageWidget {
  const RestoreWalletFromMnemonicPage({Key key})
      : super(
          '/1-account/restore-wallet-from-mnemonic',
          'RestoreWalletFromMnemonicPage',
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return const BaseScaffoldWidget(
      bodyWidget: RestoreWalletFromMnemonicPageBody(),
    );
  }
}

class RestoreWalletFromMnemonicPageBody extends StatelessWidget {
  const RestoreWalletFromMnemonicPageBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseListWidget(
      separatorIndent: .0,
      separatorEndIndent: .0,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              children: [
                BlocProvider(
                  create: (_) => CommercioAccountRestoreWalletBloc(
                    commercioAccount:
                        RepositoryProvider.of<StatefulCommercioAccount>(
                      context,
                    ),
                  ),
                  child: const RestoreWalletFromMnemonicWidget(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class RestoreWalletFromMnemonicWidget extends StatefulWidget {
  const RestoreWalletFromMnemonicWidget({Key key}) : super(key: key);

  @override
  _RestoreWalletFromMnemonicWidgetState createState() =>
      _RestoreWalletFromMnemonicWidgetState();
}

class _RestoreWalletFromMnemonicWidgetState
    extends State<RestoreWalletFromMnemonicWidget> {
  final _mnemonicTextController = TextEditingController(text: '');

  @override
  void dispose() {
    _mnemonicTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const ParagraphWidget(
            'Press the button to restore the wallet using the entered input words.',
          ),
          TextField(
            controller: _mnemonicTextController,
          ),
          BlocBuilder<CommercioAccountRestoreWalletBloc,
              CommercioAccountRestoredWalletState>(
            builder: (_, snap) {
              Function() f =
                  () => context.bloc<CommercioAccountRestoreWalletBloc>().add(
                        CommercioAccountRestoreWalletEvent(
                          mnemonic: _mnemonicTextController.text,
                        ),
                      );

              snap.when(
                (mnemonic, wallet, walletAddress) => null,
                initial: () => null,
                loading: () => f = null,
                error: (e) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text(e),
                        backgroundColor: Colors.red,
                      ),
                    );
                  });
                },
              );

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: FlatButton(
                  onPressed: f,
                  color: Theme.of(context).primaryColor,
                  disabledColor: Theme.of(context).disabledColor,
                  child: const Text(
                    'Restore Wallet',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
          ),
          RestoreWalletTextField(
            loading: (_) => 'Loading...',
            text: (_, state) => state.walletAddress,
          ),
        ],
      ),
    );
  }
}
