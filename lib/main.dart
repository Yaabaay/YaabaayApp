import 'package:app/Resources/app_routes.dart';
import 'package:app/Screens/Shared/agent_screen.dart';
import 'package:app/Screens/Shared/splash.dart';
import 'package:app/Theme/app_theme.dart';
import 'package:app/Theme/theme_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'Resources/translations.dart';
import 'Utilities/controllers_binder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await AT1Translations.init();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeModel(),
      child: Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
          return GetMaterialApp(
            title: 'YaaBaay',
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.dark,
            theme:
                themeNotifier.isDark ? AppTheme.darkTheme : AppTheme.lightTheme,
            locale: Get.deviceLocale,
            fallbackLocale: Locale('en'),
            translations: AT1Translations(),
            initialBinding: ControllersBinder(),
            initialRoute: SplashScreen.routeName,
            getPages: appRoutes(),
          );
        },
      ),
    );
  }
}
