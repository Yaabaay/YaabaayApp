import 'package:app/Screens/Profile/edit_profile.dart';
import 'package:app/Screens/Auth/login.dart';
import 'package:app/Screens/Auth/signup.dart';
import 'package:app/Screens/Main/home.dart';
import 'package:app/Screens/Profile/forget_password.dart';
import 'package:app/Screens/Service/service_request.dart';
import 'package:app/Screens/Service/service_request_sent.dart';
import 'package:app/Screens/Service/service_single.dart';
import 'package:app/Screens/Shared/about_app.dart';
import 'package:app/Screens/Shared/agent_screen.dart';
import 'package:app/Screens/Shared/check_mail.dart';
import 'package:app/Screens/Shared/contact_us.dart';
import 'package:app/Screens/Shared/intro_screen.dart';
import 'package:app/Screens/Shared/notifications.dart';
import 'package:app/Screens/Shared/splash.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../Screens/Shared/content.dart';
import '../Screens/Shared/help_center.dart';
import '../Screens/Shared/settings.dart';

appRoutes() => [
      //Home
      GetPage(
        name: SplashScreen.routeName,
        page: () => SplashScreen(),
      ),
      GetPage(
        name: HomeScreen.routeName,
        page: () => HomeScreen(),
      ),
      //Auth
      GetPage(
        name: LoginScreen.routeName,
        page: () => LoginScreen(),
      ),
      GetPage(
        name: SignupScreen.routeName,
        page: () => SignupScreen(),
      ),
      GetPage(
        name: CheckMailScreen.routeName,
        page: () => CheckMailScreen(),
      ),
      //User
      GetPage(
        name: EditProfileScreen.routeName,
        page: () => EditProfileScreen(),
      ),
      GetPage(
        name: ForgetPasswordScreen.routeName,
        page: () => ForgetPasswordScreen(),
      ),
      //Services
      GetPage(
        name: ServiceSingleScreen.routeName,
        page: () => ServiceSingleScreen(),
      ),
      GetPage(
        name: ServiceRequestScreen.routeName,
        page: () => ServiceRequestScreen(),
      ),
      GetPage(
        name: ServiceRequestSentScreen.routeName,
        page: () => ServiceRequestSentScreen(),
      ),
      //Notifications
      GetPage(
        name: NotificationsScreen.routeName,
        page: () => NotificationsScreen(),
      ),
      //Contact us
      GetPage(
        name: ContactUsScreen.routeName,
        page: () => ContactUsScreen(),
      ),
      //Shared
      GetPage(
        name: IntroScreen.routeName,
        page: () => IntroScreen(),
      ),
      GetPage(
        name: AboutAppScreen.routeName,
        page: () => AboutAppScreen(),
      ),
      GetPage(
        name: HelpCenterScreen.routeName,
        page: () => HelpCenterScreen(),
      ),
      GetPage(
        name: SettingScreen.routeName,
        page: () => SettingScreen(),
      ),
      GetPage(
        name: ContentScreen.routeName,
        page: () => ContentScreen(),
      ),
      GetPage(
        name: AgentScreen.routeName,
        page: () => AgentScreen(),
      ),
    ];
