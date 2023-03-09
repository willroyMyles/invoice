import 'package:get/get.dart';
import 'package:slim_voice/backend/models/client/model.client.dart';
import 'package:slim_voice/backend/network/executors/executor.dart';

import '../../backend/models/client/model.contacts.dart';

class ClientState extends GetxController {
  List<ClientModel> clients = [];
  ClientModel? editingModel;
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getClients();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    print("ready");
  }

  Future createClient(ClientModel model) async {
    var res = await exe.client_createClient(model);
    clients.addAll(res);
    refresh();
  }

  Future getClients() async {
    var res = await exe.client_getClients();
    clients = res;
    refresh();
  }

  Future createContact(String email) async {
    var mod = Contacts(email: email);
    await exe.client_addContact(mod, editingModel!, editingModel!.getId);
    var idx = clients.indexOf(editingModel!);
    await getClients();
    editingModel = clients[idx];
    refresh();
  }
}
