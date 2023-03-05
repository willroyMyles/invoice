import 'package:slim_voice/backend/models/invoice/model.invoice.dart';
import 'package:slim_voice/backend/network/executors/executor.base.dart';

mixin InvoiceExecutor {
  final _path = "key/invoice/";
  Future<List<InvoiceModel>> getInvoices() async {
    try {
      var res = await BE.getAll(_path);
      if (res != null && res.data.first['result'] != null) {
        List<InvoiceModel> list = [];
        for (var e in res.data.first['result']) {
          var model = InvoiceModel.fromMap(e);
          list.add(model);
        }
        return list;
      }

      return [];
    } catch (e) {
      return [];
    }
  }

  Future invoice_saveInvoice(InvoiceModel model) async {
    try {
      var map = model.toMap();
      var res = await BE.post(_path, map);
      print(res);
    } catch (e) {
      print("could not save post");
      //could not save post
    }
  }
}
