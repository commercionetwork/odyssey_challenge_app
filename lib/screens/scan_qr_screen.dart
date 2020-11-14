import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQrScreen extends StatefulWidget {
  const ScanQrScreen({
    @required this.onQrData,
    Key key,
  })  : assert(onQrData != null),
        super(key: key);

  final void Function(String data) onQrData;

  @override
  _ScanQrScreenState createState() => _ScanQrScreenState();
}

class _ScanQrScreenState extends State<ScanQrScreen> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController controller;
  String qrText;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        height: 300,
        child: QRView(
          key: qrKey,
          onQRViewCreated: (controller) {
            this.controller = controller;
            controller.scannedDataStream.listen((scanData) {
              widget.onQrData(scanData);
            });
          },
        ),
      ),
    );
  }
}
