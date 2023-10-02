import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/home_data_model.dart';
import '../utils/app_theme_data.dart';


class ShopTypeWidget extends StatelessWidget {
  final HomeDataModel? homeDataModel;
  final int index;

  const ShopTypeWidget(
      {Key? key, required this.homeDataModel, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230.h,
      child: ListView.builder(
        padding: EdgeInsets.only(right: 15.w),
        itemCount: homeDataModel!.data![index].bestShops!.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 0.0.w, left: 15.w),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 200.h,
                  width: 165.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(7.r)),
                    boxShadow: [
                      BoxShadow(
                        color: AppThemeData.boxShadowColor.withOpacity(0.1),
                        spreadRadius: 0,
                        blurRadius: 10.r,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                homeDataModel!
                                    .data![index].bestShops![index].banner!
                                    .toString(),
                              ),
                            ),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.r),
                                topRight: Radius.circular(10.r)),
                            color: Colors.green,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 4.w, bottom: 4.h, top: 4.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 35.h,
                              ),
                              RatingBarIndicator(
                                rating: double.parse(
                                  homeDataModel!
                                      .data![index].bestShops![index].rating!
                                      .toString(),
                                ),
                                itemBuilder: (context, index) => const Icon(
                                  Icons.star_border,
                                  color: Colors.amber,
                                ),
                                itemCount: 5,
                                itemSize: 18.0,
                                direction: Axis.horizontal,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                homeDataModel!
                                    .data![index].bestShops![index].shopName!,
                                style: AppThemeData.titleTextStyle_14,
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 55.w,
                  child: Container(
                    height: 60.h,
                    width: 60.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(35.r)),
                      boxShadow: [
                        BoxShadow(
                          color: AppThemeData.boxShadowColor.withOpacity(0.1),
                          spreadRadius: 0,
                          blurRadius: 6,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Container(
                      width: 60.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            homeDataModel!.data![index].bestShops![index].logo!
                                .toString(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
