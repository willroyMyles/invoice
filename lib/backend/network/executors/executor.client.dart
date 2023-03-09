import 'package:dio/dio.dart';
import 'package:slim_voice/backend/models/client/model.client.dart';
import 'package:slim_voice/backend/models/client/model.contacts.dart';
import 'package:slim_voice/backend/network/executors/executor.dart';
import 'package:slim_voice/backend/network/executors/executor.surrealDb.dart';

mixin ClientExecutor {
  final String _path = "key/client";
  final Converter _converter = ClientModel.fromMap;

  Future<List<ClientModel>> client_createClient(ClientModel data) async {
    try {
      // var res = await BE.post(_path, data.toMap());
      var res = await exe.db.create("client", data: data.toJson());
      var ans = _convertModels(res);
      return Future.value(ans);
    } catch (e) {
      return [];
    }
  }

  Future<List<ClientModel>> client_getClients() async {
    try {
      var res = await exe.db.select<ClientModel>("client",
          converter: _converter, options: SelectOptions(fetch: "contacts"));
      return Future.value(res);
    } catch (e) {
      return [];
    }
  }

  Future client_addContact(
      Contacts model, ClientModel clientModel, String id) async {
    try {
      var res = await exe.db.create("contact", data: model.toMap());
      var contacts = clientModel.contacts.map((e) => e.id).toList();
      contacts.add(res.data.first['result'].first['id']);

      var res1 = await exe.db.merge("client", id, data: {"contacts": contacts});

      print(res1);
    } catch (e) {
      print(e);
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
