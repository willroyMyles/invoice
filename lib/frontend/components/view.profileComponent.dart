import 'package:flutter/material.dart';
import 'package:slim_voice/backend/helpers/widgetHelper.dart';
import 'package:slim_voice/frontend/components/view.cardComponent.dart';

import '../../backend/models/model.profile.dart';

class ProfileComponent extends StatelessWidget {
  final ProfileModel? model;
  const ProfileComponent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return CardComponent(
      child: Container(
        child: Column(children: [
          cardText("Profile"),
          const Divider(),
          const Text("Name"),
          const SizedBox(
            height: 15,
            child: TextField(),
          ),
          const Text("Address / Contact No."),
          const SizedBox(
            height: 15,
            child: TextField(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              tertiaryButton("Cancel", () {}),
              TextButton(
                onPressed: () {},
                style: primaryBtn,
                child: const Text("save changes"),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
