import 'package:flutter/material.dart';
import 'package:slim_voice/backend/models/invoice/model.payments.dart';

class PaymentComponent extends StatelessWidget {
  final List<Payments> model;
  const PaymentComponent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(children: [
        Row(
          children: [
            const Text("Payments"),
            const Spacer(),
            IconButton(onPressed: () {}, icon: const Icon(Icons.plus_one)),
          ],
        ),
        const Divider(),
        ...model.map((e) {
          return Column(
            children: [
              Row(
                children: [
                  Text(e.date.toString()),
                  const Spacer(),
                  Text(e.amount.toString()),
                ],
              ),
              const Divider(),
            ],
          );
        }),
        Container(
          alignment: Alignment.centerRight,
          child:
              TextButton(onPressed: () {}, child: const Text("Paid In Full")),
        )
      ]),
    );
  }
}
