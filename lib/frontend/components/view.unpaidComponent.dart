import 'package:flutter/material.dart';
import 'package:slim_voice/backend/helpers/widgetHelper.dart';
import 'package:slim_voice/backend/models/invoice/model.invoice.dart';
import 'package:slim_voice/frontend/components/view.cardComponent.dart';

class UnpaidComponent extends StatelessWidget {
  final List<InvoiceModel> invoices;
  const UnpaidComponent({super.key, required this.invoices});

  @override
  Widget build(BuildContext context) {
    return CardComponent(
      child: Container(
        child: Column(children: [
          Row(
            children: [
              cardText("UnPaid"),
              const Spacer(),
              TextButton(
                onPressed: () {},
                style: primaryBtn,
                child: const Text("new invoice"),
              )
            ],
          ),
          if (invoices.isEmpty)
            Container(
              height: 100,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("no unpain invoices.. Great!"),
                ],
              ),
            ),
          const Divider(),
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
