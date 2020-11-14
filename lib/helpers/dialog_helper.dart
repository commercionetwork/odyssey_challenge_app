import 'package:flutter/material.dart';

Future<T> showErrorDialog<T>({
  @required BuildContext context,
  @required String description,
}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Error'),
      content: Text(description),
    ),
  );
}
