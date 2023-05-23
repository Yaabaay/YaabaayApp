import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '/Resources/strings.dart';
import '../Models/Shared/supported_language.dart';

class AT1Translations extends Translations {
  static List supportedLanguages = [
    SupportedLanguage(
      name: 'English',
      englishName: 'English',
      locale: const Locale('en'),
    ),
    SupportedLanguage(
      name: 'العربية',
      englishName: 'Arabic',
      locale: const Locale('ar'),
    ),
  ];
  static Map<String, String> arFile = {};
  static Map<String, String> enFile = {};
  static init() async {
    // final arabic = await rootBundle.loadString('assets/translations/ar.json');
    // final english = await rootBundle.loadString('assets/translations/en.json');
    // arFile = Map<String, String>.from(jsonDecode(arabic));
    // enFile = Map<String, String>.from(jsonDecode(english));
  }

  @override
  Map<String, Map<String, String>> get keys {
    return {
      'en': {
        AT1Strings.langName: 'English',
        AT1Strings.Home: 'Home',
        AT1Strings.signIn: 'Sign in',
        AT1Strings.signUp: 'Sign up',
        AT1Strings.skip: 'skip for now',
        AT1Strings.backLogin: 'Back to login',
        AT1Strings.backHome: 'Back to Home',
        AT1Strings.submit: 'Submit',
        AT1Strings.confirm: 'Confirm',
        AT1Strings.alert: 'Alert',
        AT1Strings.dismiss: 'Dismiss',
        AT1Strings.Continue: 'Continue',
        AT1Strings.done: 'Done',
        AT1Strings.ok: 'Ok',
        AT1Strings.freeConsultation: 'Free Consultation',

        //Alert
        AT1Strings.successTitle: 'Success',
        AT1Strings.errorTitle: 'Error',
        AT1Strings.warningTitle: 'Warning',

        //Menu
        AT1Strings.menuProfile: 'Profile',
        AT1Strings.menuWelcome: 'Hi, Welcome',
        AT1Strings.menuSocialMedia: 'SocialMedia',
        AT1Strings.menuSettings: 'Settings',
        AT1Strings.menuContactUs: 'Contact Us',
        AT1Strings.menuLogout: 'Logout',
        AT1Strings.menuLogoutConfirm: 'Confirm Logout ?',
        AT1Strings.menuFollowYaaBaayApp: 'Follow us on social Media',
        AT1Strings.facebook: 'Facebook',
        AT1Strings.twitter: 'Twitter',
        AT1Strings.instagram: 'Instagram',

        //Intro
        AT1Strings.slideOneTitle: 'FRIENDLY GUIDANCE',
        AT1Strings.slideOneContent: 'Connecting clients directly with hospitals without intermediaries.',
        AT1Strings.slideTwoTitle: 'AFFORDABLE RATES',
        AT1Strings.slideTwoContent: 'High commitment in appointments with high accuracy.',
        AT1Strings.slideThreeTitle: 'WHATEVER YOU FROM',
        AT1Strings.slideThreeContent: 'Easy access to all the details related to medical tourism in several languages',

        //About
        AT1Strings.aboutYaabaay: 'About Yaabaay',

        //Help Center
        AT1Strings.helpCenter: 'Help Center',

        //Sign in
        AT1Strings.signInTitle: 'Sign In',
        AT1Strings.signInEmail: 'Email address',
        AT1Strings.signInPassword: 'Password',
        AT1Strings.signInForgotPassword: 'Forgot password ?',
        AT1Strings.signInDontHaveAccount: 'You don\'t have an account yet?',

        //Sign up
        AT1Strings.signUpTitle: 'Sign up',
        AT1Strings.signUpName: 'Name',
        AT1Strings.signUpMobile: 'Mobile',
        AT1Strings.signUpByClicking: 'By clicking submit you agree to the',
        AT1Strings.signUpAlreadyHaveAccount: 'Already have account',

        //Forget Password
        AT1Strings.forgetPass: 'Forget Password ?',
        AT1Strings.forgetPassToReset: 'To reset your password, you need your email or mobile number that can be authenticated',
        AT1Strings.forgetPassReset: 'Reset Password',

        //Check Mail
        AT1Strings.CheckMail: 'Check Mail',
        AT1Strings.CheckMailWeHaveSent: 'We have sent the reset password to the email address',
        AT1Strings.CheckMailOpenYourEmail: 'Open Your Email',
        AT1Strings.CheckMailBackToLogin: 'Back to login',

        //Profile
        AT1Strings.Profile: 'Profile',
        AT1Strings.ProfileCustomer: 'Customer',
        AT1Strings.ProfileAgent: 'Sales Agent',
        AT1Strings.ProfileAdmin: 'CEO',
        AT1Strings.ProfileEdit: 'Edit Profile',

        //Service Single
        AT1Strings.Service: 'Service',
        AT1Strings.ServiceAskConsultation: 'Ask Free Medical Consultation ?',
        AT1Strings.ServiceThanksConsultation: 'Thanks for using our platform, Medical Consultation will contact you soon!',

        //Service Request
        AT1Strings.ServiceRequest: 'Service Request',
        AT1Strings.ServiceRequestSubmit: 'GET FREE MEDICAL CONSULTATION',

        //Service Request Sent
        AT1Strings.ServiceRequestSent: 'Sent Successfully',
        AT1Strings.ServiceRequestSentSuccess: 'Received successfully',
        AT1Strings.ServiceRequestSentSuccessContent: 'You will be contacted by our medical advisor as soon as possible',

        //Notifications
        AT1Strings.Notifications: 'Notifications',
        AT1Strings.NotificationsStay: 'Stay Tuned!',
        AT1Strings.NotificationsNoContent: 'No Notification Till Yet',

        //Contact Us
        AT1Strings.ContactUS: 'Contact Us',
        AT1Strings.ContactUsSentSuccessfully: 'Sent Successfully',
        AT1Strings.ContactUsSentSuccessfullyMsg: 'Thanks for contacting us, we will contact you ASAP!',
        AT1Strings.ContactUsMsg: 'Message',

        //Settings
        AT1Strings.settingsTitle: 'Settings',
        AT1Strings.settingsLanguage: 'Language',
        AT1Strings.settingsTheme: 'Appearance',
        AT1Strings.settingsNotifications: 'Notifications',
        AT1Strings.settingsPrivacyPolicy: 'Privacy & Security',
        AT1Strings.settingsTermsConditions: 'Terms & Conditions',
        AT1Strings.settingsHelpSupport: 'Help & Support',
        AT1Strings.settingsAbout: 'About',
      },
      'ar': {
        AT1Strings.langName: 'العربية',
        AT1Strings.Home: 'الرئيسية',
        AT1Strings.signIn: 'تسجيل الدخول',
        AT1Strings.signUp: 'تسجيل عضوية',
        AT1Strings.skip: 'ليس الآن',
        AT1Strings.backLogin: 'العودة لتسجيل الدخول',
        AT1Strings.backHome: 'الرئيسية',
        AT1Strings.submit: 'إرسال',
        AT1Strings.confirm: 'تأكيد',
        AT1Strings.alert: 'تنبيه',
        AT1Strings.dismiss: 'رجوع',
        AT1Strings.Continue: 'متابعة',
        AT1Strings.done: 'تم',
        AT1Strings.ok: 'حسنا',
        AT1Strings.freeConsultation: 'إستشارة مجانية',

        //Alerts
        AT1Strings.successTitle: 'تم بنجاح',
        AT1Strings.errorTitle: 'خطأ',
        AT1Strings.warningTitle: 'تحذير',

        //Menu
        AT1Strings.menuProfile: 'الملف الشخصى',
        AT1Strings.menuWelcome: 'مرحبا بك',
        AT1Strings.menuSocialMedia: 'التواصل الإجتماعي',
        AT1Strings.menuSettings: 'الإعدادات',
        AT1Strings.menuContactUs: 'تواصل معنا',
        AT1Strings.menuLogout: 'تسجيل خروج',
        AT1Strings.menuLogoutConfirm: 'تأكيد تسجيل الخروج ؟',
        AT1Strings.menuFollowYaaBaayApp: 'تابعنا على مواقع التواصل الإجتماعى',
        AT1Strings.facebook: 'فيس بوك',
        AT1Strings.twitter: 'تويتر',
        AT1Strings.instagram: 'إنستقرام',

        //Intro
        AT1Strings.slideOneTitle: 'بدون وسيط',
        AT1Strings.slideOneContent: 'ربط العملاء مباشرة بالمستشفيات بدون وسطاء',
        AT1Strings.slideTwoTitle: 'أسعار معقولة',
        AT1Strings.slideTwoContent: 'التزام عالي في المواعيد بدقة عالية',
        AT1Strings.slideThreeTitle: 'من أي مكان',
        AT1Strings.slideThreeContent: 'سهولة الوصول إلى كافة التفاصيل المتعلقة بالسياحة العلاجية بعدة لغات',

        //About
        AT1Strings.aboutYaabaay: 'عن التطبيق',

        //Help Center
        AT1Strings.helpCenter: 'مركز المساعدة',

        //Sign in
        AT1Strings.signInTitle: 'تسجيل الدخول',
        AT1Strings.signUpName: 'الإسم',
        AT1Strings.signInEmail: 'البريد الإلكتروني',
        AT1Strings.signInPassword: 'كلمة المرور',
        AT1Strings.signInForgotPassword: 'نسيت كلمة المرور ؟',
        AT1Strings.signInDontHaveAccount: 'ليس لديك حساب ؟',

        //Sign up
        AT1Strings.signUpTitle: 'تسجيل عضوية',
        AT1Strings.signUpMobile: 'الجوال',
        AT1Strings.signUpByClicking: 'بالنقر فوق إرسال فإنك توافق على',
        AT1Strings.signUpAlreadyHaveAccount: 'لديك حساب بالفعل',

        //Forget Password
        AT1Strings.forgetPass: 'نسيت كلمة المرور؟',
        AT1Strings.forgetPassToReset: 'لإعادة تعيين كلمة المرور الخاصة بك ، تحتاج إلى بريدك الإلكتروني أو رقم هاتفك المحمول الذي يمكن المصادقة عليه',
        AT1Strings.forgetPassReset: 'إعادة تعيين كلمة المرور',

        //Check Mail
        AT1Strings.CheckMail: 'افحص البريد الإلكتروني الخاص بك',
        AT1Strings.CheckMailWeHaveSent: 'لقد أرسلنا إعادة تعيين كلمة المرور إلى عنوان بريدك الإلكتروني',
        AT1Strings.CheckMailOpenYourEmail: 'افتح بريدك الإلكتروني',
        AT1Strings.CheckMailBackToLogin: 'العودة إلى تسجيل الدخول',

        //Profile
        AT1Strings.Profile: 'ملف العضوية',
        AT1Strings.ProfileCustomer: 'عميل',
        AT1Strings.ProfileAgent: 'مبيعات',
        AT1Strings.ProfileAdmin: 'الإدارة',
        AT1Strings.ProfileEdit: 'تعديل',

        //Service Single
        AT1Strings.Service: 'خدمة',
        AT1Strings.ServiceAskConsultation: 'اطلب استشارة طبية مجانية؟',
        AT1Strings.ServiceThanksConsultation: 'شكرًا لاستخدامك منصتنا ، ستتصل بك الاستشارات الطبية قريبًا!',

        //Service Request
        AT1Strings.ServiceRequest: 'طلب خدمة',
        AT1Strings.ServiceRequestSubmit: 'احصل على استشارة طبية مجانية',

        //Service Request Sent
        AT1Strings.ServiceRequestSent: 'تم إرسال طلب الخدمة',
        AT1Strings.ServiceRequestSentSuccess: 'تم الاستلام بنجاح',
        AT1Strings.ServiceRequestSentSuccessContent: 'سيتم الاتصال بك من قبل مستشارنا الطبي في أقرب وقت ممكن',

        //Notifications
        AT1Strings.Notifications: 'إشعارات',
        AT1Strings.NotificationsStay: 'ابق على اتصال',
        AT1Strings.NotificationsNoContent: 'لا يوجد إشعارات حتى الآن',

        //Contact Us
        AT1Strings.ContactUS: 'تواصل معنا',
        AT1Strings.ContactUsSentSuccessfully: 'تم الإرسال بنجاح',
        AT1Strings.ContactUsSentSuccessfullyMsg: 'شكرًا على تواصلك معنا ، سنتصل بك في أسرع وقت ممكن!',
        AT1Strings.ContactUsMsg: 'الرسالة',

        //Settings
        AT1Strings.settingsTitle: 'الإعدادات',
        AT1Strings.settingsLanguage: 'اللغة',
        AT1Strings.settingsTheme: 'المظهر',
        AT1Strings.settingsNotifications: 'الإشعارات',
        AT1Strings.settingsPrivacyPolicy: 'سياسة الخصوصية',
        AT1Strings.settingsTermsConditions: 'شروط الإستخدام',
        AT1Strings.settingsHelpSupport: 'المساعدة والدعم',
        AT1Strings.settingsAbout: 'من نحن',
      }
    };
  }
}