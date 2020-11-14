import 'package:flutter/material.dart';
import 'package:odyssey_challenge_app/screens/scan_qr_screen.dart';
import 'package:odyssey_challenge_app/screens/shipping_info_screen.dart';

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
        const ShippingInfoScreen(),
      ],
    );
  }
}
