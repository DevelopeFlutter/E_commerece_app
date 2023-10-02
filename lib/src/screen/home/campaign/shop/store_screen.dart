import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../_route/routes.dart';
import '../../../../controllers/home_screen_controller.dart';
import '../../../../utils/app_theme_data.dart';
import '../../../../widgets/product_card_widgets/shop_product_card.dart';
import '../../../../models/visit_shop_model.dart';
import '../../../../utils/app_tags.dart';
import '../../../../utils/responsive.dart';
import '../../category/product_by_brand_screen.dart';
import '../../category/product_by_category_screen.dart';

class StoreScreen extends StatelessWidget {
  StoreScreen({Key? key, this.visitShopModel}) : super(key: key);
  final homeScreenContentController = Get.put(HomeScreenController());
  final VisitShopModel? visitShopModel;

  @override
  Widget build(BuildContext context) {
    return visitShopModel!.data!.store != null
        ? Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: visitShopModel!.data!.store!.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 20.h),
                  child: categoryCheck(
                    index,context
                  ),
                );
              },
            ),
          )
        : Center(
            child: Text(
              AppTags.noStoreFound.tr,
              style: isMobile(context)? AppThemeData.headerTextStyle_16:AppThemeData.headerTextStyleTab,
            ),
          );
  }

  newArrival(itemIndex , context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.0.w),
              child: Text(
                visitShopModel!.data!.store![itemIndex].title.toString(),
                style: TextStyle(
                  fontSize: isMobile(context)?13.sp:10.sp,
                  fontFamily: "Poppins Medium",
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          height: 220.h,
          child: ListView.builder(
            padding: EdgeInsets.only(right: 15.w),
            itemCount: visitShopModel!.data!.store![itemIndex].products!.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: ShopProductCard(
                  dataModel: visitShopModel!.data!.store![itemIndex].products!,
                  index: index,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  bestSelling(itemIndex,context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.0.w),
              child: Text(
                visitShopModel!.data!.store![itemIndex].title.toString(),
                style: TextStyle(
                  fontSize: isMobile(context)?13.sp:10.sp,
                  fontFamily: "Poppins Medium",
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          height: 220.h,
          child: ListView.builder(
            padding: EdgeInsets.only(right: 15.w),
            itemCount: visitShopModel!.data!.store![itemIndex].products!.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: ShopProductCard(
                  dataModel: visitShopModel!.data!.store![itemIndex].products!,
                  index: index,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  offerEnding(itemIndex,context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.w),
              child: Text(
                visitShopModel!.data!.store![itemIndex].title.toString(),
                style: TextStyle(
                  fontSize: isMobile(context)?13.sp:10.sp,
                  fontFamily: "Poppins Medium",
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          height: 220.h,
          child: ListView.builder(
            padding: EdgeInsets.only(right: 15.w),
            itemCount: visitShopModel!.data!.store![itemIndex].products!.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: ShopProductCard(
                  dataModel: visitShopModel!.data!.store![itemIndex].products!,
                  index: index,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  bestRatedProducts(itemIndex,context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.w),
              child: Text(
                visitShopModel!.data!.store![itemIndex].title.toString(),
                style: TextStyle(
                  fontSize: isMobile(context)?13.sp:10.sp,
                  fontFamily: "Poppins Medium",
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          height: 220.h,
          child: ListView.builder(
            padding: EdgeInsets.only(right: 15.w),
            itemCount: visitShopModel!.data!.store![itemIndex].products!.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: ShopProductCard(
                  dataModel: visitShopModel!.data!.store![itemIndex].products!,
                  index: index,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  featuredProducts(itemIndex, context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.w),
              child: Text(
                visitShopModel!.data!.store![itemIndex].title.toString(),
                style: TextStyle(
                  fontSize: isMobile(context)?13.sp:10.sp,
                  fontFamily: "Poppins Medium",
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          height: 220.h,
          child: ListView.builder(
            padding: EdgeInsets.only(right: 15.w),
            itemCount: visitShopModel!.data!.store![itemIndex].products!.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: ShopProductCard(
                  dataModel: visitShopModel!.data!.store![itemIndex].products!,
                  index: index,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  //Popular Brands
  Widget popularBrands(brandIndex, context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.0.w),
              child: Text(
                visitShopModel!.data!.store![brandIndex].title.toString(),
                style: TextStyle(
                  fontSize: isMobile(context)?13.sp:10.sp,
                  fontFamily: "Poppins Medium",
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: isMobile(context) ? 0.h : 8.h,
        ),
        SizedBox(
          height: 120.h,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 15.w, bottom: 15.h),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: visitShopModel!.data!.store![brandIndex].popularBrands!.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 15.w),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => ProductByBrand(
                          id: visitShopModel!.data!.store![brandIndex].popularBrands![index].id!,
                          title: visitShopModel!.data!.store![brandIndex].popularBrands![index].title!,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 110.h,
                    width: isMobile(context) ? 110.w : 70.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.r),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppThemeData.boxShadowColor.withOpacity(0.05),
                          spreadRadius: 0,
                          blurRadius: 30.r,
                          offset:
                          const Offset(0, 15), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.r),
                      child: Center(
                        child: CachedNetworkImage(
                          imageUrl: visitShopModel!.data!.store![brandIndex]
                              .popularBrands![index]
                              .thumbnail!,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  //Banner
  Widget banner(bannerIndex, context) {
    return Padding(
      padding: EdgeInsets.only(top: isMobile(context) ? 10.h : 30.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: isMobile(context) ? 90.h : 110.h,
            width: double.infinity,
            child: ListView.builder(
              padding: EdgeInsets.only(right: 0.w),
              scrollDirection: Axis.horizontal,
              itemCount: visitShopModel!.data!.store![bannerIndex].banners!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    var data = visitShopModel!.data!.store![bannerIndex].banners![index];
                    if (data.actionType == "product") {
                      if (data.actionId != "") {
                        Get.toNamed(
                          Routes.detailsPage,
                          parameters: {
                            'productId': data.actionId!,
                          },
                        );
                      }
                    } else if (data.actionType == "category") {
                      if (data.actionId!.isNotEmpty) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => ProductByCategory(
                              id: int.parse(data.actionId!),
                              title: data.actionTo.toString(),
                            ),
                          ),
                        );
                      }
                    } else if (data.actionType == "brand") {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => ProductByBrand(
                            id: int.parse(data.actionId!),
                            title: data.actionTo,
                          ),
                        ),
                      );
                    } else if (data.actionType == "seller") {
                      Get.toNamed(
                        Routes.shopScreen,
                        parameters: {
                          'shopId': data.actionId!,
                        },
                      );
                    } else if (data.actionType == "url") {
                      Get.toNamed(
                        Routes.wvScreen,
                        parameters: {
                          'url': data.actionId.toString(),
                          'title': data.actionTo.toString(),
                        },
                      );
                    } else if (data.actionType == "blog") {
                      Get.toNamed(
                        Routes.newsScreen,
                        parameters: {
                          'title': data.actionTo.toString(),
                          'url': data.actionId.toString(),
                          'image': data.thumbnail.toString(),
                        },
                      );
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.w),
                    child: Container(
                      width: 159.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(
                                visitShopModel!.data!.store![bannerIndex]
                                    .banners![index]
                                    .thumbnail!
                                    .toString())),
                        borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 14.h),
        ],
      ),
    );
  }

  Widget categoryCheck(index,context) {
    switch (visitShopModel!.data!.store![index].sectionType) {
      case 'best_selling':
        return bestSelling(index,context);
      case 'best_rated_products':
        return bestRatedProducts(index,context);
      case 'offer_ending_soon':
        return offerEnding(index,context);
      case 'new_arrival':
        return newArrival(index,context);
      case 'featured_product':
        return featuredProducts(index,context);
      case 'banners':
        return banner(index, context);
      case 'popular_brands':
        return popularBrands(index, context);
      default:
        return const SizedBox();
    }
  }
}
