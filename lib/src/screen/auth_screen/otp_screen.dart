import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:yoori_ecommerce/src/utils/app_tags.dart';
import '../../utils/app_theme_data.dart';
import '../../controllers/phone_auth_controller.dart';
import 'package:yoori_ecommerce/src/utils/responsive.dart';

class OtpScreen extends StatelessWidget {
  final String? phoneNumber;
  final String? screen;
  final String? firstName;
  final String? lastName;
  OtpScreen({Key? key, this.phoneNumber, this.screen, this.firstName, this.lastName}) : super(key: key);

  final TextEditingController otpController = TextEditingController();
  final PhoneAuthController phoneAuthController = Get.put(PhoneAuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isMobile(context)? AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
        title: Text(
          AppTags.verifyNumber.tr,
          style: AppThemeData.headerTextStyle_16,
        ),
      ):AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 60.h,
        leadingWidth: 40.w,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
        title: Text(
          AppTags.verifyNumber.tr,
          style: AppThemeData.headerTextStyle_14,
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 54.h,
                  ),
                  Text(
                    AppTags.verifyYourNumber.tr,
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    AppTags.fiveDigitCodeSent.tr,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 30.sp,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Center(
                child: PinCodeTextField(
                  controller: otpController,
                  appContext: context,
                  length: 5,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  textStyle: const TextStyle(color: Colors.black),
                  animationType: AnimationType.fade,
                  enableActiveFill: true,
                  cursorColor: Colors.black,
                  boxShadows: [
                    BoxShadow(
                      color: AppThemeData.boxShadowColor.withOpacity(0.1),
                      spreadRadius: 0,
                      blurRadius: 6,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    selectedColor: Colors.transparent,
                    activeColor: Colors.transparent,
                    inactiveColor: Colors.transparent,
                    fieldHeight: 48.h,
                    fieldWidth: 48.w,
                    activeFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                  ),
                  onChanged: (String value) {},
                ),
              ),
            ),
            const Spacer(),

            Obx(() => Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: SizedBox(
                width: double.infinity,
                height: 48.h,
                child: ElevatedButton(
                  onPressed: () {
                    if (screen == "loginOTPScreen") {
                      phoneAuthController.sendOtpLogin(
                          phoneNumber: phoneNumber, otp: otpController.text);
                    } else if (screen == "registrationOTpScreen") {
                      phoneAuthController.sendOtpRegistration(
                          phoneNumber: phoneNumber,
                          otp: otpController.text,
                          firstName: firstName,
                          lastName: lastName
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppThemeData.buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: phoneAuthController.isLoading.value? Padding(
                    padding: EdgeInsets.all(14.r),
                    child: Text(
                      AppTags.verify.tr,
                      style: isMobile(context)? AppThemeData.buttonTextStyle_14:AppThemeData.buttonTextStyle_11Tab,
                    ),
                  ): const CircularProgressIndicator(),
                ),
              ),
            )),
            SizedBox(
              height: 40.h,
            ),
          ],
        ),
      ),
    );
  }
}
