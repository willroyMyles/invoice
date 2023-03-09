// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slim_voice/backend/models/client/model.client.dart';
import 'package:slim_voice/frontend/states/state.client.dart';
import 'package:slim_voice/frontend/views/client/view.editClient.dart';
import 'package:slim_voice/frontend/views/createInvoice.dart';

class ClientComponent extends GetView<ClientState> {
  final List<ClientModel> clients;
  final bool? selecting;
  const ClientComponent({
    this.selecting = false,
    Key? key,
    required this.clients,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20, child: TextField()),
          const Divider(),
          if (clients.isEmpty)
            Container(
              height: 100,
              alignment: Alignment.center,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("no clients as yet"),
                  Text("create a new client perhaps?"),
                ],
              ),
            ),
          ...clients.map((e) {
            return InkWell(
              onTap: () {
                if (selecting ?? false) {
                  Get.to(
                    () => CreateInvoiceView(client: e),
                  );
                } else {
                  print("client clicked");
                  controller.editingModel = e;
                  Get.to(() => EditClient(client: e));
                }
              },
              child: Container(
                alignment: Alignment.centerLeft,
                // color: Colors.red,
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Opacity(
                  opacity: .6,
                  child: Text(
                    e.name,
                    textScaleFactor: 1.6,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            );
          }).toList()
        ],
      ),
    );
  }
}
