import 'package:flutter/material.dart';
import 'package:slim_voice/backend/helpers/widgetHelper.dart';
import 'package:slim_voice/frontend/components/blankCardComponent.dart';

class ClientSentComponent extends StatelessWidget {
  const ClientSentComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlankCardComponent(
      header: cardText("sent"),
      button: tertiaryButton("filter", () {}),
      body: Container(),
    );
  }
}
