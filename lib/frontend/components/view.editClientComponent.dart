import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slim_voice/frontend/components/view.cardComponent.dart';
import 'package:slim_voice/frontend/states/state.client.dart';

import '../../backend/helpers/widgetHelper.dart';

class EditClientComponent extends GetView<ClientState> {
  EditClientComponent({super.key});
  final TextEditingController name = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CardComponent(
        child: Container(
      child: IntrinsicHeight(
        child: Row(children: [
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  width: Get.width * .4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      cardText("new client"),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                          height: 30,
                          decoration: boxInputDecoration(),
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: TextField(
                            controller: name,
                            decoration: generalInputDecoration("name"),
                          )),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                          // height: 30,
                          decoration: boxInputDecoration(),
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: TextField(
                            controller: address,
                            // textAlignVertical: TextAlignVertical.top,
                            maxLines: 8,
                            cursorColor: Colors.red,

                            decoration:
                                generalInputDecoration("address/ contact info"),
                          )),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {}, child: const Text("Delete")),
                          const Spacer(),
                          tertiaryButton("cancel", () {
                            Get.back();
                          }),
                          const SizedBox(width: 5),
                          primaryButton("Save changes", onPressed: () {
                            // Get.back(result: [name.text, address.text]);
                          }),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const VerticalDivider(
            width: 40,
          ),
          Expanded(
            child: GetBuilder<ClientState>(
              init: controller,
              initState: (_) {},
              builder: (_) {
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text("Contacts"),
                        const Spacer(),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.add)),
                      ],
                    ),
                    const Divider(
                      thickness: 5,
                    ),
                    Container(
                      child: Row(children: [
                        Expanded(
                            child: TextField(
                          controller: email,
                          // decoration: generalInputDecoration("contact"),
                        )),
                        primaryButton("Add", onPressed: () async {
                          // createContact();
                          await controller.createContact(email.text);
                          email.clear();
                        })
                      ]),
                    ),
                    ...controller.editingModel!.contacts.map((e) {
                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(e.email),
                            const Divider(),
                          ],
                        ),
                      );
                    })
                  ],
                );
              },
            ),
          ),
        ]),
      ),
    ));
  }
}
