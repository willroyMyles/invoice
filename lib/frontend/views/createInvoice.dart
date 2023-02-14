import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slim_voice/backend/helpers/widgetHelper.dart';
import 'package:slim_voice/frontend/components/view.cardComponent.dart';
import 'package:slim_voice/frontend/states/state.invoice.dart';

import '../../backend/enum/enum.currency.dart';

class CreateInvoiceView extends GetView<InvoiceState> {
  const CreateInvoiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: SafeArea(
        child: Scaffold(
          body: GetBuilder<InvoiceState>(
            init: controller,
            initState: (_) {},
            builder: (_) {
              return Container(
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          primaryButton(
                            "Download pdf",
                            onPressed: () {},
                          ),
                          secondaryButton("preview", () {}),
                          secondaryButton("duplicate", () {}),
                          secondaryButton("delete", () {}),
                        ],
                      ),
                      const SizedBox(height: 30),
                      CardComponent(
                          child: Container(
                        width: Get.width,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            cardText(
                                "Invoice ${controller.model.invoiceNumber}"),
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          inputHolder(const TextField()),
                                          inputHolder(const TextField()),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 120,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              hintText("issued : "),
                                              Container(
                                                  child: TextButton(
                                                child: Text(controller
                                                    .model.dateIssued
                                                    .toString()),
                                                onPressed: () async {
                                                  var res =
                                                      await showCalendarDatePicker2Dialog(
                                                          context: context,
                                                          config:
                                                              CalendarDatePicker2WithActionButtonsConfig(),
                                                          dialogSize:
                                                              const Size(
                                                                  350, 250));

                                                  if (res != null) {
                                                    controller.onIssuedChanged(
                                                        res[0]!);
                                                  }
                                                },
                                              )),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              hintText("due : "),
                                              Container(
                                                  child: TextButton(
                                                child: Text(controller
                                                    .model.dateDue
                                                    .toString()),
                                                onPressed: () async {
                                                  var res =
                                                      await showCalendarDatePicker2Dialog(
                                                          context: context,
                                                          config:
                                                              CalendarDatePicker2WithActionButtonsConfig(),
                                                          dialogSize:
                                                              const Size(
                                                                  350, 250));

                                                  if (res != null) {
                                                    controller.onDueDateChanged(
                                                        res[0]!);
                                                  }
                                                },
                                              )),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Opacity(
                              opacity: .8,
                              child: Row(
                                children: const [
                                  Expanded(
                                      flex: 3,
                                      child: Text("",
                                          textScaleFactor: .8,
                                          textAlign: TextAlign.right)),
                                  Expanded(
                                      child: Text("quantity",
                                          textScaleFactor: .8,
                                          textAlign: TextAlign.right)),
                                  Expanded(
                                      child: Text("price",
                                          textScaleFactor: .8,
                                          textAlign: TextAlign.right)),
                                  Expanded(
                                      child: Text("total",
                                          textScaleFactor: .8,
                                          textAlign: TextAlign.right)),
                                ],
                              ),
                            ),
                            ...controller.model.invoiceItems.map((e) {
                              return Column(
                                children: [
                                  divider,
                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 3,
                                          child: Text(e.description.capitalize!,
                                              textAlign: TextAlign.left)),
                                      Expanded(
                                          child: Text(e.quantity.toString(),
                                              textAlign: TextAlign.right)),
                                      Expanded(
                                          child: Text(e.price.toString(),
                                              textAlign: TextAlign.right)),
                                      Expanded(
                                          child: Text(e.total.toString(),
                                              textAlign: TextAlign.right)),
                                    ],
                                  ),
                                ],
                              );
                            }).toList(),
                            divider,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Opacity(
                                  opacity: .65,
                                  child: IconButton(
                                      onPressed: () {},
                                      icon:
                                          const Icon(Icons.add_circle_outline)),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                        "subtotal ${controller.model.total.toString()}"),
                                    Text(
                                        "total ${controller.model.total.toString()}"),
                                  ],
                                )
                              ],
                            ),
                            hintText("notes..."),
                            inputHolder(const TextField()),
                            Row(
                              children: [
                                hintText("currency"),
                                Container(
                                  width: 50,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: const BoxDecoration(),
                                  child: PopupMenuButton(
                                    // controller: controller.currency,
                                    onSelected: (value) {},
                                    itemBuilder: (context) {
                                      return Currency.values.map((e) {
                                        return PopupMenuItem(
                                          value: e,
                                          child: Text(e.name),
                                        );
                                      }).toList();
                                    },
                                  ),
                                ),
                                const Spacer(),
                                tertiaryButton("cancel", () {}),
                                const SizedBox(width: 10),
                                primaryButton("save changes")
                              ],
                            )
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
