import 'package:getxnavigationrail/app/data/models/settings.dart';

abstract class SettingsService {
  Future<bool> saveSettings(Settings settings);
  Settings? getSettings();
}
