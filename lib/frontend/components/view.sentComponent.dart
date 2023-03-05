import 'package:flutter/material.dart';
import 'package:slim_voice/backend/helpers/widgetHelper.dart';
import 'package:slim_voice/backend/models/invoice/model.sent.dart';
import 'package:slim_voice/frontend/components/view.cardComponent.dart';

class SentComponent extends StatelessWidget {
  final SentModel model;
  const SentComponent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    if (model.isDraft) {
      return CardComponent(
          child: Row(
        children: [
          const Text("Draft"),
          const SizedBox(width: 5),
          Icon(
            Icons.lock,
            size: 12,
            color: Colors.grey.shade400,
          ),
          const Spacer(),
          primaryButton("Send"),
        ],
      ));
    }

    return CardComponent(
        child: Column(
      children: [
        Row(
          children: [
            const Text("Sent"),
            Text(model.sentDate.toString()),
            const Spacer(),
            secondaryButton("Edit", () {}),
          ],
        ),
        const Row(
          children: [
            Expanded(child: Text("To")),
            Spacer(),
            Expanded(child: Text("Delivered")),
            Expanded(child: Text("Open")),
          ],
        ),
        ...model.sentRecipients.map((e) {
          return Container();
        })
      ],
    ));
  }
}
