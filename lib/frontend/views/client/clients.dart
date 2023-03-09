import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slim_voice/backend/helpers/widgetHelper.dart';
import 'package:slim_voice/backend/models/client/model.client.dart';
import 'package:slim_voice/frontend/components/view.cardComponent.dart';
import 'package:slim_voice/frontend/components/view.clientComponent.dart';
import 'package:slim_voice/frontend/components/view.clientDialougeComponent.dart';
import 'package:slim_voice/frontend/states/state.client.dart';

import '../../states/state.global.dart';

class ClientsView extends StatelessWidget {
  ClientsView({super.key});
  final controller = Get.find<ClientState>();

  @override
  Widget build(BuildContext context) {
    var arg = Get.arguments?['selecting'];
    return Material(
      child: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                const Spacer(),
                primaryButton(
                  "new client",
                  onPressed: () async {
                    var res = await Get.dialog(const AlertDialog(
                      content: ClientDialougeComponent(),
                      contentPadding: EdgeInsets.zero,
                      titlePadding: EdgeInsets.zero,
                    ));

                    if (res != null) {
                      print(res);
                      var model = ClientModel(
                          id: "",
                          name: res[0],
                          address: res[1],
                          contacts: [],
                          userId: Get.find<GlobalState>().userId.value);
                      controller.createClient(model);
                    }
                  },
                ),
                IconButton(
                    onPressed: () {
                      controller.getClients();
                    },
                    icon: const Icon(Icons.refresh))
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            CardComponent(
                child: GetBuilder<ClientState>(
              init: controller,
              builder: (_) {
                var args = Get.arguments?["selecting"];
                return ClientComponent(
                  clients: controller.clients,
                  selecting: args,
                );
              },
            )),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
