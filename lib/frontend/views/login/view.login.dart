import 'package:flutter/material.dart';
import 'package:slim_voice/backend/helpers/widgetHelper.dart';
import 'package:slim_voice/backend/network/executors/executor.dart';
import 'package:slim_voice/frontend/components/view.cardComponent.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: CardComponent(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                cardText("Login"),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 30,
                      width: 200,
                      child: TextField(
                        decoration: authInputDecoration("username"),
                        controller: username,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 30,
                      width: 200,
                      child: TextField(
                        decoration: authInputDecoration("password"),
                        controller: password,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    primaryButton(
                      "login",
                      () async {
                        await exe.SigninWithEmailAndPassword(
                            username.text, password.text);
                      },
                      largeHorizontal: true,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    IconButton(
                        onPressed: () async {},
                        icon: const Icon(
                          Icons.g_mobiledata,
                          color: Colors.red,
                          fill: .1,
                          weight: 10,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                hintButton("forgot password?", () {}),
                const Divider(),
                const Text("a bag a chattings")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
