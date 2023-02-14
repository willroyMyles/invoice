import 'package:flutter/material.dart';
import 'package:slim_voice/backend/helpers/widgetHelper.dart';

class CreateInvoiceView extends StatelessWidget {
  const CreateInvoiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              primaryButton(
                "Download pdf",
                onPressed: () {},
              ),
              secondaryButton("preview", () {}),
              secondaryButton("duplicate", () {}),
              secondaryButton("delete", () {}),
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
