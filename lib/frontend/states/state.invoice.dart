import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/widgets.dart' as w;
import 'package:slim_voice/backend/enum/enum.currency.dart';
import 'package:slim_voice/backend/models/invoice/model.invoice.dart';
import 'package:slim_voice/backend/models/invoice/model.invoiceItem.dart';
import 'package:slim_voice/backend/network/executors/executor.dart';
import 'package:slim_voice/frontend/states/state.settings.dart';

class InvoiceState extends GetxController {
  InvoiceModel model = InvoiceModel.empty();
  List<InvoiceModel> models = [];
  TextEditingController profileControllerText = TextEditingController();
  FocusNode description = FocusNode();
  FocusNode notes = FocusNode();
  List<FocusNode> dynamicNodes = [FocusNode()];
  var pdf = w.Document();

  onDueDateChanged(DateTime date) {
    model.dateDue = date;
    refresh();
  }

  onIssuedChanged(DateTime date) {
    model.dateIssued = date;
    refresh();
  }

  makePdf() {
    pdf.addPage(w.Page(
      build: (context) {
        return w.Column(children: [
          w.Row(children: [
            w.Text("hello"),
            w.Text("world"),
          ])
        ]);
      },
    ));
    return pdf.save();
  }

  void onAddedItem() {
    model.invoiceItems.add(InvoiceItemModel.empty());
    refresh();
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    final profileController = Get.find<SettingsState>();
    var model = await profileController.getProfile();
    models = await exe.getInvoices();
    profileControllerText.text = model.address;
    refresh();
  }

  void updateDescription(String value) {
    model.description = value;
    // refresh();
  }

  void updateQuantity({required int index, required double value}) {}

  void updateCurrency(Currency value) {
    model.currency = value;
    refresh();
  }

  onSaveChanges() async {
    await exe.invoice_saveInvoice(model);
  }
}
