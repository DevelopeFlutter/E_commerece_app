import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pagination_view/pagination_view.dart';
import 'package:yoori_ecommerce/src/models/best_shop_model.dart';
import '../../../utils/app_tags.dart';
import '../../../utils/app_theme_data.dart';
import '../../../widgets/shop_card.dart';
import '../../../servers/repository.dart';
import 'package:yoori_ecommerce/src/utils/responsive.dart';
import '../../../widgets/loader/shimmer_shop.dart';
import '../../../widgets/loader/shimmer_shop_load.dart';

class BestShop extends StatefulWidget {
  const BestShop({Key? key}) : super(key: key);

  @override
  State<BestShop> createState() => _BestShopState();
}

class _BestShopState extends State<BestShop> {
  int page = 0;
  PaginationViewType paginationViewType = PaginationViewType.gridView;
  GlobalKey<PaginationViewState> key = GlobalKey<PaginationViewState>();

  Future<List<BestShopModelData>> getData(int offset) async {
    //page = (offset / 1).round();
    page++;
    return await Repository().getBestShop(page: page);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: isMobile(context)
            ? AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Get.back();
                  }, // null disables the button
                ),
                centerTitle: true,
                title: Text(
                  AppTags.bestShop.tr,
                  style: AppThemeData.headerTextStyle_16,
                ),
              )
            : AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                toolbarHeight: 60.h,
                leadingWidth: 40.w,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 25.r,
                  ),

                  onPressed: () {
                    Get.back();
                  }, // null disables the button
                ),
                centerTitle: true,
                title: Text(
                  AppTags.bestShop.tr,
                  style: AppThemeData.headerTextStyle_14,
                ),
              ),
        body: PaginationView<BestShopModelData>(
          key: key,
          paginationViewType: paginationViewType,
          pageFetch: getData,
          pullToRefresh: false,
          onError: (dynamic error) =>
              Center(child: Text(AppTags.someErrorOccurred.tr)),
          onEmpty: Center(child: Text(AppTags.noProduct.tr)),
          bottomLoader: const ShimmerShopLoad(),
          initialLoader: const ShimmerShop(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isMobile(context) ? 3 : 4,
            childAspectRatio: 0.72,
            mainAxisSpacing: isMobile(context) ? 15 : 20,
            crossAxisSpacing: isMobile(context) ? 15 : 20,
          ),
          itemBuilder: (BuildContext context, BestShopModelData shop, int index) {
            return ShopCard(shop: shop);
          },
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 8.h,
          ),
          shrinkWrap: true,
        ));
  }
}
