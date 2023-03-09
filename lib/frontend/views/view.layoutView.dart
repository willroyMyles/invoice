import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:slim_voice/backend/network/executors/executor.dart';
import 'package:slim_voice/frontend/states/state.global.dart';
import 'package:slim_voice/frontend/views/client/clients.dart';
import 'package:slim_voice/frontend/views/dashboard.dart';
import 'package:slim_voice/frontend/views/invoice.dart';
import 'package:slim_voice/frontend/views/login/view.login.dart';
import 'package:slim_voice/frontend/views/settings.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  height: 50,
                  width: Get.width,
                  color: Colors.red,
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
                                onPressed: () {},
                                child: Text("new invoice".capitalize!)),
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
                                    onTap: () {
                                      Get.to(() => const DashBoard());
                                    },
                                  ),
                                  PopupMenuItem(
                                    value: "/invoices",
                                    child: const Text("Invoices"),
                                    onTap: () {
                                      Get.to(() => const InvoiceView());
                                    },
                                  ),
                                  PopupMenuItem(
                                    value: "/clients",
                                    child: const Text("Clients"),
                                    onTap: () {
                                      Get.to(() => ClientsView());
                                    },
                                  ),
                                  PopupMenuItem(
                                    value: "/settings",
                                    child: const Text("Settings"),
                                    onTap: () {
                                      Get.to(() => SettingsView());
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
                ),
                Expanded(
                  child: Container(
                    child: ResponsiveWrapper.builder(
                        const GetMaterialApp(
                          home: LoginView(),
                        ),
                        // Navigator(
                        //   key: Get.nestedKey("0"),
                        //   onGenerateRoute: (settings) {
                        //     Widget child =
                        //         getChild(settings.name, settings.arguments);

                        //     return MaterialPageRoute(
                        //       builder: (context) {
                        //         return Container(
                        //             padding: const EdgeInsets.symmetric(
                        //                 horizontal: 10),
                        //             child: child);
                        //       },
                        //     );
                        //   },
                        //   initialRoute: "/login",
                        // ),
                        backgroundColor: Colors.green,
                        maxWidth: 800,
                        alignment: Alignment.center),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getChild(String? path, [Object? arg]) {
    if (path == null) return Container();
    if (path == "/login") {
      return const LoginView();
    }

    if (path == "/register") {
      return const DashBoard();
    }

    if (!Get.find<GlobalState>().isLoggedIn.value) {
      return const LoginView();
    }

    if (path == "/dashboard") {
      return const DashBoard();
    }

    if (path == "/invoices") {
      return const InvoiceView();
    }

    if (path == "/clients") {
      return ClientsView();
    }

    if (path == "/settings") {
      return SettingsView();
    }

    // if (path == "/createInvoice") {
    //   return const CreateInvoiceView();
    // }

    return Container();
  }
}
