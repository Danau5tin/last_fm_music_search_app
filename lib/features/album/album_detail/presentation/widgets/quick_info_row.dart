import 'package:flutter/material.dart';

class QuickInfoRow extends StatelessWidget {
  final IconData iconData;
  final String text;
  const QuickInfoRow(this.iconData, this.text,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(iconData),
        Text(text, style: Theme.of(context).textTheme.bodyText1)
      ],
    );
  }
}
