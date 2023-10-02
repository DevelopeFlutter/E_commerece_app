import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:yoori_ecommerce/src/utils/images.dart';

import '../../_route/routes.dart';
import 'package:yoori_ecommerce/src/utils/app_tags.dart';
import '../../utils/app_theme_data.dart';
import 'package:yoori_ecommerce/src/utils/responsive.dart';

class ProfileWithoutLoginScreen extends StatelessWidget {
  const ProfileWithoutLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppThemeData.lightBackgroundColor,
        elevation: 0,
        leading: const SizedBox(),
        centerTitle: true,
        title: Text(
          AppTags.profile.tr,
          style: isMobile(context)?AppThemeData.headerTextStyle_16:AppThemeData.headerTextStyleTab,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 21.w),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.trackingOrder);
                  },
                  child:
                      SvgPicture.asset(Images.locationProfileWl),
                ),
                SizedBox(
                  width: 15.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: InkWell(
                    onTap: () {
                       Get.toNamed(Routes.settings);
                    },
                    child:
                        SvgPicture.asset(Images.settings,height: 20,width: 20,),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 132.h,
            ),
            SvgPicture.asset("assets/icons/login.svg"),
            SizedBox(
              height: 20.h,
            ),
            Text(
              AppTags.notLoggedIn.tr,
              style: TextStyle(
                fontSize:isMobile(context)? 16.sp:12.sp,
                fontFamily: "Poppins Medium",
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              width: 231.w,
              child: Text(
                AppTags.noContent.tr,
                style: isMobile(context)?AppThemeData.orderHistoryTextStyle_12:AppThemeData.orderHistoryTextStyle_9Tab,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 32.sp,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 135.w,
                  height: 42.h,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(Routes.logIn);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:  AppThemeData.buttonShadowColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 5,
                      shadowColor: AppThemeData.buttonShadowColor,
                    ),
                    child: Text(
                      AppTags.signIn.tr,
                      style: TextStyle(
                        fontSize: isMobile(context)? 14.sp:11.sp,
                        fontFamily: "Poppins",
                        color: AppThemeData.lightBackgroundColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15.h,
                ),
                SizedBox(
                  width: 135.w,
                  height: 42.h,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(Routes.signUp);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppThemeData.buttonShadowColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      elevation: 5,
                      shadowColor: AppThemeData.lightBackgroundColor,
                    ),
                    child: Text(
                      AppTags.signUp.tr,
                      style: TextStyle(
                        fontSize: isMobile(context)? 14.sp:11.sp,
                        fontFamily: "Poppins",
                        color: AppThemeData.lightBackgroundColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.dashboardScreen);
                },
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  width: 200,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(Images.arrowBack,height: 10.h,width: 10.w,),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          AppTags.backToShopping.tr,
                          style: isMobile(context)? AppThemeData.backToHomeTextStyle_12:AppThemeData.categoryTitleTextStyle_9Tab,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
