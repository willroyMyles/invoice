import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:flutter_spinbox/material.dart';
import 'package:get/get.dart';
import 'package:slim_voice/backend/helpers/dateHelper.dart';
import 'package:slim_voice/backend/helpers/widgetHelper.dart';
import 'package:slim_voice/frontend/components/view.cardComponent.dart';
import 'package:slim_voice/frontend/components/view.paymentComponent.dart';
import 'package:slim_voice/frontend/components/view.sentComponent.dart';
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
                                          inputHolder(TextField(
                                            onSubmitted: (value) {
                                              print(value);
                                              controller
                                                  .updateDescription(value);
                                            },
                                            onChanged: (value) {
                                              controller
                                                  .updateDescription(value);
                                            },
                                            decoration: generalInputDecoration(
                                                "Project / Description"),
                                          )),
                                          inputHolder(TextField(
                                            // focusNode: controller.description,
                                            controller: controller
                                                .profileControllerText,
                                            maxLines: null,
                                            minLines: null,
                                            decoration: generalInputDecoration(
                                                "Address"),
                                          )),
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
                                                child: Row(
                                                  children: [
                                                    Text(formatForDisplayDate(
                                                        controller
                                                            .model.dateIssued)),
                                                    const SizedBox(width: 10),
                                                    const Icon(
                                                      Icons
                                                          .calendar_today_rounded,
                                                      size: 16,
                                                    )
                                                  ],
                                                ),
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
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(formatForDisplayDate(
                                                        controller
                                                            .model.dateDue)),
                                                    const SizedBox(width: 10),
                                                    const Icon(
                                                      Icons
                                                          .calendar_today_rounded,
                                                      size: 16,
                                                    )
                                                  ],
                                                ),
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
                            const Opacity(
                              opacity: .8,
                              child: Row(
                                children: [
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
                              var index =
                                  controller.model.invoiceItems.indexOf(e);
                              return Column(
                                children: [
                                  divider,
                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 3,
                                          child: TextField(
                                            decoration: generalInputDecoration(
                                                "Description"),
                                            // expands: true,
                                            minLines: null,
                                            maxLines: null,
                                          )),
                                      Expanded(
                                          child: Container(
                                        alignment: Alignment.centerRight,
                                        child: SpinBox(
                                          iconSize: 15,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                          min: 1,
                                          value: 1,
                                          onChanged: (value) {
                                            controller.updateQuantity(
                                                index: index, value: value);
                                          },
                                        ),
                                      )),
                                      Expanded(
                                          child: TextField(
                                        textAlign: TextAlign.end,
                                        decoration: generalInputDecoration(
                                            "0.00",
                                            leftAlign: false),
                                        onChanged: (value) {
                                          controller.model.invoiceItems[index]
                                              .price = double.parse(value);
                                        },
                                        inputFormatters: [
                                          CurrencyInputFormatter()
                                        ],
                                      )),
                                      Expanded(
                                          child: IgnorePointer(
                                        child: TextField(
                                          textAlign: TextAlign.end,
                                          decoration: generalInputDecoration(
                                              "0.00",
                                              leftAlign: false),
                                          onChanged: (value) {},
                                          inputFormatters: [
                                            CurrencyInputFormatter()
                                          ],
                                        ),
                                      )),
                                    ],
                                  ),
                                ],
                              );
                            }).toList(),
                            divider,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      controller.onAddedItem();
                                    },
                                    icon: Icon(
                                      Icons.add_circle_outline,
                                      color: Colors.grey.shade400,
                                      weight: 0.1,
                                      fill: .1,
                                      grade: .1,
                                    )),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        const Opacity(
                                            opacity: .6,
                                            child: Text("Subtotal ")),
                                        Text(
                                            " ${toCurrencyString(controller.model.subTotal.toString())}"),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        const Opacity(
                                            opacity: .6, child: Text("tax ")),
                                        Text(
                                            " ${controller.model.tax.toCurrencyString()}"),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        const Opacity(
                                            opacity: .6, child: Text("total ")),
                                        Text(
                                            " ${toCurrencyString(controller.model.total.toString())}"),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                            hintText1("notes..."),
                            Container(child: const TextField()),
                            const SizedBox(height: 25),
                            Row(
                              children: [
                                hintText("currency"),
                                const SizedBox(width: 5),
                                Container(
                                  width: 80,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: const BoxDecoration(),
                                  child: DropdownButton(
                                    items: Currency.values.map((e) {
                                      return DropdownMenuItem(
                                          value: e, child: Text(e.name));
                                    }).toList(),
                                    onChanged: (value) {
                                      print(value);
                                      // controller.model.currency = value!;
                                      controller.updateCurrency(value!);
                                    },
                                    value: controller.model.currency,
                                    // controller: controller.currency,
                                  ),
                                ),
                                const Spacer(),
                                tertiaryButton("cancel", () {}),
                                const SizedBox(width: 10),
                                primaryButton("save changes", onPressed: () {
                                  controller.onSaveChanges();
                                })
                              ],
                            )
                          ],
                        ),
                      )),
                      const SizedBox(height: 15),
                      Wrap(
                        children: [
                          SentComponent(model: controller.model.sentModel),
                          PaymentComponent(model: controller.model.payments)
                        ],
                      )
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
