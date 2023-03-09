import 'package:flutter/material.dart';
import 'package:slim_voice/frontend/components/view.cardComponent.dart';

class BlankCardComponent extends StatelessWidget {
  final Widget? header;
  final Widget? button;
  final Widget? body;
  final Widget? empty;
  const BlankCardComponent(
      {super.key, this.header, this.button, this.body, this.empty});

  @override
  Widget build(BuildContext context) {
    return CardComponent(
        child: Column(
      children: [
        Row(
          children: [
            if (header != null) header!,
            const Spacer(),
            if (button != null) button!
          ],
        ),
        const Divider(),
        if (body != null) body!,
        if (empty != null) empty!
      ],
    ));
  }
}
