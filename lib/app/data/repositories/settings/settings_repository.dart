import 'package:getxnavigationrail/app/data/models/settings.dart';

abstract class SettingsRepository {
  Future<bool> saveSettings(Settings settings);
  Settings? getSettings();
}
