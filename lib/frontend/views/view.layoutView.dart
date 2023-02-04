import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:slim_voice/backend/helpers/navigatorHelper.dart';
import 'package:slim_voice/frontend/views/clients.dart';
import 'package:slim_voice/frontend/views/dashboard.dart';
import 'package:slim_voice/frontend/views/invoice.dart';
import 'package:slim_voice/frontend/views/login/view.login.dart';
import 'package:slim_voice/frontend/views/settings.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          onSelected: (value) {
                            replaceNamed(value);
                          },
                          itemBuilder: (context) {
                            return [
                              const PopupMenuItem(
                                value: "/",
                                child: Text("DashBoard"),
                              ),
                              const PopupMenuItem(
                                value: "/invoices",
                                child: Text("Invoices"),
                              ),
                              const PopupMenuItem(
                                value: "/clients",
                                child: Text("Clients"),
                              ),
                              const PopupMenuItem(
                                value: "/settings",
                                child: Text("Settings"),
                              ),
                              const PopupMenuDivider(
                                height: .1,
                              ),
                              const PopupMenuItem(
                                value: "/help",
                                child: Text("Help"),
                              ),
                              const PopupMenuDivider(
                                height: .1,
                              ),
                              const PopupMenuItem(
                                value: "/logout",
                                child: Text("Logout"),
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
                    Navigator(
                      key: navKey,
                      onGenerateRoute: (settings) {
                        Widget child = Container();
                        if (settings.name == "/dashboard") {
                          child = const DashBoard();
                        }

                        if (settings.name == "/login") {
                          child = const LoginView();
                        }

                        if (settings.name == "/register") {
                          child = const DashBoard();
                        }

                        if (settings.name == "/invoices") {
                          child = const InvoiceView();
                        }

                        if (settings.name == "/clients") {
                          child = const ClientsView();
                        }

                        if (settings.name == "/settings") {
                          child = const SettingsView();
                        }

                        return MaterialPageRoute(
                          builder: (context) {
                            return Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: child);
                          },
                        );
                      },
                      initialRoute: "/login",
                    ),
                    backgroundColor: Colors.green,
                    maxWidth: 800,
                    alignment: Alignment.center),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
