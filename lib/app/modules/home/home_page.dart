import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: [
            Obx(
              () => controller.menu.isEmpty
                  ? const CircularProgressIndicator.adaptive()
                  : NavigationRail(
                      labelType: NavigationRailLabelType.selected,
                      destinations: controller.menu,
                      selectedIndex: controller.selectedIndex,
                      onDestinationSelected: (value) => controller.selectedIndex = value,
                    ),
            ),
            Expanded(
                child: Navigator(
              initialRoute: '/news',
              key: Get.nestedKey(controller.navigatorIndex),
              onGenerateRoute: controller.onGeneratedRouter,
              observers: [GetObserver((_) {}, Get.routing)],
            )),
          ],
        ),
      ),
    );
  }
}
