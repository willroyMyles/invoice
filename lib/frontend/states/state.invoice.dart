import 'package:get/get.dart';
import 'package:pdf/widgets.dart';
import 'package:slim_voice/backend/models/invoice/model.invoice.dart';

class InvoiceState extends GetxController {
  InvoiceModel model = InvoiceModel.empty();
  var pdf = Document();

  onDueDateChanged(DateTime date) {
    model.dateDue = date;
    refresh();
  }

  onIssuedChanged(DateTime date) {
    model.dateIssued = date;
    refresh();
  }

  makePdf() {
    pdf.addPage(Page(
      build: (context) {
        return Column(children: [
          Row(children: [
            Text("hello"),
            Text("world"),
          ])
        ]);
      },
    ));
    return pdf.save();
  }
}
