import 'package:flutter/material.dart';
import 'package:slim_voice/frontend/components/view.invoicesComponent.dart';

import '../components/view.dratComponent.dart';

class InvoiceView extends StatelessWidget {
  const InvoiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        // color: Colors.yellow,
        child: Column(
          children: const [
            SizedBox(
              height: 30,
            ),
            DraftComponent(invoices: []),
            SizedBox(
              height: 30,
            ),
            InvoicesComponent(invoices: []),
            SizedBox(
              height: 30,
            ),
            Text("invoices"),
          ],
        ),
      ),
    );
  }
}
