import 'package:flutter/material.dart';
import 'package:slim_voice/backend/models/client/model.client.dart';
import 'package:slim_voice/frontend/components/view.ClientSentComponent.dart';
import 'package:slim_voice/frontend/components/view.dratComponent.dart';
import 'package:slim_voice/frontend/components/view.editClientComponent.dart';
import 'package:slim_voice/frontend/components/view.headerComponent.dart';

class EditClient extends StatelessWidget {
  final ClientModel client;
  const EditClient({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Column(children: [
          const HearderComponent(),
          const SizedBox(height: 30),
          EditClientComponent(),
          const SizedBox(height: 30),
          const DraftComponent(),
          const SizedBox(height: 30),
          const ClientSentComponent(),
        ]),
      ),
    );
  }
}
