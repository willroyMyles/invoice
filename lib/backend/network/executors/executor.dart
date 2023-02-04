import 'package:slim_voice/backend/network/executors/executor.auth.dart';

class Executor with AuthExecutor {}

Executor _executor = Executor();
Executor get exe => _executor;
