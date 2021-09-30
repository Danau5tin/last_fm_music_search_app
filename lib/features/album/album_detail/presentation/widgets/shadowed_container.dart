import 'package:flutter/material.dart';

class ShadowedContainer extends StatelessWidget {
  final Widget child;

  const ShadowedContainer(this.child, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: _buildBoxDecoration(context),
      child: child,
    );
  }

  BoxDecoration _buildBoxDecoration(BuildContext context) {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Theme.of(context).primaryColor,
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 1.5))
        ]);
  }
}
