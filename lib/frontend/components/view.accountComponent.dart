import 'package:flutter/material.dart';
import 'package:slim_voice/backend/helpers/widgetHelper.dart';
import 'package:slim_voice/frontend/components/view.cardComponent.dart';

class AccountComponent extends StatelessWidget {
  const AccountComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return CardComponent(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        cardText("Account"),
        const Divider(),
        Row(
          children: [
            secondaryButton("change email", () {}),
            const SizedBox(width: 10),
            secondaryButton("change password", () {}),
            const SizedBox(width: 10),
            secondaryButton("export data", () {}),
            const SizedBox(width: 10),
            secondaryButton("delete account", () {}),
          ],
        )
      ],
    ));
  }
}
