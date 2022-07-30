// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:getxnavigationrail/app/data/core/local_storage/local_storage.dart';
import 'package:getxnavigationrail/app/data/models/settings.dart';

import './settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  LocalStorage _storage;
  SettingsRepositoryImpl({
    required LocalStorage storage,
  }) : _storage = storage;
  @override
  Future<bool> saveSettings(Settings settings) async {
    log('Start saving');
    await _storage.setData<bool>('swtich', settings.switchSelected ?? false);
    await _storage.setData<String>('mode', settings.mode ?? '');
    await _storage.setData<double>('slide', settings.slide ?? 0.0);
    await _storage.setData<int>('radio', settings.radioSelected ?? 0);
    log('Finished saving');
    log(settings.toString());
    return true;
  }

  @override
  Settings? getSettings() {
    return Settings(
      mode: _storage.getData<String>('mode') ?? 'light',
      switchSelected: _storage.getData<bool>('swtich') ?? false,
      radioSelected: _storage.getData<int>('radio') ?? 0,
      slide: _storage.getData<double>('slide') ?? 0.00,
    );
  }
}
