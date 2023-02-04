import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:slim_voice/backend/helpers/widgetHelper.dart';
import 'package:slim_voice/frontend/components/view.cardComponent.dart';
import 'package:slim_voice/frontend/components/view.clientComponent.dart';

class ClientsView extends StatelessWidget {
  const ClientsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              const Spacer(),
              TextButton(
                onPressed: () {},
                style: primaryBtn,
                child: Text("new client".capitalize!),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const CardComponent(
              child: ClientComponent(
            clients: [],
          )),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
