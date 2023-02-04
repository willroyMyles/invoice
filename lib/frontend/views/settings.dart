import 'package:flutter/material.dart';
import 'package:slim_voice/frontend/components/view.accountComponent.dart';
import 'package:slim_voice/frontend/components/view.profileComponent.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

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
