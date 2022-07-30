import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './settings_controller.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Settings Page"),
        Expanded(child: controller.obx((settings) {
          return Column(
            children: [
              SwitchListTile.adaptive(
                  title: const Text("Switch persistent"),
                  dense: true,
                  controlAffinity: ListTileControlAffinity.leading,
                  value: settings?.switchSelected ?? false,
                  onChanged: (newValue) async {
                    await controller.saveSettings(settings!.copyWith(switchSelected: newValue));
                  }),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Slider.adaptive(
                          max: 100,
                          divisions: 50,
                          label: '${settings?.slide?.round()}',
                          value: settings?.slide ?? 0.0,
                          onChanged: (val) async {
                            await controller.saveSettings(settings!.copyWith(slide: val));
                          }),
                    ),
                    Text('${settings?.slide?.round()}'),
                  ],
                ),
              ),
              const Divider(),
              RadioListTile<int>(
                  title: const Text('ListTile1 persistent'),
                  selected: (settings?.radioSelected == 0),
                  value: 0,
                  groupValue: settings?.radioSelected,
                  onChanged: (selected) async {
                    await controller.saveSettings(settings!.copyWith(radioSelected: selected));
                  }),
              RadioListTile<int>(
                  title: const Text('ListTile2 persistent'),
                  selected: (settings?.radioSelected == 1),
                  value: 1,
                  groupValue: settings?.radioSelected,
                  onChanged: (selected) async {
                    await controller.saveSettings(settings!.copyWith(radioSelected: selected));
                  }),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        await controller.saveSettings(settings!.copyWith(mode: 'dark'));

                        Get.changeThemeMode(ThemeMode.dark);
                      },
                      child: const Text("Dark mode")),
                  ElevatedButton(
                      onPressed: () async {
                        await controller.saveSettings(settings!.copyWith(mode: 'light'));

                        Get.changeThemeMode(ThemeMode.light);
                      },
                      child: const Text("Light mode")),
                ],
              )
            ],
          );
        }))
      ],
    );
  }
}
