import 'package:biometric_storage/biometric_storage.dart';
import 'package:flutter/material.dart';
import 'package:lumberdash/lumberdash.dart';

import 'widgets/base_scaffold_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _pinTextEditingCtrl = TextEditingController();

  @override
  void dispose() {
    _pinTextEditingCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldWidget(
      bodyWidget: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Spacer(flex: 3),
            const Expanded(
              child: Text(
                'PIN',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32.0,
                ),
              ),
            ),
            const Spacer(),
            Expanded(
              child: TextFormField(
                controller: _pinTextEditingCtrl,
                validator: _validatePin,
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Authenticate'),
              ),
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}

String _validatePin(String value) {
  if (value.length < 4) {
    return 'The PIN should have at least a length of 4.';
  }

  return null;
}
