import 'package:get/get.dart';
import 'package:getxnavigationrail/app/data/core/constants.dart';
import 'package:getxnavigationrail/app/data/repositories/settings/settings_repository.dart';
import 'package:getxnavigationrail/app/data/repositories/settings/settings_repository_impl.dart';
import 'package:getxnavigationrail/app/data/services/news/settings/settings_service.dart';
import 'package:getxnavigationrail/app/data/services/news/settings/settings_service_impl.dart';

import './settings_controller.dart';

class SettingsBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<SettingsRepository>(SettingsRepositoryImpl(storage: Get.find(tag: Constants.storage)));
    Get.put<SettingsService>(SettingsServiceImpl(repository: Get.find()));
    Get.put(SettingsController(service: Get.find()));
  }
}
