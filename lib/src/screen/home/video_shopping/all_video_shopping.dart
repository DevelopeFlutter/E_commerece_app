import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pagination_view/pagination_view.dart';
import 'package:yoori_ecommerce/src/servers/repository.dart';
import 'package:yoori_ecommerce/src/utils/app_tags.dart';
import '../../../models/video_shopping_model.dart';
import '../../../utils/app_theme_data.dart';
import 'package:yoori_ecommerce/src/utils/responsive.dart';
import '../../../widgets/loader/shimmer_video_bottom_loader.dart';
import '../../../widgets/loader/shimmer_all_video_shopping.dart';
import '../../../widgets/video_shopping_card.dart';

class AllVideoShopping extends StatefulWidget {
  const AllVideoShopping({Key? key}) : super(key: key);
  @override
  State<AllVideoShopping> createState() => _AllVideoShoppingState();
}

class _AllVideoShoppingState extends State<AllVideoShopping> {
  int page = 0;
  PaginationViewType paginationViewType = PaginationViewType.gridView;
  final GlobalKey<PaginationViewState> _key = GlobalKey<PaginationViewState>();

  Future<List<Data>> getData(int offset) async {
    //page = (offset / 1).round();
    page++;
    return await Repository().allVideoShopping(page: page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isMobile(context)? AppBar(
        backgroundColor: Colors.transparent,
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
          AppTags.videoShopping.tr,
          style: AppThemeData.headerTextStyle_16,
        ),
      ): AppBar(
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
          AppTags.videoShopping.tr,
          style: AppThemeData.headerTextStyle_14,
        ),
      ),
      body: PaginationView<Data>(
        key: _key,
        paginationViewType: paginationViewType,
        pageFetch: getData,
        pullToRefresh: false,
        onError: (dynamic error) => Center(
          child: Text(AppTags.someErrorOccurred.tr),
        ),
        onEmpty: Center(
          child: Text(AppTags.noProduct.tr),
        ),
        bottomLoader: const ShimmerVideoBottomLoader(),
        initialLoader: const ShimmerAllVideoShopping(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isMobile(context)? 3:4,
          childAspectRatio: 0.68,
          mainAxisSpacing: isMobile(context)? 10:20,
          crossAxisSpacing: isMobile(context)? 10:20,
        ),
        itemBuilder: (BuildContext context, Data productVideo, int index) {
          return VideoShoppingCard(
            dataModel: productVideo,
            index: index,
          );
        },
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
        shrinkWrap: true,
      ),
    );
  }
}
