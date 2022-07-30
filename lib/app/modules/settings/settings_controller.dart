// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';
import 'package:getxnavigationrail/app/data/models/settings.dart';
import 'package:getxnavigationrail/app/data/services/news/settings/settings_service.dart';

class SettingsController extends GetxController with StateMixin<Settings> {
  final SettingsService _service;
  SettingsController({
    required SettingsService service,
  }) : _service = service;

  @override
  void onInit() {
    super.onInit();

    getSettings();
  }

  void getSettings() {
    change(null, status: RxStatus.loading());
    change(_service.getSettings(), status: RxStatus.success());
  }

  Future<void> saveSettings(Settings settings) async {
    await _service.saveSettings(settings);
    getSettings();
  }
}
