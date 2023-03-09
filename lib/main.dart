import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:slim_voice/frontend/states/state.client.dart';
import 'package:slim_voice/frontend/states/state.global.dart';
import 'package:slim_voice/frontend/states/state.invoice.dart';
import 'package:slim_voice/frontend/states/state.settings.dart';
import 'package:slim_voice/frontend/views/login/view.login.dart';

void main() {
  Get.lazyPut(() => GlobalState());
  Get.lazyPut(() => ClientState());
  Get.lazyPut(() => InvoiceState());
  Get.lazyPut(() => SettingsState());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) {
        return Stack(
          children: [
            Container(
              color: Colors.white,
            ),
            Container(
              color: Colors.red,
              height: 50,
            ),
            Center(
              child: Column(
                children: [
                  // Container(
                  //   color: Colors.red,
                  //   height: 50,
                  // ),
                  Expanded(
                    child: ResponsiveWrapper(
                      // backgroundColor: Colors.red,
                      maxWidth: 800,
                      child: SizedBox(
                        width: Get.width,
                        height: Get.height,
                        child: child!,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
      home: const LoginView(),
      // color: Colors.white,
    );
  }
}
