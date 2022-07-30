// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:getxnavigationrail/app/data/models/settings.dart';
import 'package:getxnavigationrail/app/data/repositories/settings/settings_repository.dart';

import './settings_service.dart';

class SettingsServiceImpl implements SettingsService {
  final SettingsRepository _repository;
  SettingsServiceImpl({
    required SettingsRepository repository,
  }) : _repository = repository;
  @override
  Future<bool> saveSettings(Settings settings) async {
    return await _repository.saveSettings(settings);
  }

  @override
  Settings? getSettings() {
    return _repository.getSettings();
  }
}
