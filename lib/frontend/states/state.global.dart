import 'package:get/state_manager.dart';

class GlobalState extends GetxController {
  RxBool isLoggedIn = true.obs;
  RxString userId = "".obs;

  GlobalState() {
    isLoggedIn.stream.listen((event) {
      print(event);
    });
  }
}
