import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_app/pages/home/home_page.dart';
import 'package:test_app/pages/home_tab/home_tab_page.dart';
import 'package:test_app/pages/splash_page.dart';
import 'package:test_app/service/connectivity_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppBinding().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return GetMaterialApp(
          defaultTransition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 200),
          initialRoute: '/splash',
          initialBinding: AppBinding(),
          onGenerateInitialRoutes: (name) {
            return [
              PageRedirect(
                settings: RouteSettings(name: name),
                unknownRoute:
                    GetPage(page: () => const SplashView(), name: name),
                route: GetPage(page: () => const SplashView(), name: name),
              ).page(),
            ];
          },
          onGenerateRoute: (setting) {
            switch (setting.name) {
              case "/homeTab":
                {
                  return page(setting, () => HomeTabPage());
                }
              case "/home":
                {
                  return page(setting, () => HomePage());
                }
            }
          },
          theme: ThemeData(
            fontFamily: 'sfPro',
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: Colors.black,
            ),
          ),
        );
      },
    );
  }

  GetPageRoute page(RouteSettings settings, Widget Function() genPage,
      [Bindings? bindings]) {
    var page = GetPage(
      name: settings.name!,
      page: genPage,
      arguments: settings.arguments,
      binding: bindings,
    );
    return PageRedirect(route: page, unknownRoute: page).page();
  }
}

class AppBinding extends Bindings {
  @override
  void dependencies() async {
    await Get.putAsync(() async {
      var sv = ConnectivityService();
      await sv.setup();
      return sv;
    });
  }
}
