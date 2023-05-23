import 'package:app/Controllers/app_controller.dart';
import 'package:app/Controllers/authentication_controller.dart';
import 'package:get/get.dart';

class ControllersBinder implements Bindings {
  @override
  void dependencies() {
    Get.put(AppController());
    Get.put(AuthenticationController());
  }
}
