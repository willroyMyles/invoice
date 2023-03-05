import 'package:flutter/material.dart';
import 'package:slim_voice/frontend/components/view.dratComponent.dart';
import 'package:slim_voice/frontend/components/view.unpaidComponent.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        // color: Colors.yellow,
        child: const Column(
          children: [
            SizedBox(
              height: 30,
            ),
            DraftComponent(),
            SizedBox(
              height: 30,
            ),
            UnpaidComponent(invoices: []),
            SizedBox(
              height: 30,
            ),
            Text("dashboard"),
          ],
        ),
      ),
    );
  }
}
