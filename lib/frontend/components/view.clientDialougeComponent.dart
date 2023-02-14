import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slim_voice/backend/helpers/widgetHelper.dart';
import 'package:slim_voice/frontend/components/view.cardComponent.dart';

class ClientDialougeComponent extends StatefulWidget {
  const ClientDialougeComponent({super.key});

  @override
  State<ClientDialougeComponent> createState() =>
      _ClientDialougeComponentState();
}

class _ClientDialougeComponentState extends State<ClientDialougeComponent> {
  final TextEditingController name = TextEditingController();
  final TextEditingController address = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CardComponent(
        child: SizedBox(
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

                decoration: generalInputDecoration("address/ contact info"),
              )),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              tertiaryButton("cancel", () {
                Get.back();
              }),
              primaryButton("Create", onPressed: () {
                Get.back(result: [name.text, address.text]);
              }),
            ],
          )
        ],
      ),
    ));
  }
}
