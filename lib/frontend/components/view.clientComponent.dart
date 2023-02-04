// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:slim_voice/backend/models/client/model.client.dart';

class ClientComponent extends StatelessWidget {
  final List<ClientModel> clients;
  const ClientComponent({
    Key? key,
    required this.clients,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SizedBox(height: 20, child: TextField()),
          const Divider(),
          if (clients.isEmpty)
            Container(
              height: 100,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("no clients as yet"),
                  Text("create a new client perhaps?"),
                ],
              ),
            ),
          ...clients.map((e) {
            return Container(
              child: Text(e.name),
            );
          }).toList()
        ],
      ),
    );
  }
}
