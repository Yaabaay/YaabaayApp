import 'package:app/DTOs/Service/service_order.dart';
import 'package:app/DTOs/Shared/contact_us.dart';
import 'package:app/Enums/Shared/keys.dart';
import 'package:app/Models/Service/ServicesData.dart';
import 'package:app/Models/Shared/faqs.dart';
import 'package:app/Models/Shared/settings.dart';

import 'package:app/Screens/Shared/splash.dart';
import 'package:app/Services/Content/content_repository.dart';
import 'package:app/Theme/app_theme.dart';
import 'package:app/Utilities/assets.dart';
import 'package:app/Utilities/logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../Enums/Shared/storage_keys.dart';
import '../Models/Authentication/user.dart';
import '../Models/Shared/slider_data.dart';

class AppController extends GetxController {

  late ContentRepository _repository;
  late GetStorage _storage;

  AppController() {
    _repository = ContentRepository();
    _storage = GetStorage();
  }

  var countryCode = "TR".obs;
  var dialCode = "90".obs;
  var selectedIndex = 0.obs;
  var lang = "en".obs;

  Rx<SettingsModel?> settings = (null as SettingsModel?).obs;

  RxList<SliderItem> sliderItems = <SliderItem>[].obs;
  RxList<ServicesData> servicesItems = <ServicesData>[].obs;

  Future<void> saveThemeMode(String themeMode) async {
    return _storage.write(StorageKeys.theme, themeMode);
  }

  Future<void> saveLanguage(String languageCode) async {
    return _storage.write(StorageKeys.language, languageCode);
  }

  Future<void> setLanguage() async {
    try{
      final locale = Get.locale;
      final currentLanguage = await _storage.read(StorageKeys.language);
      Debug.d(locale?.languageCode);
      Debug.d(currentLanguage);
      if( currentLanguage == null ) return;
      if (locale?.languageCode != currentLanguage){
        Get.updateLocale( Locale(currentLanguage) );
      }
    }catch(e){}
  }

  Future<void> saveIntro(bool complete) async {
    return _storage.write(StorageKeys.intro, complete);
  }

  Future<void> getSettings() async {
    Debug.d('getSettings work');
    try {
      final response = await _repository.getSettings();
      settings.value = response;
      Debug.d('Settings after set value ${settings.value}');
    } catch (error) {}
  }

  Future<bool> getIntro() async {
    try {
      final skipIntro = await _storage.read(StorageKeys.intro);
      Debug.d('skip intro $skipIntro');
      if (skipIntro == null) return false;
      return skipIntro;
    } catch (error) {
      Debug.e(error);
      return false;
    }
  }

  Future<void> getSliders() async {
    Debug.d('getSliders work');
    try {
      final message = await _repository.getSliders();
      Debug.d(message.data);
      sliderItems.value = message.data!;
    } catch (error) {
      rethrow;
    }
  }

  Future<void> getAllServices() async {
    Debug.d('getAllServices work');
    try {
      final services = await _repository.getAllServices();
      Debug.d(services);
      servicesItems.value = services;
    } catch (error) {
      rethrow;
    }
  }

  Future<void> sendServiceGuestOrder(ServiceOrderDTO serviceOrderDTO) async {
    Debug.d('getAllServices work');
    try {
      await _repository.serviceOrderCreateGuest(serviceOrderDTO);
    } catch (error) {
      rethrow;
    }
  }

  Future<bool> sendServiceUserOrder(ServiceOrderDTO serviceOrderDTO) async {
    Debug.d('getAllServices work');
    try {
      await _repository.serviceOrderCreateUser(serviceOrderDTO);
      return true;
    } catch (error) {
      rethrow;
    }
  }

  Future<void> sendContactUs(ContactUsDTO contactUsDTO) async {
    Debug.d('sendContactUs work');
    try {
      await _repository.sendContactUs(contactUsDTO);
    } catch (error) {
      rethrow;
    }
  }

  Future<List<FaqsModel>> getFaqs() async {
    Debug.d('getFaqs work');
    try {
      return await _repository.getFaqs();
    } catch (error) {
      rethrow;
    }
  }

}
