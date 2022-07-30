import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:getxnavigationrail/app/modules/home/home_bindings.dart';
import 'package:getxnavigationrail/app/modules/home/home_page.dart';

class HomeRoutes {
  static final pages = [GetPage(name: '/', page: () => const HomePage(), binding: HomeBindings())];
}
