import 'package:slim_voice/backend/network/executors/executor.auth.dart';
import 'package:slim_voice/backend/network/executors/executor.client.dart';

class Executor with AuthExecutor, ClientExecutor {}

Executor _executor = Executor();
Executor get exe => _executor;
