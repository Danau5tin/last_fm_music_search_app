import 'package:flutter/material.dart';

class CenteredProgressBar extends StatelessWidget {
  final Color? color;

  const CenteredProgressBar({this.color, Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(
            color ?? Theme.of(context).primaryColor),
      ),
    );
  }
}
