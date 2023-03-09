import 'package:get/get.dart';

pushNamed(String path, [Object? arg]) {
  // Get.nestedKey("0")!.currentState!.pushNamed(path, arguments: arg);
  Get.toNamed(path, arguments: arg);
}

replaceNamed(String path, [Object? arg]) {
  // Get.nestedKey("0")!.currentState!.pushReplacementNamed(path, arguments: arg);
  Get.offAndToNamed(path, arguments: arg);
}

// getArguments() =>  
