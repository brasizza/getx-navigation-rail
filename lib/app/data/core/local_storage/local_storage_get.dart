import 'dart:developer';

import 'package:get_storage/get_storage.dart';

import './local_storage.dart';

class LocalStorageGet implements LocalStorage {
  late GetStorage storage;
  @override
  Future<LocalStorageGet> init() async {
    log('Start GetStorage ');
    await GetStorage.init();
    storage = GetStorage();
    return this;
  }

  @override
  void listenKey(String key, {required Function action}) {
    storage.listenKey(key, (value) {
      action(value);
    });
  }

  @override
  T getData<T>(String key) => storage.read(key);

  @override
  bool hasData(String key) {
    return storage.hasData(key);
  }

  @override
  Future<bool> clearStorage() async {
    await storage.erase();
    return true;
  }

  @override
  Future<bool> removeData(String key) async {
    await storage.remove(key);
    return true;
  }

  @override
  Future<bool> setData<T>(String key, T value) async {
    await storage.write(key, value);
    return true;
  }
}
