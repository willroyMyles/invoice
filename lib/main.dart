import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slim_voice/frontend/states/state.client.dart';
import 'package:slim_voice/frontend/states/state.global.dart';
import 'package:slim_voice/frontend/states/state.invoice.dart';
import 'package:slim_voice/frontend/states/state.settings.dart';
import 'package:slim_voice/frontend/views/view.layoutView.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LayoutView(),
    );
  }
}
