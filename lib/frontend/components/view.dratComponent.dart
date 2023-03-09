import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slim_voice/backend/network/executors/executor.dart';
import 'package:slim_voice/frontend/components/view.cardComponent.dart';
import 'package:slim_voice/frontend/states/state.invoice.dart';
import 'package:slim_voice/frontend/views/client/clients.dart';

import '../../backend/helpers/widgetHelper.dart';

class DraftComponent extends GetView<InvoiceState> {
  const DraftComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InvoiceState>(
        init: controller,
        builder: (_) {
          return CardComponent(
            child: Container(
              child: Column(children: [
                Row(
                  children: [
                    cardText("Drafts"),
                    const Spacer(),
                    primaryButton(
                      "new invoice",
                      onPressed: () {
                        // Get.to(() => const CreateInvoiceView());

                        // pushNamed("/createInvoice");
                        // pushNamed("/clients", {"selecting": true});
                        Get.to(() => ClientsView(),
                            arguments: {"selecting": true});
                      },
                    )
                  ],
                ),
                const Divider(),
                const SizedBox(height: 10),
                Opacity(
                  opacity: .5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: 30,
                          alignment: Alignment.center,
                          child: const Text("No.", textAlign: TextAlign.left)),
                      const SizedBox(width: 10),
                      const Expanded(
                          child: Text("Client", textAlign: TextAlign.left)),
                      const Expanded(
                          child: Text("Total", textAlign: TextAlign.right)),
                    ],
                  ),
                ),
                const Divider(),
                if (controller.models.isEmpty)
                  Container(
                    height: 100,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("no invoice available"),
                        const Text("create a new invoice perhaps?"),
                        TextButton(
                            onPressed: () {
                              exe.getInvoices();
                            },
                            child: const Text("test"))
                      ],
                    ),
                  ),
                ...controller.models.map((e) {
                  return Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: 30,
                            alignment: Alignment.center,
                            child: Text(e.invoiceNumber.toString())),
                        const SizedBox(width: 10),
                        Expanded(child: Text(e.clientName)),
                        Expanded(
                            child: Text(
                          e.total.toString(),
                          textAlign: TextAlign.right,
                        )),
                      ],
                    ),
                  );
                })
              ]),
            ),
          );
        });
  }
}
