import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../utils/app_theme_data.dart';
import 'package:yoori_ecommerce/src/utils/responsive.dart';

class ShimmerVideoShopping extends StatelessWidget {
  const ShimmerVideoShopping({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(

        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(7.r)),
                  boxShadow: [
                    BoxShadow(
                      color: AppThemeData.boxShadowColor.withOpacity(0.1),
                      spreadRadius: 0,
                      blurRadius: 10.r,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: Shimmer.fromColors(
                          highlightColor: Colors.grey[300]!,
                          baseColor: Colors.grey[200]!,
                          child: Container(
                            height: 200.h,
                            //width: 110.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(7.r),
                                topLeft: Radius.circular(7.r),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.all(15.r),
                  child: SizedBox(
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 15,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isMobile(context) ? 2 : 3,
                        crossAxisSpacing: isMobile(context) ? 15 : 20,
                        mainAxisSpacing: isMobile(context) ? 15 : 20,
                        childAspectRatio: 0.73,
                      ),
                      itemBuilder: (_, __) => Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(7.r)),
                          boxShadow: [
                            BoxShadow(
                              color: AppThemeData.boxShadowColor.withOpacity(0.1),
                              spreadRadius: 0,
                              blurRadius: 10.r,
                              offset: const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Center(
                                child: Shimmer.fromColors(
                                  highlightColor: Colors.grey[300]!,
                                  baseColor: Colors.grey[200]!,
                                  child: Container(
                                    height: 150.h,
                                    //width: 110.w,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(7.r),
                                        topLeft: Radius.circular(7.r),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 15.h),
                              Padding(
                                padding: EdgeInsets.all(8.r),
                                child: Center(
                                  child: Shimmer.fromColors(
                                    highlightColor: Colors.grey[300]!,
                                    baseColor: Colors.grey[200]!,
                                    child: Container(
                                      height: 20.h,
                                      // width: 80.w,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(4.r))),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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

