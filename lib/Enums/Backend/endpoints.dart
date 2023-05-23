import 'urls.dart';

abstract class Endpoints {
  //auth
  static const signUp = '${Urls.auth}signUp';
  static const signIn = '${Urls.auth}signIn';
  static const refreshToken = '${Urls.auth}refreshToken';

  //user
  static const requestRetrieveUserPassword = '${Urls.user}requestRetrieveUserPassword';
  static const pushNotificationToken = '${Urls.user}pushNotificationToken';

  static const setNewUserPassword = '${Urls.user}setNewUserPassword';
  static const updateUserPassword = '${Urls.user}updateUserPassword';

  static const requestChangeUserEmail = '${Urls.user}requestChangeUserEmail';
  static const changeUserEmail = '${Urls.user}changeUserEmail';

  static const requestEmailActivation = '${Urls.user}requestEmailActivation';
  static const activateEmail = '${Urls.user}activateEmail';

  static const changeProfile = '${Urls.user}changeProfile';

  //categories
  static const getAllServices = Urls.categories;

  //content
  static const sendContactUs = '${Urls.contactUs}create';
  static const sliders = '${Urls.content}getAllIntros';
  static const settings = '${Urls.content}getAllSettings';
  static const faqs = '${Urls.content}getFAQs';

  //order
  static const serviceOrderCreateUser = '${Urls.categoriesOrder}createUser';
  static const serviceOrderCreateGuest = '${Urls.categoriesOrder}createGuest';


}