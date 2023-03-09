import 'package:get/get.dart';
import 'package:slim_voice/backend/network/executors/executor.base.dart';

import '../../../frontend/states/state.global.dart';
import '../../models/invoice/model.user.dart';

mixin AuthExecutor {
  Future<void> logOut() async {
    BE.removeToken();
  }

  Future<bool> signinWithEmailAndPassword(String email, String password) async {
    try {
      // var res = await BE.client.signin(
      //     user: email,
      //     pass: password,
      //     scope: "account",
      //     database: "invdb",
      //     namespace: "invns");
      var authModel = AuthModel(email: email, pass: password);
      var res = await BE.post("signin", authModel.toMap());
      if (res != null) {
        var token = res.data['token'] as String;
        BE.addBearerToken(token);
        Get.find<GlobalState>().isLoggedIn.value = true;
        Get.find<GlobalState>().userId.value = await getUser(email);
        return true;
      }

      return false;
    } catch (e) {
      print(e);
      print("didnt sign in");
      return false;
    }
  }

  Future getUser(String email) async {
    try {
      var res = await BE.selectQuery("user");
      return res;
    } catch (e) {
      print("could not get user");
    }
  }

  Future<bool> signinUpEmailAndPassword(String email, String password) async {
    try {
      var res = await BE.client.signup(
          user: email,
          pass: password,
          scope: "account",
          database: "invdb",
          namespace: "invns");
      return true;
      // var authModel = AuthModel(email: email, pass: password);
      // var res = await BE.post("signup", authModel.toMap());
      // if (res != null) {
      //   var token = res.data['token'];
      //   BE.addBearerToken(token);
      //   Get.find<GlobalState>().isLoggedIn.value = true;
      //   Get.find<GlobalState>().userId.value = await getUser(email);
      //   return true;
      // }
      // return true;
    } catch (e) {
      return false;
      print(e);
      print("didnt sign in");
    }
  }
}
