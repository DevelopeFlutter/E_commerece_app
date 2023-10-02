import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppThemeData {
  //splash screen
  static const Color splashScreenColor = Color(0xffFFFDF5);
  //home
  static const Color homeAppBarColor = Color(0xffFCB800);
  //button Color
  static const Color buttonColor = Color(0xff333333);
  static const Color buttonTextColor = Color(0xffFFFFFF);
  static const Color buttonShadowColor = Color(0xff333333);
  static const Color okButton = Color(0xFF6DBEA3);
  static const Color cancelButton = Color(0xFFD16D86);
  static const Color socialButtonColor = Color(0xffF7F7F7);

  // textColor Code
  static const Color headlineTextColor = Color(0xff333333);
  static const Color descriptionTextColor = Color(0xff666666);
  static const Color iconColor = Color(0xff666666);
  static const Color textFieldTextColor = Color(0xff999999);
  static const Color textFieldSuffixIconColor = Color(0xff999999);
  static const Color searchIconColor = Color(0xff999999);
  static const Color categoryColor = Color(0xffF3F3F3);
  static const Color categoryColors = Color(0xffF4F4F4);

  //color configuration
  static const Color darkBackgroundColor = Color(0xff13112A);
  static const Color darkBackgroundColor2 = Colors.transparent;
  static const Color lightBackgroundColor = Color(0xffffffff);
  static const Color darkToggleColor = Color(0xffACBBDF);
  static const Color darkSwitchColor = Color(0xff1F1C34);
  static const Color darkSwitchColor2 = Color(0xff45c17d);
  static const Color lightSwitchColor = Color(0xFFDBDBDB);
  static const Color progressIndicatorColor = Colors.blue;
  static const Color darkBackgroundBottomNavColor = Color(0xFF1F1C34);
  static const Color dividerColor = Color(0xFFF3F3F3);


  static const Color drawerBoxColor = Color(0xff1E2836);
  static const Color drawerIconColor = Color(0xff666666);
  //invoice
  static const Color invoiceDividerColor = Color(0xFFEEEEEE);



  //product
  static const Color boxShadowColor = Color(0xff404040);
  static const Color productBoxDecorationColor = Color(0xFFF51E46);
  static const Color productBannerColor = Color(0xFFFAB75A);
  static const Color productContentColor = Color(0xFFF3F3F3);
  static const Color productContentBoxColor = Color(0xffDBE8C2);
  static const Color campaignBoxColor = Color(0xff333333);

  //Cart Item
  static const Color cartItemBoxDecorationColor = Color(0xffFFFFFF);
  static const Color cartItemIconColor = Color(0xff333333);


  //status bar color
  static const Color statusBarLight = Colors.white;
  static const Color statusBarDark = Colors.black;

  //order history
  static const orderHistoryColor = Color(0xff6DBEA3);
  static const orderHistoryBoxColor = Color(0xff6DBEA3);
  static const orderHistoryMainBoxColor = Color(0xffFFFFFF);

  //Font size
  static const double smallTextSize = 12.0;
  static const double normalTextSize = 16.0;
  static const double mediumTextSize = 18.0;
  static const double largeTextSize = 22.0;
  static const double extraLargeTextSize = 24.0;
  //text color
  static const textColorDark = Color(0xFFD3DDF6);
  static const textColorLight = Color(0xFF000000);

  //intro btn color
  static const introBtnColorDark = Color(0xff1F1C34);
  static const introBtnColorLight = Color(0x605C5E61);
  //divider color
  static const dividerColorDark = Color(0xFF99A5C5);
  static const dividerColorLight = Color(0xFFDBDBDB);
  //category color
  static const categoryColorDark = Color(0xFF99A5C5);
  static const categoryColorLight = Color(0x70111029);
  static const productCategoryBorderColor = Color(0xFFEEEEEE);
  //socialIcon color
  static const socialIconColorDark = Color(0xFF99A5C5);
  static const socialIconColorLight = Color(0xFF111029);
  //card background color
  static const cardBackgroundColorDark = Color(0xff1F1C34);
  static const cardBackgroundColorLight = Colors.white;
  //details screen color
  static const Color borderColor = Color(0xff808080);
  static const Color borderSideColor = Color(0xfff4f4f4);
  static const Color detailsIconColor = Color(0xff999999);
  static const colorWhite=0xffffffff;
  static const colorBlack=0xff808080;
  //tracking order
  static const Color actColor = Color(0xff21CC26);
  static Color inActColor = const Color(0xff21CC26).withOpacity(0.3);
  static const Color bgColor = Color(0xffFAFAFA);
  static const Color dashedLineConnectorColor = Color(0xFF6DBEA3);
  static Color trackingSelectorColor = const Color(0xff6DBEA3);
  static Color trackingUnSelectorColor = const Color(0xff6DBEA3).withOpacity(0.3);

  //my reward, my download and wallet
  static const Color myRewardAppBarColor = Color(0xffF8F8F8);
  static const Color walletBoxBorderColors = Color(0xffF4F4F4);
  static const Color walletBoxColors = Color(0xff56A8C7);
  static const Color awesomeDialogColors = Color(0xff333333);

  //loader color
  static const Color loaderColor = Color(0xffFAB75A);

  //settingScreen
  static const Color settingScreenDividerColor = Color(0xffD8D8D8);

  //Address
  static const Color addressBoxBorderColor = Color(0xffF4F4F4);
  //multiple Color
  static const List voucherMultipleColor = [
    Color(0xFF6DBEA3),
    Color(0xFFFAB75A),
    Color(0xFF4179E0),
    Color(0xFFD16D86),
    Color(0xFF56A8C7),
  ];
  static const List trackingMultipleColor = [
    Color(0xFFFAB75A),
    Color(0xFF4179E0),
    Color(0xFFD16D86),
    Color(0xFF56A8C7),
    Color(0xFF6DBEA3),
  ];
  static const List walletMultipleColor = [
    Color(0xFFD16D86),
    Color(0xFF6DBEA3),
  ];
  static const List homeMultipleColor = [
    Color(0xFF6DBEA3),
    Color(0xFFFAB75A),
    Color(0xFF4179E0),
    Color(0xFFD16D86),
    Color(0xFF56A8C7),
  ];

  //padding
  static const double wholeScreenPadding = 8.0;
  static const double normalPadding = 8.0;
  //card border radius
  static const double cardBorderRadius = 8.0;
  static const double cardElevation = 2.0;
  static const double editTextBlurRadius = 2.0;
  static final shadowColor = Colors.grey.withOpacity(0.65);
  static const double newsCardHeight = 120.0;

  // text style
  static final seccessfulPayTextStyle_18 = TextStyle(
      color: const Color(0xff333333),
      fontFamily: "Poppins Medium",
      fontSize: 18.sp);
  static final welComeTextStyle_24 = TextStyle(
      color: const Color(0xff333333),
      fontFamily: "Poppins Medium",
      fontSize: 24.sp);
  static final timeDateTextStyle_12 = TextStyle(
      color: const Color(0xffFFFFFF), fontFamily: "Poppins", fontSize: 12.sp);
  static final timeDateTextStyleTab = TextStyle(
      color: const Color(0xffFFFFFF), fontFamily: "Poppins", fontSize: 9.sp);
  static final timeDateTextStyle_13 = TextStyle(
      color: const Color(0xffF51E46),
      fontFamily: "Poppins Medium",
      fontSize: 13.sp);
  static final timeDateTextStyle_10Tab = TextStyle(
      color: const Color(0xffF51E46),
      fontFamily: "Poppins Medium",
      fontSize: 10.sp);
  static final orderHistoryTextStyle_12 = TextStyle(
      color: const Color(0xff333333), fontFamily: "Poppins", fontSize: 12.sp);
  static final orderHistoryTextStyle_9Tab = TextStyle(
      color: const Color(0xff333333), fontFamily: "Poppins", fontSize: 9.sp);
  static final orderHistoryPDFTextStyle_13 = TextStyle(
      color: const Color(0xffF15642), fontFamily: "Poppins", fontSize: 13.sp);
  static final orderHistoryPDFTextStyleTab = TextStyle(
      color: const Color(0xffF15642), fontFamily: "Poppins", fontSize: 10.sp);
  static final orderHistoryStatusTextStyle_13 = TextStyle(
      color: const Color(0xff56A8C7), fontFamily: "Poppins", fontSize: 13.sp);
  static final orderHistoryStatusTextStyle_10Tab = TextStyle(
      color: const Color(0xff56A8C7), fontFamily: "Poppins", fontSize: 10.sp);

  static final stepTextStyle_12 =
      TextStyle(fontFamily: "Poppins", fontSize: 12.sp);
  static final headerTextStyle_16reg =
      TextStyle(fontFamily: "Poppins", fontSize: 16.sp);
  static final timeDateTextStyle_11 = TextStyle(
      color: const Color(0xffFFFFFF), fontFamily: "Poppins", fontSize: 11.sp);
  static final timeDateTextStyle_10 = TextStyle(
      color: const Color(0xffF51E46), fontFamily: "Poppins", fontSize: 10.sp);
  static final timeDateTextStyle_8Tab = TextStyle(
      color: const Color(0xffF51E46), fontFamily: "Poppins", fontSize: 10.sp);
  static final addressDefaultTextStyle_10 = TextStyle(
      color: const Color(0xff666666), fontFamily: "Poppins", fontSize: 10.sp);
  static final priceVideoTextStyle_14 = TextStyle(
      color: const Color(0xffF51E46), fontFamily: "Poppins Medium", fontSize: 14.sp);
  static final headerTextStyle = TextStyle(
      color: const Color(0xff333333),
      fontFamily: "Poppins Medium",
      fontSize: 16.sp);
  static final headerTextStyleTab = TextStyle(
      color: const Color(0xff333333),
      fontFamily: "Poppins Medium",
      fontSize: 13.sp);
  static final addAddressTextStyle = TextStyle(
      color: const Color(0xff999999),
      fontFamily: "Poppins Medium",
      fontSize: 13.sp);
  static final headerTextStyle_16 = TextStyle(
    color: const Color(0xFF333333),
    fontFamily: "Poppins Medium",
    fontSize: 16.sp,
  );
  static final headerPhoneTextStyle_16 = TextStyle(
      color: const Color(0xff333333), fontFamily: "Poppins", fontSize: 16.sp);
  static final headerTextStyle_14 = TextStyle(
      color: const Color(0xff333333),
      fontFamily: "Poppins Medium",
      fontSize: 14.sp);
  static final voucherTitle = TextStyle(
      color: const Color(0xff333333), fontFamily: "Poppins", fontSize: 14.sp);
  static final titleTextStyle_13 = TextStyle(
    color: const Color(0xff333333),
    fontFamily: "Poppins",
    fontSize: 13.sp,
  );
  static final titleTextStyleTab = TextStyle(
    color: const Color(0xff333333),
    fontFamily: "Poppins",
    fontSize: 10.sp,
  );
  static final profileTextStyle_13 = TextStyle(
      color: const Color(0xff666666), fontFamily: "Poppins", fontSize: 13.sp);
  static final profileTextStyle_10Tab = TextStyle(
      color: const Color(0xff666666), fontFamily: "Poppins", fontSize: 10.sp);
  static final favoriteTextStyle_14 = TextStyle(
      color: const Color(0xff666666), fontFamily: "Poppins", fontSize: 14.sp);
  static final paymentTypeTextStyle_13 = TextStyle(
      color: const Color(0xff56A8C7), fontFamily: "Poppins", fontSize: 13.sp);
  static final paymentTypeTextStyle_12 = TextStyle(
      color: const Color(0xff56A8C7), fontFamily: "Poppins", fontSize: 12.sp);
  static final paymentStatusTextStyle_13 = TextStyle(
      color: const Color(0xff6DBEA3), fontFamily: "Poppins", fontSize: 13.sp);
  static final walletTextStyle_12 = TextStyle(
      color: const Color(0xff666666), fontFamily: "Poppins", fontSize: 12.sp);
  static final walletTextStyle_10Tab = TextStyle(
      color: const Color(0xff666666), fontFamily: "Poppins", fontSize: 10.sp);
  static final addLocationTextStyle_13 = TextStyle(
      color: const Color(0xff0EA5DE), fontFamily: "Poppins", fontSize: 13.sp);
  static final addAddressTextStyle_13 = TextStyle(
      color: const Color(0xff56A8C7), fontFamily: "Poppins", fontSize: 13.sp);
  static final addAddressTextStyle_10Tab = TextStyle(
      color: const Color(0xff56A8C7), fontFamily: "Poppins", fontSize: 10.sp);
  static final hintTextStyle_13 = TextStyle(
      color: const Color(0xff999999), fontFamily: "Poppins", fontSize: 13.sp);
  static final hintTextStyle_10Tab = TextStyle(
      color: const Color(0xff999999), fontFamily: "Poppins", fontSize: 10.sp);
  static final writeReviewTextStyle_13 = TextStyle(
      color: const Color(0xff0EA5DE),
      fontFamily: "Poppins",
      fontSize: 13.sp,
      decoration: TextDecoration.underline);
  static final hintSkipTextStyle_15 = TextStyle(
      color: const Color(0xff999999), fontFamily: "Poppins", fontSize: 15.sp);
  static final qsTextStyle_12 = TextStyle(
      color: const Color(0xff333333), fontFamily: "Poppins", fontSize: 12.sp);
  static final qsTextStyle_9Tab = TextStyle(
      color: const Color(0xff333333), fontFamily: "Poppins", fontSize: 9.sp);
  static final qsboldTextStyle_12 = TextStyle(
      color: const Color(0xff333333),
      fontFamily: "Poppins Medium",
      fontSize: 12.sp);
  static final whyUsTextStyle_13 = TextStyle(
      color: const Color(0xff333333),
      fontFamily: "Poppins Medium",
      fontSize: 13.sp);
  static final whyUsTextStyle_10Tab = TextStyle(
      color: const Color(0xff333333),
      fontFamily: "Poppins Medium",
      fontSize: 10.sp);
  static final priceTextStyle_13 = TextStyle(
      color: const Color(0xffC9151B),
      fontFamily: "Poppins Medium",
      fontSize: 13.sp);
  static final titleTextStyle_14 = TextStyle(
    color: const Color(0xff333333),
    fontFamily: "Poppins Medium",
    fontSize: 14.sp,
    overflow: TextOverflow.clip,
  );
  static final titleTextStyle_11Tab = TextStyle(
    color: const Color(0xff333333),
    fontFamily: "Poppins Medium",
    fontSize: 11.sp,
    overflow: TextOverflow.clip,
  );
  static final categoryTitleTextStyle_14 = TextStyle(
    color: const Color(0xff333333),
    fontFamily: "Poppins Medium",
    fontSize: 14.sp,
    overflow: TextOverflow.clip,
  );
  static final categoryTitleTextStyleTab = TextStyle(
    color: const Color(0xff333333),
    fontFamily: "Poppins Medium",
    fontSize: 12.sp,
    overflow: TextOverflow.clip,
  );
  static final buttonDltTextStyle_13 = TextStyle(
    color: const Color(0xffD16D86),
    fontFamily: "Poppins",
    fontSize: 13.sp,
    overflow: TextOverflow.clip,
  );
  static final buttonDltTextStyle_10Tab = TextStyle(
    color: const Color(0xffD16D86),
    fontFamily: "Poppins",
    fontSize: 10.sp,
    overflow: TextOverflow.clip,
  );
  static final buttonDltTextStyle_12 = TextStyle(
    color: const Color(0xffD16D86),
    fontFamily: "Poppins",
    fontSize: 13.sp,
    overflow: TextOverflow.clip,
  );
  static final balanceTextStyle_16 = TextStyle(
    color: const Color(0xffD16D86),
    fontFamily: "Poppins",
    fontSize: 16.sp,
    overflow: TextOverflow.clip,
  );
  static final buttonTextStyle_13 = TextStyle(
    color: const Color(0xff56A8C7),
    fontFamily: "Poppins",
    fontSize: 13.sp,
    overflow: TextOverflow.clip,
  );
  static final buttonTextStyle_10Tab = TextStyle(
    color: const Color(0xff56A8C7),
    fontFamily: "Poppins",
    fontSize: 10.sp,
    overflow: TextOverflow.clip,
  );
  static final labelTextStyle_16 = TextStyle(
    color: const Color(0xff333333),
    fontFamily: "Poppins Medium",
    fontSize: 16.sp,
  );
  static final labelTextStyle_12tab = TextStyle(
    color: const Color(0xff333333),
    fontFamily: "Poppins Medium",
    fontSize: 12.sp,
  );
  static final priceTextStyle_14 = TextStyle(
      color: const Color(0xff333333),
      fontFamily: "Poppins Medium",
      fontSize: 14.sp);
  static final buttonTextStyle_14 = TextStyle(
      color: buttonTextColor, fontFamily: "Poppins Medium", fontSize: 14.sp);
  static final buttonTextStyle_11Tab = TextStyle(
      color: buttonTextColor, fontFamily: "Poppins Medium", fontSize: 11.sp);
  static final buttonTextStyle_14Reg = TextStyle(
      color: const Color(0xff000000), fontFamily: "Poppins", fontSize: 14.sp);
  static final buttonTextStyleTab = TextStyle(
      color: const Color(0xff000000), fontFamily: "Poppins", fontSize: 10.sp);
  static final cardButtonTextStyle_14 = TextStyle(
      color: const Color(0xffFFFFFF), fontFamily: "Poppins", fontSize: 14.sp);
  static final categoryTitleTextStyle_12 = TextStyle(
      color: const Color(0xff333333), fontFamily: "Poppins", fontSize: 12.sp);
  static final categoryTitleTextStyle_9Tab = TextStyle(
      color: const Color(0xff333333), fontFamily: "Poppins", fontSize: 9.sp);
  static final categoryTextStyle_14 = TextStyle(
      color: const Color(0xff333333), fontFamily: "Poppins", fontSize: 14.sp);
  static final forgotTextStyle_12 = TextStyle(
      color: const Color(0xffF65858), fontFamily: "Poppins", fontSize: 12.sp);
  static final reatingTextStyle_12 = TextStyle(
      color: const Color(0xff333333), fontFamily: "Poppins", fontSize: 12.sp);
  static final backToHomeTextStyle_12 = TextStyle(
      color: const Color(0xff333333), fontFamily: "Poppins", fontSize: 12.sp);
  static final dateTextStyle_12 = TextStyle(
      color: const Color(0xff999999), fontFamily: "Poppins", fontSize: 12.sp);
  static final dateTextStyle_9Tab = TextStyle(
      color: const Color(0xff999999), fontFamily: "Poppins", fontSize: 9.sp);
  static final todayDealNewStyle = TextStyle(
      color: const Color(0xFFF51E46), fontFamily: "Poppins", fontSize: 10.sp);
  static final todayDealNewStyleTab = TextStyle(
      color: const Color(0xFFF51E46), fontFamily: "Poppins", fontSize: 8.sp);
  static final todayDealTitleStyle =
      TextStyle(color: Colors.black, fontFamily: "Poppins", fontSize: 12.sp);
  static final todayDealTitleStyleTab =
      TextStyle(color: Colors.black, fontFamily: "Poppins", fontSize: 10.sp);
  static final todayDealOriginalPriceStyle = TextStyle(
    color: const Color(0xFFF51E46),
    fontFamily: "Poppins Medium",
    fontSize: 10.sp,
    decoration: TextDecoration.lineThrough,
  );
  static final todayDealOriginalPriceStyleTab = TextStyle(
    color: const Color(0xFFF51E46),
    fontFamily: "Poppins Medium",
    fontSize: 8.sp,
    decoration: TextDecoration.lineThrough,
  );
  static final todayDealDiscountPriceStyle = TextStyle(
    color: const Color(0xFF333333),
    fontFamily: "Poppins Medium",
    fontSize: 11.sp,
  );
  static final todayDealDiscountPriceStyleTab = TextStyle(
    color: const Color(0xFF333333),
    fontFamily: "Poppins Medium",
    fontSize: 9.sp,
  );
  static final popularCategoryTitle_11 = TextStyle(
      color: const Color(0xff333333), fontFamily: "Poppins", fontSize: 11.sp);
  static final rewardStyle = TextStyle(
    color: Colors.black,
    fontFamily: "Poppins",
    fontSize: 9.sp,
  );
  static final trackingOrderTitle = TextStyle(
    fontSize: 14.sp,
    fontFamily: "Poppins Medium",
    color: const Color(0xFF333333),
  );
  static final trackingOrderTitleTab = TextStyle(
    fontSize: 9.sp,
    fontFamily: "Poppins Medium",
    color: const Color(0xFF333333),
  );
  static final trackingOrderSubTitle = TextStyle(
    fontSize: 12.sp,
    fontFamily: "Poppins",
    color: const Color(0xFF333333),
  );
  static final trackingOrderSubTitleTab = TextStyle(
    fontSize: 9.sp,
    fontFamily: "Poppins",
    color: const Color(0xFF333333),
  );
  static final settingsTitleStyle = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: const Color(0xFF666666),
  );
  static final settingsTitleStyleTab = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: const Color(0xFF666666),
  );

  // Details Screen
  static final detwailsScreenBottomSheetTitle = TextStyle(
    color: const Color(0xFF333333),
    fontFamily: "Poppins",
    fontSize: 13.sp,
    overflow: TextOverflow.ellipsis,
  );
  static final detailsScreenBottomSheetTitleTab = TextStyle(
    color: const Color(0xFF333333),
    fontFamily: "Poppins",
    fontSize: 10.sp,
    overflow: TextOverflow.ellipsis,
  );
  static final detailsScreenTotal = TextStyle(
    color: const Color(0xFF333333),
    fontFamily: "Poppins Medium",
    fontSize: 13.sp,
  );
  static final detailsScreenTotalTab = TextStyle(
    color: const Color(0xFF333333),
    fontFamily: "Poppins Medium",
    fontSize: 10.sp,
  );
  static final detailsScreenTotalPrice = TextStyle(
    color: const Color(0xFF333333),
    fontWeight: FontWeight.bold,
    fontFamily: "Poppins Medium",
    fontSize: 14.sp,
  );
  static final detailsScreenTotalPriceTab = TextStyle(
    color: const Color(0xFF333333),
    fontWeight: FontWeight.bold,
    fontFamily: "Poppins Medium",
    fontSize: 10.sp,
  );
  static final detailsScreenPhoneNumber = TextStyle(
    color: const Color(0xFF333333),
    fontFamily: "Poppins Medium",
    fontSize: 13.sp,
  );
  static final detailsScreenPhoneNumberShow = TextStyle(
    color: const Color(0xFF333333),
    fontFamily: "Poppins",
    fontSize: 10.sp,
  );

  static final profileTxtTileTitle = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    fontFamily: "Poppins",
    color: AppThemeData.descriptionTextColor,
  );
}
