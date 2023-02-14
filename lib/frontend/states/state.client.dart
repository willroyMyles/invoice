import 'package:get/get.dart';
import 'package:slim_voice/backend/models/client/model.client.dart';
import 'package:slim_voice/backend/network/executors/executor.dart';

class ClientState extends GetxController {
  List<ClientModel> clients = [];
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getClients();
  }

  Future createClient(ClientModel model) async {
    var res = await exe.client_createClient(model.toMap());
    clients.addAll(res);
    refresh();
  }

  Future getClients() async {
    var res = await exe.client_getClients();
    clients = res;
    refresh();
  }
}
