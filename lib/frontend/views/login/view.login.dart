import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:slim_voice/backend/helpers/widgetHelper.dart';
import 'package:slim_voice/backend/network/executors/executor.dart';
import 'package:slim_voice/frontend/components/view.cardComponent.dart';
import 'package:slim_voice/frontend/views/dashboard.dart';
import 'package:slim_voice/frontend/views/login/view.register.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  final form = FormGroup({
    'username': FormControl<String>(value: ''),
    'password': FormControl<String>(value: ''),
  }, validators: [
    Validators.required
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: CardComponent(
          child: Container(
            child: ReactiveForm(
              formGroup: form,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
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
                        child: ReactiveTextField(
                          formControlName: "username",
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
                        child: ReactiveTextField(
                          formControlName: "password",
                          decoration: authInputDecoration("password"),
                          obscureText: true,
                          onChanged: (control) {
                            print(control);
                          },
                        ),
                        // child: AutoSizeTextField(
                        //   decoration: authInputDecoration("password"),
                        //   controller: password,
                        // ),
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
                        onPressed: form.valid
                            ? () async {
                                var valid = form.markAllAsTouched();
                                var res = await exe.signinWithEmailAndPassword(
                                    form.controls['username']!.value as String,
                                    form.controls['password']!.value as String);
                                if (res) {
                                  // replaceNamed("/dashboard");
                                  Get.to(const DashBoard());
                                }
                              }
                            : null,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Opacity(
                          opacity: .55, child: Text("dont have an account?")),
                      TextButton(
                          onPressed: () {
                            Get.to(() => const RegisterView());
                          },
                          child: const Text("Register"))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
