import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../utils/app_theme_data.dart';
import 'package:yoori_ecommerce/src/utils/responsive.dart';

class ShimmerAllVideoShopping extends StatelessWidget {
  const ShimmerAllVideoShopping({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile(context)?15.w:10.w, vertical: 8.h),
          child: SizedBox(
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 15,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isMobile(context) ? 3 : 5,
                crossAxisSpacing: isMobile(context) ? 10 : 15,
                mainAxisSpacing: isMobile(context) ? 10 : 15,
                childAspectRatio: 0.74,
              ),
              itemBuilder: (_, __) =>
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(7.r)),
                      boxShadow: [
                        BoxShadow(
                          color: AppThemeData.boxShadowColor.withOpacity(0.1),
                          spreadRadius: 0,
                          blurRadius: 10.r,
                          offset: const Offset(
                              0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.w),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Shimmer.fromColors(
                                  highlightColor: Colors.grey[300]!,
                                  baseColor: Colors.grey[200]!,
                                  child: Container(
                                    height: 15.h,
                                    width: isMobile(context)?60.w:45.w,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(4.r))),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Shimmer.fromColors(
                              highlightColor: Colors.grey[300]!,
                              baseColor: Colors.grey[200]!,
                              child: Container(
                                height: 60.h,
                                width: isMobile(context)?60.w:40.w,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(30.r))),
                              ),
                            ),
                          ),
                          Center(
                            child: Shimmer.fromColors(
                              highlightColor: Colors.grey[300]!,
                              baseColor: Colors.grey[200]!,
                              child: Container(
                                height: 20.h,
                                width: isMobile(context)?120.w : 90.w,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(4.r))),
                              ),
                            ),
                          ),
                          SizedBox(height: 4.h,)
                        ],
                      ),
                    ),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
