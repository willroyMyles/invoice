import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import '../../backend/network/executors/executor.dart';
import '../views/client/clients.dart';
import '../views/dashboard.dart';
import '../views/invoice.dart';
import '../views/settings.dart';

class HearderComponent extends StatelessWidget {
  const HearderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: Get.width,
      clipBehavior: Clip.none,
      decoration: const BoxDecoration(
        color: Colors.red,
      ),
      alignment: Alignment.center,
      child: ResponsiveWrapper(
        maxWidth: 800,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Dashboard"),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                    onPressed: () {}, child: Text("new invoice".capitalize!)),
                PopupMenuButton<String>(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.zero,
                  elevation: 1,
                  // onSelected: (value) {
                  //   replaceNamed(value);
                  // },
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        value: "/",
                        child: const Text("DashBoard"),
                        onTap: () async {
                          await Get.to(() => const DashBoard());
                        },
                      ),
                      PopupMenuItem(
                        value: "/invoices",
                        child: const Text("Invoices"),
                        onTap: () async {
                          await Get.to(() => const InvoiceView());
                        },
                      ),
                      PopupMenuItem(
                        value: "/clients",
                        child: const Text("Clients"),
                        onTap: () async {
                          await Future.delayed(
                              const Duration(milliseconds: 100));
                          await await Get.to(() => ClientsView());
                        },
                      ),
                      PopupMenuItem(
                        value: "/settings",
                        child: const Text("Settings"),
                        onTap: () async {
                          await Get.to(() => SettingsView());
                        },
                      ),
                      const PopupMenuDivider(
                        height: .1,
                      ),
                      PopupMenuItem(
                        value: "/help",
                        child: const Text("Help"),
                        onTap: () {
                          // Get.to(() => const ());
                        },
                      ),
                      const PopupMenuDivider(
                        height: .1,
                      ),
                      PopupMenuItem(
                        value: "/logout",
                        child: const Text("Logout"),
                        onTap: () {
                          exe.logOut();
                        },
                      ),
                    ];
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
