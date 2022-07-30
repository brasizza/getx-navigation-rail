// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxnavigationrail/app/data/core/local_storage/local_storage.dart';
import 'package:getxnavigationrail/app/modules/news/news_bindings.dart';
import 'package:getxnavigationrail/app/modules/news/news_page.dart';
import 'package:getxnavigationrail/app/modules/profile/profile_bindings.dart';
import 'package:getxnavigationrail/app/modules/profile/profile_page.dart';
import 'package:getxnavigationrail/app/modules/settings/settings_bindings.dart';
import 'package:getxnavigationrail/app/modules/settings/settings_page.dart';

class HomeController extends GetxController {
  final LocalStorage _storage;
  HomeController({
    required LocalStorage storage,
  }) : _storage = storage;

  @override
  void onInit() {
    super.onInit();
    _buildMenu();
  }

  @override
  void onReady() {
    super.onReady();
    _checkTheme();
  }

  void _checkTheme() {
    final mode = _storage.getData<String?>('mode') ?? '';
    if (mode == 'dark') {
      Get.changeThemeMode(ThemeMode.dark);
    } else if (mode == 'light') {
      Get.changeThemeMode(ThemeMode.light);
    } else {
      Get.changeThemeMode(ThemeMode.system);
    }
  }

  final menu = <NavigationRailDestination>[].obs;

  final navigatorIndex = 1;
  final _selectedIndex = 0.obs;
  int? get selectedIndex => _selectedIndex.value;
  set selectedIndex(int? newSelected) {
    _selectedIndex(newSelected);

    switch (newSelected) {
      case 0:
        Get.offNamed(
          '/news',
          id: navigatorIndex,
        );
        break;

      case 1:
        Get.offNamed(
          '/settings',
          id: navigatorIndex,
        );
        break;

      case 2:
        Get.offNamed(
          '/profile',
          id: navigatorIndex,
        );
        break;
      default:
        Get.offNamed(
          '/news',
          id: navigatorIndex,
        );
    }
  }

  void _buildMenu() async {
    menu.clear();

    menu.add(
      const NavigationRailDestination(
        icon: Icon(Icons.home),
        label: Text('News'),
      ),
    );

    menu.add(
      const NavigationRailDestination(
        icon: Icon(Icons.settings),
        label: Text('Settings'),
      ),
    );
    menu.add(
      const NavigationRailDestination(
        icon: Icon(Icons.person),
        label: Text('Profile'),
      ),
    );
  }

  Route? onGeneratedRouter(RouteSettings settings) {
    if (settings.name == '/settings') {
      return GetPageRoute(
        settings: settings,
        page: () => const SettingsPage(),
        binding: SettingsBindings(),
        transition: Transition.leftToRightWithFade,
      );
    }

    if (settings.name == '/profile') {
      return GetPageRoute(
        settings: settings,
        page: () => const ProfilePage(),
        binding: ProfileBindings(),
        transition: Transition.leftToRightWithFade,
      );
    }

    if (settings.name == '/news') {
      return GetPageRoute(
        settings: settings,
        page: () => const NewsPage(),
        binding: NewsBindings(),
        transition: Transition.leftToRightWithFade,
      );
    }

    return null;
  }
}
