import 'package:get/get.dart';
import 'package:getxnavigationrail/app/data/core/constants.dart';

import './home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => HomeController(storage: Get.find(tag: Constants.storage)));
  }
}
