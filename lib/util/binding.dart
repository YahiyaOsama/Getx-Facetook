import 'package:get/get.dart';
import 'package:october_assignment/controller/login_controller.dart';

import '../controller/controller.dart';
import '../data/api.dart';
import '../data/repository.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.put<Controller>(Controller(Repository(Api())), permanent: true);
    Get.put<LoginController>(LoginController());
  }
}
