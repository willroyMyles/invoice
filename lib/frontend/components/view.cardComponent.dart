import 'package:flutter/material.dart';

class CardComponent extends StatelessWidget {
  final Widget child;
  const CardComponent({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.04),
          blurRadius: 15,
        )
      ]),
      child: child,
    );
  }
}
