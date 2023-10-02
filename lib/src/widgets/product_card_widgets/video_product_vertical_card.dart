import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controllers/currency_converter_controller.dart';
import '../../utils/app_theme_data.dart';
import 'package:yoori_ecommerce/src/utils/responsive.dart';


class VideoProductVerticalCard extends StatelessWidget {
  VideoProductVerticalCard({
    Key? key,
    required this.dataModel,
    required this.index,
  }) : super(key: key);
  final dynamic dataModel;
  final int index;
  final currencyConverterController = Get.find<CurrencyConverterController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7.5.h),
      child: Container(
        height: 120.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: AppThemeData.boxShadowColor.withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 20.r,
              offset: const Offset(0, 10), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(10.r),
              child: SizedBox(
                width: 110.w,
                child: Image.network(
                  dataModel![index].image.toString(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dataModel[index].title.toString(),
                      style: isMobile(context)? AppThemeData.voucherTitle:AppThemeData.voucherTitle.copyWith(fontSize: 11.sp),
                      maxLines: 3,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    num.parse(dataModel![index].specialDiscount) == 0.0 ?
                    Row(
                      children: [
                        Text(
                          currencyConverterController
                              .convertCurrency(dataModel![index].price!),
                          style: isMobile(context)? AppThemeData.priceVideoTextStyle_14:AppThemeData.priceVideoTextStyle_14.copyWith(fontSize: 11.sp),
                        ),
                      ],
                    ):Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(currencyConverterController.convertCurrency(
                            dataModel![index].price.toString()),
                          style: isMobile(context)? AppThemeData.todayDealOriginalPriceStyle:AppThemeData.todayDealOriginalPriceStyleTab,
                        ),
                        SizedBox(width: isMobile(context)? 8.w:4.w),
                        Text(currencyConverterController.convertCurrency(
                              dataModel![index].discountPrice.toString()),
                          style: isMobile(context)? AppThemeData.todayDealDiscountPriceStyle:AppThemeData.todayDealDiscountPriceStyleTab,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
