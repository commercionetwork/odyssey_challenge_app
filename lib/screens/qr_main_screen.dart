import 'package:commercio_ui/commercio_ui.dart' hide Key;
import 'package:flutter/material.dart';
import 'package:odyssey_challenge_app/screens/scan_qr_screen.dart';
import 'package:odyssey_challenge_app/screens/shipping_info_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QrMainScreen extends StatefulWidget {
  const QrMainScreen({Key key}) : super(key: key);

  @override
  _QrMainScreenState createState() => _QrMainScreenState();
}

class _QrMainScreenState extends State<QrMainScreen> {
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      allowImplicitScrolling: false,
      controller: pageController,
      scrollDirection: Axis.vertical,
      children: [
        // TODO: Enable when testing the QR code scanner
        // ScanQrScreen(
        //   onQrData: (data) => pageController.nextPage(
        //     duration: const Duration(milliseconds: 200),
        //     curve: Curves.linear,
        //   ),
        // ),
        MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => CommercioAccountGenerateWalletBloc(
                commercioAccount:
                    // ignore: deprecated_member_use
                    context.repository<StatefulCommercioAccount>(),
              ),
            ),
            BlocProvider(
              create: (_) => CommercioAccountRequestFreeTokensBloc(
                commercioAccount:
                    // ignore: deprecated_member_use
                    context.repository<StatefulCommercioAccount>(),
              ),
            ),
          ],
          child: const CreateWalletScreen(),
        ),
        const ShippingInfoScreen(),
      ],
    );
  }
}

class CreateWalletScreen extends StatelessWidget {
  const CreateWalletScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GenerateWalletFlatButton(
          child: (_) => const Text('Generate wallet'),
          event: () => const CommercioAccountGenerateWalletEvent(),
        ),
        GenerateWalletTextField(
          loading: (_) => 'Generating...',
          text: (_, data) => data.mnemonic,
        ),
        RequestFreeTokensFlatButton(
          child: (_) => const Text('Request free tokens'),
          event: () => const CommercioAccountRequestFreeTokensEvent(),
        ),
        RequestFreeTokensTextField(
          loading: (_) => 'Generating...',
          text: (_, data) => data.accountRequestResponse.message,
        ),
      ],
    );
  }
}
