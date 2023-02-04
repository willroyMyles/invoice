import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:slim_voice/backend/models/invoice/model.invoice.dart';
import 'package:slim_voice/frontend/components/view.cardComponent.dart';

import '../../backend/helpers/widgetHelper.dart';

class DraftComponent extends StatelessWidget {
  final List<InvoiceModel> invoices;
  const DraftComponent({super.key, required this.invoices});

  @override
  Widget build(BuildContext context) {
    return CardComponent(
      child: Container(
        child: Column(children: [
          Row(
            children: [
              cardText("Drafts"),
              const Spacer(),
              TextButton(
                onPressed: () {},
                style: primaryBtn,
                child: Text(
                  "new invoice".capitalize!,
                  style: const TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
          const Divider(),
          if (invoices.isEmpty)
            Container(
              height: 100,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("no invoice available"),
                  Text("create a new invoice perhaps?"),
                ],
              ),
            ),
          ...invoices.map((e) {
            return Container(
              child: Row(
                children: [
                  Text(e.id),
                  Text(e.clientName),
                  Text(e.total.toString()),
                ],
              ),
            );
          })
        ]),
      ),
    );
  }
}
