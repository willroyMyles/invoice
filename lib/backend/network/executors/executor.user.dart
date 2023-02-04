import 'package:slim_voice/backend/network/executors/executor.base.dart';

mixin UserExecutor {
  final _path = "key/user/";
  Future<void> user_createUser(Map<String, dynamic>? data) async {
    try {
      var res = BE.post(_path, data);
      print(res);
    } catch (e) {
      return;
    }
  }

  Future<void> user_getUser(String? id) async {
    try {
      var res = BE.get("${_path}id");
      print(res);
    } catch (e) {
      return;
    }
  }
}
