abstract class LocalStorage {
  Future<LocalStorage> init();
  T? getData<T>(String key);
  Future<bool> setData<T>(String key, T value);
  bool hasData(String key);
  Future<bool> removeData(String key);
  Future<bool> clearStorage();
  void listenKey(String key, {required Function action});
}
