import 'package:slim_voice/backend/models/invoice/model.user.dart';
import 'package:slim_voice/backend/network/executors/executor.base.dart';

mixin AuthExecutor {
  Future<void> SigninWithEmailAndPassword(String email, String password) async {
    try {
      var authModel = AuthModel(email: email, pass: password);
      var res = await BE.post("signin", authModel.toMap());
      if (res != null) {
        var token = res.data['token'];
        BE.addBearerToken(token);
      }
    } catch (e) {
      print(e);
      print("didnt sign in");
    }
  }

  Future<void> SigninUpEmailAndPassword(String email, String password) async {
    try {
      var authModel = AuthModel(email: email, pass: password);
      var res = await BE.post("signup", authModel.toMap());
    } catch (e) {
      print(e);
      print("didnt sign in");
    }
  }
}
