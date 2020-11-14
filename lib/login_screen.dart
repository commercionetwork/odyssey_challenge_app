import 'package:commercio_ui/commercio_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumberdash/lumberdash.dart';
import 'package:odyssey_challenge_app/cubits/cubit/auth_cubit.dart';
import 'package:odyssey_challenge_app/helpers/dialog_helper.dart';
import 'package:odyssey_challenge_app/repositories/layout_repository.dart';

import 'cubits/cubit/auth_cubit.dart';

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
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.repository<LayoutRepository>().width(context),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Spacer(flex: 3),
              const Expanded(
                child: Text(
                  'Pincode for card',
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
                  validator: context.bloc<AuthCubit>().validatePin,
                ),
              ),
              const Spacer(),
              BlocConsumer<CommercioAccountRestoreWalletBloc,
                  CommercioAccountRestoredWalletState>(
                listener: (context, state) {
                  if (state is CommercioAccountRestoredWalletStateData) {
                    Navigator.pushReplacementNamed(context, '/home');
                  }
                },
                builder: (context, state) {
                  if (state is CommercioAccountRestoredWalletStateLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is AuthFailure) {
                        showErrorDialog(
                            context: context, description: 'Invalid PIN');
                      }

                      if (state is AuthError) {
                        logError(state.error, stacktrace: state.stackTrace);
                        showErrorDialog(
                          context: context,
                          description: state.error.toString(),
                        );
                      }

                      if (state is PharmaUserAuthenticated ||
                          state is DriverUserAuthenticated) {
                        context.bloc<CommercioAccountRestoreWalletBloc>().add(
                            CommercioAccountRestoreWalletEvent(
                                mnemonic: (state as dynamic).mnemonic));
                      }
                    },
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: () => context
                            .bloc<AuthCubit>()
                            .authenticate(pin: _pinTextEditingCtrl.text),
                        child: const Text('Authenticate'),
                      );
                    },
                  );
                },
              ),
              const Spacer(flex: 4),
            ],
          ),
        ),
      ),
    );
  }
}
