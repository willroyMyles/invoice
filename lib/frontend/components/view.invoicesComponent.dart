import 'package:flutter/material.dart';
import 'package:slim_voice/backend/models/invoice/model.invoice.dart';
import 'package:slim_voice/frontend/components/view.cardComponent.dart';

import '../../backend/helpers/widgetHelper.dart';

class InvoicesComponent extends StatelessWidget {
  final List<InvoiceModel> invoices;
  const InvoicesComponent({super.key, required this.invoices});

  @override
  Widget build(BuildContext context) {
    return CardComponent(
      child: Container(
        child: Column(children: [
          Row(
            children: [
              cardText("Invoices"),
              const Spacer(),
              TextButton(onPressed: () {}, child: const Text("filter"))
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
                  Text("no invoices..."),
                  Text("create a new one to get started?"),
                ],
              ),
            ),
          ...invoices.map((e) {
            return Container(
              child: Row(
                children: [
                  Text(e.invoiceNumber.toString()),
                  Text(e.clientName),
                  Text(e.amountLeft.toString()),
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
