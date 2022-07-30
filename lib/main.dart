import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxnavigationrail/app/data/core/binding/app_bindings.dart';
import 'package:getxnavigationrail/app/data/core/local_storage/local_storage.dart';
import 'package:getxnavigationrail/app/data/core/local_storage/local_storage_get.dart';
import 'package:getxnavigationrail/app/data/core/local_storage/local_storage_shared.dart';
import 'package:getxnavigationrail/app/modules/home/home_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync<LocalStorage>(() async => LocalStorageGet().init(), tag: 'GET_STORAGE', permanent: true);
  await Get.putAsync<LocalStorage>(() async => LocalStorageShared().init(), tag: 'SHARED_PREFRENCES', permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AppBinding(),
      theme: ThemeData.light(),
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark(),
      initialRoute: '/',
      getPages: [
        ...HomeRoutes.pages,
      ],
    );
  }
}
