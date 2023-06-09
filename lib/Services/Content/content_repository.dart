import 'dart:convert';

import 'package:app/DTOs/Shared/contact_us.dart';
import 'package:app/Models/Authentication/user.dart';
import 'package:app/Models/Service/ServiceOrder.dart';
import 'package:app/Models/Service/ServicesData.dart';
import 'package:app/Models/Shared/contact_us.dart';
import 'package:app/Models/Shared/faqs.dart';
import 'package:app/Models/Shared/settings.dart';
import 'package:app/Models/Shared/slider_data.dart';
import 'package:app/Utilities/logger.dart';

import '../../DTOs/Service/service_order.dart';
import '../../Enums/Shared/keys.dart';
import 'content_service.dart';

import '/Models/Shared/message_exception.dart';

class ContentRepository {
  late ContentService _contentService;

  ContentRepository() {
    _contentService = ContentService.create();
  }

  Future<SettingsModel> getSettings() async {
    final response = await _contentService.getSettings();
    Debug.d(response.body[Keys.dataKey]);
    try {
      final settings = SettingsModel.fromJson(response.body[Keys.dataKey]);
      return settings;
    } catch (error) {
      Debug.d(error);
      throw MessageException(response.error.toString());
    }
  }

  Future<List<ServicesData>> getAllServices() async {
    final response = await _contentService.getAllServices();
    //Debug.d(response.body[Keys.dataKey]);
    try {
      final services =
          servicesDataFromJson(json.encode(response.body[Keys.dataKey]));
      return services;
    } catch (error) {
      Debug.d(error);
      throw MessageException(response.error.toString());
    }
  }

  Future<SliderData> getSliders() async {
    final response = await _contentService.getSliders();
    Debug.d(response.body);
    try {
      final sliders = SliderData.fromJson(response.body);
      return sliders;
    } catch (error) {
      Debug.d(error);
      throw MessageException(response.error.toString());
    }
  }

  Future<User> serviceOrderCreateGuest(ServiceOrderDTO dto) async {
    final body = dto.toJson();
    Debug.d(body);
    final response = await _contentService.serviceOrderCreateGuest(body);
    Debug.d(response);
    try {
      final user = User.fromJson(response.body[Keys.userKey]);
      return user;
    } catch (error) {
      throw MessageException(response.error.toString());
    }
  }

  Future<ServiceOrder> serviceOrderCreateUser(ServiceOrderDTO dto) async {
    final body = dto.toJson();
    Debug.d(body);
    final response = await _contentService.serviceOrderCreateUser(body);
    try {
      final order = ServiceOrder.fromJson(response.body[Keys.orderKey]);
      Debug.d(order.toJson());
      return order;
    } catch (error) {
      throw MessageException(response.error.toString());
    }
  }

  Future<ContactModel> sendContactUs(ContactUsDTO dto) async {
    final body = dto.toJson();
    Debug.d(body);
    final response = await _contentService.sendContactUs(body);
    try {
      final result = ContactModel.fromJson(response.body[Keys.dataKey]);
      Debug.d(result.toJson());
      return result;
    } catch (error) {
      throw MessageException(response.error.toString());
    }
  }

  Future<List<FaqsModel>> getFaqs() async {
    final response = await _contentService.getFaqs();
    Debug.d(response.body);
    try {
      final faqs = faqsDataFromJson(json.encode(response.body[Keys.dataKey]));
      return faqs;
    } catch (error) {
      Debug.d(error);
      throw MessageException(response.error.toString());
    }
  }
}
