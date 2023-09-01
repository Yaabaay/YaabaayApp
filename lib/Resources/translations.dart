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
        AT1Strings.successTitleDesc: 'Request done successfully',
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
        AT1Strings.slideOneContent:
            'Connecting clients directly with hospitals without intermediaries.',
        AT1Strings.slideTwoTitle: 'AFFORDABLE RATES',
        AT1Strings.slideTwoContent:
            'High commitment in appointments with high accuracy.',
        AT1Strings.slideThreeTitle: 'WHATEVER YOU FROM',
        AT1Strings.slideThreeContent:
            'Easy access to all the details related to medical tourism in several languages',

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
        AT1Strings.signUpRegisterBy: 'Your Agent Code/Link (if exists)',

        //Forget Password
        AT1Strings.forgetPass: 'Forget Password ?',
        AT1Strings.forgetPassToReset:
            'To reset your password, you need your email or mobile number that can be authenticated',
        AT1Strings.forgetPassReset: 'Reset Password',

        //Check Mail
        AT1Strings.CheckMail: 'Check Mail',
        AT1Strings.CheckMailWeHaveSent:
            'We have sent the reset password to the email address',
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
        AT1Strings.ServiceThanksConsultation:
            'Thanks for using our platform, Medical Consultation will contact you soon!',

        //Service Request
        AT1Strings.ServiceRequest: 'Service Request',
        AT1Strings.ServiceRequestSubmit: 'GET FREE MEDICAL CONSULTATION',

        //Service Request Sent
        AT1Strings.ServiceRequestSent: 'Sent Successfully',
        AT1Strings.ServiceRequestSentSuccess: 'Received successfully',
        AT1Strings.ServiceRequestSentSuccessContent:
            'You will be contacted by our medical advisor as soon as possible',

        //Notifications
        AT1Strings.Notifications: 'Notifications',
        AT1Strings.NotificationsStay: 'Stay Tuned!',
        AT1Strings.NotificationsNoContent: 'No Notification Till Yet',

        //Contact Us
        AT1Strings.ContactUS: 'Contact Us',
        AT1Strings.ContactUsSentSuccessfully: 'Sent Successfully',
        AT1Strings.ContactUsSentSuccessfullyMsg:
            'Thanks for contacting us, we will contact you ASAP!',
        AT1Strings.ContactUsMsg: 'Message',

        //Settings
        AT1Strings.settingsTitle: 'Settings',
        AT1Strings.settingsLanguage: 'Language',
        AT1Strings.settingsSelectLanguage: 'select your language',
        AT1Strings.settingsTheme: 'Appearance',
        AT1Strings.settingsNotifications: 'Notifications',
        AT1Strings.settingsPrivacyPolicy: 'Privacy & Security',
        AT1Strings.settingsTermsConditions: 'Terms & Conditions',
        AT1Strings.settingsHelpSupport: 'Help & Support',
        AT1Strings.settingsAbout: 'About',

        //Agent
        AT1Strings.agentTitle: 'Agent',
        AT1Strings.customersTitle: 'Customers',
        AT1Strings.customersTitleDesc:
            'This page shows the number of successful conversions generated by your code',
        AT1Strings.agentCopy: 'Click at code to copy',
        AT1Strings.agentLink: 'Referral Code',
        AT1Strings.textcopied: 'Text copied to clipboard',

        //Delete Account
        AT1Strings.deleteAccount: "Delete Your Account",
        AT1Strings.deleteAccountConfirm:
            "Are you sure you want to delete your account from our records?",
        AT1Strings.deleteAccountDone: "Your account has been deleted",
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
        AT1Strings.successTitleDesc: 'تمت العملية بنجاح',
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
        AT1Strings.slideThreeContent:
            'سهولة الوصول إلى كافة التفاصيل المتعلقة بالسياحة العلاجية بعدة لغات',

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
        AT1Strings.signUpRegisterBy: 'رمز/رابط الوكيل الخاص بك (إن وجد)',

        //Forget Password
        AT1Strings.forgetPass: 'نسيت كلمة المرور؟',
        AT1Strings.forgetPassToReset:
            'لإعادة تعيين كلمة المرور الخاصة بك ، تحتاج إلى بريدك الإلكتروني أو رقم هاتفك المحمول الذي يمكن المصادقة عليه',
        AT1Strings.forgetPassReset: 'إعادة تعيين كلمة المرور',

        //Check Mail
        AT1Strings.CheckMail: 'افحص البريد الإلكتروني الخاص بك',
        AT1Strings.CheckMailWeHaveSent:
            'لقد أرسلنا إعادة تعيين كلمة المرور إلى عنوان بريدك الإلكتروني',
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
        AT1Strings.ServiceThanksConsultation:
            'شكرًا لاستخدامك منصتنا ، ستتصل بك الاستشارات الطبية قريبًا!',

        //Service Request
        AT1Strings.ServiceRequest: 'طلب خدمة',
        AT1Strings.ServiceRequestSubmit: 'احصل على استشارة طبية مجانية',

        //Service Request Sent
        AT1Strings.ServiceRequestSent: 'تم إرسال طلب الخدمة',
        AT1Strings.ServiceRequestSentSuccess: 'تم الاستلام بنجاح',
        AT1Strings.ServiceRequestSentSuccessContent:
            'سيتم الاتصال بك من قبل مستشارنا الطبي في أقرب وقت ممكن',

        //Notifications
        AT1Strings.Notifications: 'إشعارات',
        AT1Strings.NotificationsStay: 'ابق على اتصال',
        AT1Strings.NotificationsNoContent: 'لا يوجد إشعارات حتى الآن',

        //Contact Us
        AT1Strings.ContactUS: 'تواصل معنا',
        AT1Strings.ContactUsSentSuccessfully: 'تم الإرسال بنجاح',
        AT1Strings.ContactUsSentSuccessfullyMsg:
            'شكرًا على تواصلك معنا ، سنتصل بك في أسرع وقت ممكن!',
        AT1Strings.ContactUsMsg: 'الرسالة',

        //Settings
        AT1Strings.settingsTitle: 'الإعدادات',
        AT1Strings.settingsLanguage: 'اللغة',
        AT1Strings.settingsSelectLanguage: 'إختر لغة التطبيق',
        AT1Strings.settingsTheme: 'المظهر',
        AT1Strings.settingsNotifications: 'الإشعارات',
        AT1Strings.settingsPrivacyPolicy: 'سياسة الخصوصية',
        AT1Strings.settingsTermsConditions: 'شروط الإستخدام',
        AT1Strings.settingsHelpSupport: 'المساعدة والدعم',
        AT1Strings.settingsAbout: 'من نحن',

        //Agent
        AT1Strings.agentTitle: 'الوكيل',
        AT1Strings.customersTitle: 'العملاء',
        AT1Strings.customersTitleDesc:
            'تُظهر هذه الصفحة عدد التحويلات الناجحة التي تم إنشاؤها بواسطة الكود الخاص بك',
        AT1Strings.agentCopy: 'انقر على الكود للنسخ',
        AT1Strings.agentLink: 'رمز الإحالة',
        AT1Strings.textcopied: 'تم نسخ النص إلى الحافظة',

        //Delete Account
        AT1Strings.deleteAccount: "حذف حسابك",
        AT1Strings.deleteAccountConfirm:
            "هل أنت متأكد أنك تريد حذف حسابك من سجلاتنا؟",
        AT1Strings.deleteAccountDone: "تم حذف حسابك"
      },
      'tr': {
        AT1Strings.langName: 'Türk',
        AT1Strings.Home: 'Anasayfa',
        AT1Strings.signIn: 'Giriş yap',
        AT1Strings.signUp: 'Kaydolmak',
        AT1Strings.skip: 'şimdilik atla',
        AT1Strings.backLogin: 'Oturum açmak için geri dön',
        AT1Strings.backHome: 'Ana Sayfaya Dön',
        AT1Strings.submit: 'sunmak',
        AT1Strings.confirm: 'Onaylamak',
        AT1Strings.alert: 'Uyarı',
        AT1Strings.dismiss: 'Kovmak',
        AT1Strings.Continue: 'Devam et',
        AT1Strings.done: 'Yapılı',
        AT1Strings.ok: 'Tamam',
        AT1Strings.freeConsultation: 'Ücretsiz Danışma',

        //Alert
        AT1Strings.successTitle: 'Başarı',
        AT1Strings.successTitleDesc: 'İstek başarıyla tamamlandı',
        AT1Strings.errorTitle: 'Hata',
        AT1Strings.warningTitle: 'Uyarı',

        //Menu
        AT1Strings.menuProfile: 'Profil',
        AT1Strings.menuWelcome: 'Merhaba, Hoş geldiniz',
        AT1Strings.menuSocialMedia: 'Sosyal Medya',
        AT1Strings.menuSettings: 'Ayarlar',
        AT1Strings.menuContactUs: 'bizimle iletişime geçin',
        AT1Strings.menuLogout: 'Çıkış',
        AT1Strings.menuLogoutConfirm: 'Oturumu Kapatmayı Onayladın mı?',
        AT1Strings.menuFollowYaaBaayApp: 'Bizi sosyal Medyadan takip edin',
        AT1Strings.facebook: 'Facebook',
        AT1Strings.twitter: 'Twitter',
        AT1Strings.instagram: 'Instagram',

        //Intro
        AT1Strings.slideOneTitle: 'DOSTÇA REHBERLİK',
        AT1Strings.slideOneContent:
            'Müşterileri aracılar olmadan doğrudan hastanelere bağlamak.',
        AT1Strings.slideTwoTitle: 'UYGUN FİYATLAR',
        AT1Strings.slideTwoContent:
            'Yüksek doğrulukta randevularda yüksek bağlılık.',
        AT1Strings.slideThreeTitle: 'NEYDEN OLURSAN OL',
        AT1Strings.slideThreeContent:
            'Sağlık turizmi ile ilgili tüm detaylara çeşitli dillerde kolay erişim',

        //About
        AT1Strings.aboutYaabaay: 'Yaabaay Hakkında',

        //Help Center
        AT1Strings.helpCenter: 'Yardım Merkezi',

        //Sign in
        AT1Strings.signInTitle: 'giriş yap',
        AT1Strings.signInEmail: 'E-posta adresi',
        AT1Strings.signInPassword: 'Şifre',
        AT1Strings.signInForgotPassword: 'Şifremi unuttum?',
        AT1Strings.signInDontHaveAccount: 'Henüz bir hesabınız yok mu?',

        //Sign up
        AT1Strings.signUpTitle: 'Kaydolmak',
        AT1Strings.signUpName: 'İsim',
        AT1Strings.signUpMobile: 'Mobil',
        AT1Strings.signUpByClicking:
            'Gönder\'i tıklatarak kabul etmiş olursunuz',
        AT1Strings.signUpAlreadyHaveAccount: 'Zaten hesabınız var',
        AT1Strings.signUpRegisterBy: 'Temsilci Kodunuz/Bağlantınız (varsa)',

        //Forget Password
        AT1Strings.forgetPass: 'Şifreyi unuttun mu?',
        AT1Strings.forgetPassToReset:
            'Parolanızı sıfırlamak için kimliği doğrulanabilen e-postanıza veya cep telefonu numaranıza ihtiyacınız vardır',
        AT1Strings.forgetPassReset: 'Şifreyi Sıfırla',

        //Check Mail
        AT1Strings.CheckMail: 'Postayı Kontrol Et',
        AT1Strings.CheckMailWeHaveSent:
            'Sıfırlama şifresini e-posta adresine gönderdik',
        AT1Strings.CheckMailOpenYourEmail: 'E-postanızı Açın',
        AT1Strings.CheckMailBackToLogin: 'Girişe geri dön',

        //Profile
        AT1Strings.Profile: 'Profil',
        AT1Strings.ProfileCustomer: 'Müşteri',
        AT1Strings.ProfileAgent: 'Satış Temsilcisi',
        AT1Strings.ProfileAdmin: 'GENEL MÜDÜR',
        AT1Strings.ProfileEdit: 'Profili Düzenle',

        //Service Single
        AT1Strings.Service: 'Hizmet',
        AT1Strings.ServiceAskConsultation:
            'Ücretsiz Tıbbi Konsültasyon İsteyin ?',
        AT1Strings.ServiceThanksConsultation:
            'Platformumuzu kullandığınız için teşekkür ederiz, Tıbbi Konsültasyon yakında sizinle iletişime geçecektir!',

        //Service Request
        AT1Strings.ServiceRequest: 'Servis Talebi',
        AT1Strings.ServiceRequestSubmit: 'ÜCRETSİZ tıbbi konsültasyon ALIN',

        //Service Request Sent
        AT1Strings.ServiceRequestSent: 'Başarıyla Gönderildi',
        AT1Strings.ServiceRequestSentSuccess: 'Başarıyla alındı',
        AT1Strings.ServiceRequestSentSuccessContent:
            'En kısa sürede sağlık danışmanımız sizinle iletişime geçecektir',

        //Notifications
        AT1Strings.Notifications: 'Bildirimler',
        AT1Strings.NotificationsStay: 'bizi izlemeye devam edin!',
        AT1Strings.NotificationsNoContent: 'Henüz Bildirim Yok',

        //Contact Us
        AT1Strings.ContactUS: 'bizimle iletişime geçin',
        AT1Strings.ContactUsSentSuccessfully: 'Başarıyla Gönderildi',
        AT1Strings.ContactUsSentSuccessfullyMsg:
            'Bizimle iletişime geçtiğiniz için teşekkürler, en kısa sürede sizinle iletişime geçeceğiz!',
        AT1Strings.ContactUsMsg: 'Mesaj',

        //Settings
        AT1Strings.settingsTitle: 'Ayarlar',
        AT1Strings.settingsLanguage: 'Dil',
        AT1Strings.settingsSelectLanguage: 'dilinizi seçin',
        AT1Strings.settingsTheme: 'Görünüm',
        AT1Strings.settingsNotifications: 'Bildirimler',
        AT1Strings.settingsPrivacyPolicy: 'Gizlilik ve Güvenlik',
        AT1Strings.settingsTermsConditions: 'Şartlar ve Koşullar',
        AT1Strings.settingsHelpSupport: 'Yardım ve Destek',
        AT1Strings.settingsAbout: 'Hakkında',

        //Agent
        AT1Strings.agentTitle: 'Acenta',
        AT1Strings.customersTitle: 'Müşteriler',
        AT1Strings.customersTitleDesc:
            'Bu sayfa, kodunuz tarafından oluşturulan başarılı dönüşüm sayısını gösterir',
        AT1Strings.agentCopy: 'Kodu kopyalamak için tıklayın',
        AT1Strings.agentLink: 'Yönlendirme Kodu',
        AT1Strings.textcopied: 'Metin panosuna kopyalandı',

        //Delete Account
        AT1Strings.deleteAccount: "Hesabınızı Sil",
        AT1Strings.deleteAccountConfirm:
            "Hesabınızı kayıtlarımızdan silmek istediğinizden emin misiniz?",
        AT1Strings.deleteAccountDone: "Hesabınız silindi"
      },
      'fr': {
        AT1Strings.langName: 'Français',
        AT1Strings.Home: 'Page d\'Accueil',
        AT1Strings.signIn: 'Se connecter',
        AT1Strings.signUp: 'S\'inscrire',
        AT1Strings.skip: 'passer pour l\'instant',
        AT1Strings.backLogin: 'Retour à la connexion',
        AT1Strings.backHome: 'Retour à l\'Accueil',
        AT1Strings.submit: 'Soumettre',
        AT1Strings.confirm: 'Confirmer',
        AT1Strings.alert: 'Alerte',
        AT1Strings.dismiss: 'Rejeter',
        AT1Strings.Continue: 'Continuer',
        AT1Strings.done: 'Fait',
        AT1Strings.ok: 'D\'Accord',
        AT1Strings.freeConsultation: 'Consultation Gratuite',

        //Alert
        AT1Strings.successTitle: 'Succès',
        AT1Strings.successTitleDesc: 'Requête effectuée avec succès',
        AT1Strings.errorTitle: 'Erreur',
        AT1Strings.warningTitle: 'Avertissement',

        //Menu
        AT1Strings.menuProfile: 'Profil',
        AT1Strings.menuWelcome: 'Salut, Bienvenue',
        AT1Strings.menuSocialMedia: 'Médias sociaux',
        AT1Strings.menuSettings: 'Paramètres',
        AT1Strings.menuContactUs: 'Contactez-Nous',
        AT1Strings.menuLogout: 'Déconnexion',
        AT1Strings.menuLogoutConfirm: 'Confirmer la déconnexion ?',
        AT1Strings.menuFollowYaaBaayApp: 'Suivez-nous sur les réseaux sociaux',
        AT1Strings.facebook: 'Facebook',
        AT1Strings.twitter: 'Twitter',
        AT1Strings.instagram: 'Instagram',

        //Intro
        AT1Strings.slideOneTitle: 'CONSEILS AMICAUX',
        AT1Strings.slideOneContent:
            'Connecter les clients directement avec les hôpitaux sans intermédiaires.',
        AT1Strings.slideTwoTitle: 'TARIFS ABORDABLES',
        AT1Strings.slideTwoContent:
            'Engagement élevé dans les rendez - vous avec une grande précision.',
        AT1Strings.slideThreeTitle: 'PEU IMPORTE DE QUOI TU VIENS',
        AT1Strings.slideThreeContent:
            'Accès facile à tous les détails liés au tourisme médical en plusieurs langues',

        //About
        AT1Strings.aboutYaabaay: 'À propos de Yaabay',

        //Help Center
        AT1Strings.helpCenter: 'Centre d\'Aide',

        //Sign in
        AT1Strings.signInTitle: 'Se Connecter',
        AT1Strings.signInEmail: 'Adresse e-mail',
        AT1Strings.signInPassword: 'Mot de Passe',
        AT1Strings.signInForgotPassword: 'Mot de passe oublié ?',
        AT1Strings.signInDontHaveAccount: 'Vous n\'avez pas encore de compte?',
        AT1Strings.signUpRegisterBy: 'Votre code/lien d\'agent (si existant)',

        //Sign up
        AT1Strings.signUpTitle: 'S\'inscrire',
        AT1Strings.signUpName: 'Nom',
        AT1Strings.signUpMobile: 'Mobiles',
        AT1Strings.signUpByClicking:
            'En cliquant sur soumettre, vous acceptez le',
        AT1Strings.signUpAlreadyHaveAccount: 'Vous avez déjà un compte',

        //Forget Password
        AT1Strings.forgetPass: 'Mot de passe Oublié ?',
        AT1Strings.forgetPassToReset:
            'Pour réinitialiser votre mot de passe, vous avez besoin de votre adresse e-mail ou de votre numéro de téléphone portable qui peut être authentifié',
        AT1Strings.forgetPassReset: 'Réinitialiser Le Mot de Passe',

        //Check Mail
        AT1Strings.CheckMail: 'Vérifier le Courrier',
        AT1Strings.CheckMailWeHaveSent:
            'Nous avons envoyé le mot de passe de réinitialisation à l\'adresse e-mail',
        AT1Strings.CheckMailOpenYourEmail: 'Ouvrez Votre E-Mail',
        AT1Strings.CheckMailBackToLogin: 'Retour à la connexion',

        //Profile
        AT1Strings.Profile: 'Profil',
        AT1Strings.ProfileCustomer: 'Client',
        AT1Strings.ProfileAgent: 'Agent de Vente',
        AT1Strings.ProfileAdmin: 'PDG',
        AT1Strings.ProfileEdit: 'Modifier le Profil',

        //Service Single
        AT1Strings.Service: 'Le Service',
        AT1Strings.ServiceAskConsultation:
            'Demander Une Consultation Médicale Gratuite ?',
        AT1Strings.ServiceThanksConsultation:
            'Merci d\'utiliser notre plateforme, une consultation médicale vous contactera bientôt!',

        //Service Request
        AT1Strings.ServiceRequest: 'Demande de Service',
        AT1Strings.ServiceRequestSubmit:
            'OBTENEZ UNE CONSULTATION MÉDICALE GRATUITE',

        //Service Request Sent
        AT1Strings.ServiceRequestSent: 'Envoyé Avec Succès',
        AT1Strings.ServiceRequestSentSuccess: 'Reçu avec succès',
        AT1Strings.ServiceRequestSentSuccessContent:
            'Vous serez contacté par notre conseiller médical dès que possible',

        //Notifications
        AT1Strings.Notifications: 'Notifications',
        AT1Strings.NotificationsStay: 'Restez à l\'écoute!',
        AT1Strings.NotificationsNoContent:
            'Aucune Notification Jusqu\'À Présent',

        //Contact Us
        AT1Strings.ContactUS: 'Contactez-Nous',
        AT1Strings.ContactUsSentSuccessfully: 'Envoyé Avec Succès',
        AT1Strings.ContactUsSentSuccessfullyMsg:
            'Merci de nous avoir contacté, nous vous contacterons DÈS QUE POSSIBLE!',
        AT1Strings.ContactUsMsg: 'Message',

        //Settings
        AT1Strings.settingsTitle: 'Paramètres',
        AT1Strings.settingsLanguage: 'Langue',
        AT1Strings.settingsSelectLanguage: 'sélectionnez votre langue',
        AT1Strings.settingsTheme: 'Apparence',
        AT1Strings.settingsNotifications: 'Notifications',
        AT1Strings.settingsPrivacyPolicy: 'Confidentialité et Sécurité',
        AT1Strings.settingsTermsConditions: 'Termes et Conditions',
        AT1Strings.settingsHelpSupport: 'Aide et Soutien',
        AT1Strings.settingsAbout: 'Au sujet',

        //Agent
        AT1Strings.agentTitle: 'Agent',
        AT1Strings.customersTitle: 'Clients',
        AT1Strings.customersTitleDesc:
            "Cette page montre le nombre de conversions réussies générées par votre code",
        AT1Strings.agentCopy: 'Cliquez sur le code pour copier',
        AT1Strings.agentLink: 'Code de Parrainage',
        AT1Strings.textcopied: 'Texte copié dans le presse-papiers',

        //Delete Account
        AT1Strings.deleteAccount: "Supprimer votre compte",
        AT1Strings.deleteAccountConfirm:
            "Êtes-vous sûr de vouloir supprimer votre compte de nos enregistrements ?",
        AT1Strings.deleteAccountDone: "Votre compte a été supprimé"
      },
    };
  }
}
