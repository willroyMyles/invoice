import 'package:dio/dio.dart';
import 'package:slim_voice/backend/models/client/model.client.dart';
import 'package:slim_voice/backend/network/executors/executor.base.dart';

mixin ClientExecutor {
  final String _path = "key/client";

  Future<List<ClientModel>> client_createClient(
      Map<String, dynamic>? data) async {
    try {
      var res = await BE.post(_path, data);
      var ans = _convertModels(res);
      return Future.value(ans);
    } catch (e) {
      return [];
    }
  }

  Future<List<ClientModel>> client_getClients() async {
    try {
      var res = await BE.get(_path);
      return Future.value(_convertModels(res));
    } catch (e) {
      return [];
    }
  }

  List<ClientModel> _convertModels(Response? res) {
    List<ClientModel> models = [];
    for (var e in res!.data[0]["result"]) {
      var mod = ClientModel.fromMap(e);
      models.add(mod);
    }
    return models;
  }
}
