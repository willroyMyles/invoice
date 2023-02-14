import 'package:slim_voice/backend/network/executors/executor.auth.dart';
import 'package:slim_voice/backend/network/executors/executor.client.dart';
import 'package:slim_voice/backend/network/executors/executor.profile.dart';

class Executor with AuthExecutor, ClientExecutor, ProfileExecutor {}

Executor _executor = Executor();
Executor get exe => _executor;
