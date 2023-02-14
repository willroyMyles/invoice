import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slim_voice/backend/enum/enum.currency.dart';
import 'package:slim_voice/backend/enum/enum.dueDate.dart';
import 'package:slim_voice/backend/enum/enum.negativeSign.dart';
import 'package:slim_voice/backend/helpers/widgetHelper.dart';
import 'package:slim_voice/frontend/components/view.cardComponent.dart';
import 'package:slim_voice/frontend/states/state.settings.dart';

import '../../backend/models/model.profile.dart';

class ProfileComponent extends GetView<SettingsState> {
  final ProfileModel? model;
  const ProfileComponent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (_) {
        return CardComponent(
          child: Container(
            child: Column(
              children: [
                cardText("Profile"),
                const Divider(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            hintText("Name"),
                            inputHolder(
                              TextField(
                                controller: controller.name,
                                decoration:
                                    generalInputDecoration("placeholder"),
                              ),
                            ),
                            hintText("Address / Contact No."),
                            inputHolder(
                              TextField(
                                maxLines: 10,
                                controller: controller.address,
                                decoration:
                                    generalInputDecoration("placeholder"),
                              ),
                            ),
                          ]),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: Container(
                      // color: Colors.red,
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              hintText("currency"),
                              const SizedBox(height: 5),
                              DropdownMenu(
                                controller: controller.currency,
                                dropdownMenuEntries: Currency.values.map((e) {
                                  return DropdownMenuEntry(
                                    value: e,
                                    label: e.name,
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              hintText("Due Date"),
                              const SizedBox(height: 5),
                              DropdownMenu(
                                controller: controller.dueDate,
                                dropdownMenuEntries: DueDate.values.map((e) {
                                  return DropdownMenuEntry(
                                    value: e,
                                    label: e.name,
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              hintText("Negative Numbers"),
                              const SizedBox(height: 5),
                              DropdownMenu(
                                controller: controller.negativeNumber,
                                dropdownMenuEntries:
                                    NegativeSign.values.map((e) {
                                  return DropdownMenuEntry(
                                    value: e,
                                    label: e.name,
                                  );
                                }).toList(),
                                hintText: "Select a sign",
                                inputDecorationTheme: InputDecorationTheme(
                                    outlineBorder: const BorderSide(
                                        color: Colors.red, width: 10),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 10,
                                            color:
                                                Colors.red.withOpacity(.9)))),
                                menuStyle: MenuStyle(
                                    surfaceTintColor: mst(Colors.red)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ))
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      tertiaryButton("Cancel", () {}),
                      tertiaryButton("get test", () {
                        controller.getProfile();
                      }),
                      primaryButton(
                        "save changes",
                        onPressed: () {
                          controller.updateProfile();
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
