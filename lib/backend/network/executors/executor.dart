import 'package:slim_voice/backend/network/executors/executor.auth.dart';
import 'package:slim_voice/backend/network/executors/executor.client.dart';
import 'package:slim_voice/backend/network/executors/executor.invoice.dart';
import 'package:slim_voice/backend/network/executors/executor.profile.dart';
import 'package:slim_voice/backend/network/executors/executor.surrealDb.dart';

class Executor
    with AuthExecutor, ClientExecutor, ProfileExecutor, InvoiceExecutor {
  var db = SurrealDbExecutor();

  Executor() {
    db.init(db: "invdb", ns: "invns", url: "http://127.0.0.1:8000/");
  }
}

Executor _executor = Executor();
Executor get exe => _executor;
