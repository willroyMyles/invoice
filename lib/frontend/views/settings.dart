import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slim_voice/frontend/components/view.accountComponent.dart';
import 'package:slim_voice/frontend/components/view.profileComponent.dart';
import 'package:slim_voice/frontend/states/state.settings.dart';

class SettingsView extends StatelessWidget {
  SettingsView({super.key});
  final controller = Get.put(SettingsState());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: const [
        ProfileComponent(model: null),
        SizedBox(
          height: 30,
        ),
        AccountComponent(),
      ]),
    );
  }
}
