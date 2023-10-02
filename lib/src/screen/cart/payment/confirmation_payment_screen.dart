import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yoori_ecommerce/src/_route/routes.dart';
import '../../../controllers/dashboard_controller.dart';
import '../../../controllers/order_history_controller.dart';
import '../../../utils/app_tags.dart';
import '../../../data/local_data_helper.dart';
import '../../../utils/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:yoori_ecommerce/src/utils/responsive.dart';
import '../../profile/order_history_screen.dart';


class PaymentConfirmationScreen extends StatelessWidget {
  PaymentConfirmationScreen({Key? key}) : super(key: key);
  final homeScreenController = Get.find<DashboardController>();
  final orderHistory = Get.put(OrderHistoryController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          AppTags.confirmation.tr,
          style: AppThemeData.headerTextStyle_16,
        ),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 126.h,
                    width: 126.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      image: const DecorationImage(
                        alignment: Alignment.center,
                        matchTextDirection: true,
                        repeat: ImageRepeat.noRepeat,
                        image: AssetImage("assets/images/successful.gif"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  Text(
                    AppTags.successfulPayment.tr,
                    style: AppThemeData.seccessfulPayTextStyle_18,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    AppTags.thankYouPurchasing.tr,
                    style: isMobile(context)? AppThemeData.titleTextStyle_14:AppThemeData.titleTextStyle_14.copyWith(fontSize: 11.sp),
                  ),
                  SizedBox(
                    height: 50.h,
                  )
                ],
              ),
            ),
            //Calculate Card

            LocalDataHelper().getUserToken() != null?
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: SizedBox(
                      // width: 160,
                      height: 48.h,
                      child: ElevatedButton(
                        onPressed: () {
                          LocalDataHelper().box.remove("trxId");
                          homeScreenController.changeTabIndex(4);
                          if (LocalDataHelper().getUserToken() != null){
                          Get.offAllNamed(
                            Routes.orderHistory,
                            parameters: {
                              'routeName': RouteCheckOfOrderHistory
                                  .paymentCompleteScreen
                                  .toString(),
                            },
                          );
                          }else{
                            Get.toNamed(Routes.trackingOrder);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppThemeData.headlineTextColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        child: Text(
                            LocalDataHelper().getUserToken() != null?AppTags.getInvoice.tr:AppTags.trackOrder.tr,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: isMobile(context)? 13.sp:10.sp,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Expanded(
                    child: SizedBox(
                      // width: 160,
                      height: 48.h,
                      child: ElevatedButton(
                        onPressed: () {
                          LocalDataHelper().box.remove("trxId");
                          homeScreenController.changeTabIndex(0);
                          Get.offAllNamed(Routes.dashboardScreen);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppThemeData.headlineTextColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        child: Text(
                          AppTags.continueShopping.tr,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: isMobile(context)? 13.sp:10.sp,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ): SizedBox(
              width: 240.w,
              height: 48.h,
              child: ElevatedButton(
                onPressed: () {
                  Get.offAllNamed(Routes.orderHistory, parameters: {
                    'routeName': RouteCheckOfOrderHistory.paymentCompleteScreen.toString()});
                  LocalDataHelper().box.remove("trxId");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppThemeData.headlineTextColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                child: Text(
                  AppTags.orderHistory.tr,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontFamily: "Poppins",
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 40.h,
            )
          ],
        ),
      ),
    );
  }
}
