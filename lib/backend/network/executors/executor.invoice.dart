import 'package:slim_voice/backend/models/invoice/model.invoice.dart';
import 'package:slim_voice/backend/network/executors/executor.base.dart';

mixin InvoiceExecutor {
  final _path = "key/invoice/";
  Future<List<InvoiceModel>> getInvoices() async {
    try {
      var res = await BE.getAll(_path);
      if (res != null && res.data != null) {
        List<InvoiceModel> list = [];
        for (var e in res.data) {
          var model = InvoiceModel.fromMap(res.data);
          list.add(model);
        }
        return list;
      }

      return [];
    } catch (e) {
      return [];
    }
  }
}
