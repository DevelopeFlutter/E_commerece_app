class Images {
  static const String logo = "assets/logos/logo.png";
  static String get arrowBack => 'arrow_back'.svg;
  static String get arrowForward => 'arrow_forward'.svg;
  static String get google => 'google'.svg;
  static String get facebook => 'facebook'.svg;
  static String get appleLogo => 'apple_logo'.svg;
  static String get phoneLogin => 'phone_login'.svg;
  static String get emptyCart => 'empty_cart'.svg;
  static String get noInternet => 'nointernet'.svg;
  static String get campaignShopArrow => 'campaign_shop_arrow'.svg;
  static String get cart => 'cart'.svg;
  static String get exit => 'exit'.svg;
  static String get notification => 'notification'.svg;
  static String get menuBar => 'menu_bar'.svg;
  static String get searchBar => 'search_bar'.svg;
  static String get comment => 'comment'.svg;
  static String get confirm => 'confirm'.svg;
  static String get detailsCallButton => 'details_call_button'.svg;
  static String get videoBackButton => 'video_back_button'.svg;
  static String get more => 'more'.svg;
  static String get subMenu => 'sub_menu'.svg;
  static String get email => 'email'.svg;
  static String get like => 'like'.svg;
  static String get linkedin => 'linkedin'.svg;
  static String get iIcon => 'i_icon'.svg;

  static String get heartOn => 'heart_on'.svg;
  static String get heartOff => 'heart_off'.svg;
  static String get dUser => 'd_user'.svg;
  static String get bell => 'bell'.svg;
  static String get bxCamera => 'bx_camera'.svg;
  static String get shoppingBag => 'shopping_bag'.svg;
  static String get notificationProfile => 'notification_profile'.svg;
  static String get twitter => 'twitter'.svg;

  static String get whatsappLogo => 'whatsapp_logo'.svg;
  static String get category => 'category'.svg;
  static String get playVideo => 'play_video'.svg;
  static String get locationProfileWl => 'location_profile_wl'.svg;
  static String get settings => 'settings'.svg;
  static String get ratingIcon => 'rating_icon'.svg;

}

extension on String {
  String get svg => 'assets/icons/$this.svg';
}