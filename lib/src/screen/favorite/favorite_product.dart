import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import '../../models/favorite_product_model.dart';
import 'package:yoori_ecommerce/src/utils/app_tags.dart';
import '../../utils/app_theme_data.dart';
import '../../widgets/product_card_widgets/shop_product_card.dart';
import 'package:yoori_ecommerce/src/utils/responsive.dart';

class FavoriteProduct extends StatelessWidget {
  const FavoriteProduct({
    Key? key,
    required this.favouriteData,
  }) : super(key: key);

  final FavouriteData favouriteData;

  @override
  Widget build(BuildContext context) {
    return favouriteData.data!.favouriteProducts.isEmpty
        ? Center(
            child: Text(AppTags.noFavProduct.tr,
                style: isMobile(context)? AppThemeData.favoriteTextStyle_14:AppThemeData.favoriteTextStyle_14.copyWith(fontSize: 11.sp)),
          )
        : Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: GridView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
              ),
              itemCount: favouriteData.data!.favouriteProducts.length,
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isMobile(context)? 2:3,
                  childAspectRatio: .75,
                  mainAxisSpacing: isMobile(context)? 15:25,
                  crossAxisSpacing: isMobile(context)?15:25),
              itemBuilder: (context, index) {
                return ShopProductCard(
                  dataModel: favouriteData.data!.favouriteProducts,
                  index: index,
                );
              },
            ),
          );
  }
}
