import 'package:flutter/material.dart';

import 'go_back_widget.dart';

class SomethingWentWrongCenteredDisplay extends StatelessWidget {
  final String message;

  const SomethingWentWrongCenteredDisplay({Key? key, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Center(child: Text(message)), const GoBackButton()],
    );
  }
}
