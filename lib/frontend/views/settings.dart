import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slim_voice/frontend/components/view.accountComponent.dart';
import 'package:slim_voice/frontend/components/view.profileComponent.dart';
import 'package:slim_voice/frontend/states/state.settings.dart';

class SettingsView extends StatelessWidget {
  SettingsView({super.key});
  final controller = Get.find<SettingsState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: const Column(children: [
          ProfileComponent(model: null),
          SizedBox(
            height: 30,
          ),
          AccountComponent(),
        ]),
      ),
    );
  }
}
