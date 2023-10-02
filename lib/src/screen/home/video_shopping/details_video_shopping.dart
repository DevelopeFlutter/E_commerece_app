import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:vimeo_video_player/vimeo_video_player.dart';
import 'package:yoori_ecommerce/src/_route/routes.dart';
import 'package:yoori_ecommerce/src/controllers/video_shopping_details_controller.dart';
import 'package:yoori_ecommerce/src/utils/images.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../models/video_shopping_details_model.dart';
import '../../../utils/app_tags.dart';
import '../../../utils/app_theme_data.dart';
import 'package:yoori_ecommerce/src/utils/responsive.dart';
import '../../../widgets/loader/shimmer_video_shopping.dart';
import '../../../widgets/product_card_widgets/video_product_card.dart';
import '../../../widgets/product_card_widgets/video_product_vertical_card.dart';

class  DetailsVideoShopping extends StatelessWidget {
  DetailsVideoShopping ({Key? key}) : super(key: key);
  final VideoShoppingDetailsController videoShoppingDetailsController = Get.put(VideoShoppingDetailsController());
  final videoSlug = Get.parameters['videoSlug'];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body:SizedBox(
          height: size.height,
          width: size.width,
          child: Obx(() => videoShoppingDetailsController.isLoader.value? const Center(child: ShimmerVideoShopping()): detailsUi(videoShoppingDetailsController.videoShoppingDetailsModel.value, context))) ,
    );
  }

  Widget detailsUi(VideoShoppingDetailsModel videoShoppingDetailsModel,context){
    return ListView(
      children: [
        videoShoppingDetailsModel.data!.video!.videoType=="youtube"?
        Stack(
          alignment: Alignment.topRight,
          children: [
            YoutubePlayer(
              controller: videoShoppingDetailsController.controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.blueAccent,
              topActions: <Widget>[
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    videoShoppingDetailsController.controller.metadata.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.sp,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
              onReady: () {
                videoShoppingDetailsController.isPlayerReady.value = true;
              },
            ),
            backButton(context),
          ],
        ):const SizedBox(),

        videoShoppingDetailsModel.data!.video!.videoType=="mp4"?
        videoShoppingDetailsController.videoPlayerController!.value.isInitialized
            ?  Stack(
               alignment: Alignment.topRight,
               children: [
                AspectRatio(
                    aspectRatio: videoShoppingDetailsController.videoPlayerController!.value.aspectRatio,
                    child: Chewie(
                    controller:  videoShoppingDetailsController.chewieController!,
                  ),
                ),
                 backButton(context),
              ],
            ) : const Center(child: CircularProgressIndicator()):Container(),

        videoShoppingDetailsModel.data!.video!.videoType=="embedded_video"?
        Stack(
          alignment: Alignment.topRight,
          children: [
            HtmlWidget(
            "<p><iframe src=\"https://www.facebook.com/plugins/video.php?href=${videoShoppingDetailsModel.data!.video!.videoUrl}/\" style=\"border:none;overflow:hidden\" scrolling=\"no\" frameborder=\"0\" allowtransparency=\"false\" allowfullscreen=\"true\"></iframe></p>",
            ),
            backButton(context),
          ],
        ):const SizedBox(),

        videoShoppingDetailsModel.data!.video!.videoType=="vimeo"?
        Stack(
          alignment: Alignment.topRight,
          children: [
            VimeoVideoPlayer(
              vimeoPlayerModel: VimeoPlayerModel(
                url: videoShoppingDetailsController.vimeoLink.value,
                deviceOrientation: DeviceOrientation.portraitUp,
                systemUiOverlay: const [
                  SystemUiOverlay.top,
                  SystemUiOverlay.bottom,
                ],
              ),
            ),
            backButton(context),
          ],
        ): const SizedBox(),

        SizedBox(height: 5.h,),
        videoShoppingDetailsModel.data!.video!.products!.isNotEmpty?
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Text(AppTags.recommendedProducts.tr,style: isMobile(context)? AppThemeData.headerTextStyle_16:AppThemeData.headerTextStyle_16.copyWith(fontSize: 13.sp)),
            ),
            videoShoppingDetailsController.productStyle()?
            ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: videoShoppingDetailsModel.data!.video!.products!.length,
                itemBuilder: (context,index){
                  return InkWell(
                      onTap: () {
                        Get.toNamed(
                          Routes.detailsPage,
                          parameters: {
                            'productId': videoShoppingDetailsModel.data!.video!.products![index].id!.toString(),
                          },
                        );
                      },
                      child: VideoProductVerticalCard(dataModel:videoShoppingDetailsModel.data!.video!.products,index: index));
                }
            ):

            SizedBox(
              height: 255.h,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                itemCount: videoShoppingDetailsModel.data!.video!.products!.length,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 15.w,top: 5.h),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(
                          Routes.detailsPage,
                          parameters: {
                            'productId': videoShoppingDetailsModel.data!.video!.products![index]
                                .id!.toString(),
                          },
                        );
                      },

                      child: Column(
                        children: [
                          VideoProductCard(
                            dataModel: videoShoppingDetailsModel.data!.video!.products!,
                            index: index,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ):const SizedBox(),
        videoShoppingDetailsModel.data!.video!.relatedProducts!.isNotEmpty?
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Text(AppTags.relatedProducts.tr,style: isMobile(context)? AppThemeData.headerTextStyle_16:AppThemeData.headerTextStyle_16.copyWith(fontSize: 13.sp)),
            ),
            SizedBox(
              height: isMobile(context)? 255.h: 280.h,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                itemCount: videoShoppingDetailsModel.data!.video!.relatedProducts!.length,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 15.w,top: 5.h),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(
                          Routes.detailsPage,
                          parameters: {
                            'productId': videoShoppingDetailsModel.data!.video!.relatedProducts![index]
                                .id!.toString(),
                          },
                        );
                      },
                      child: Column(
                        children: [
                          VideoProductCard(
                            dataModel: videoShoppingDetailsModel.data!.video!.relatedProducts!,
                            index: index,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ):const SizedBox(),
        videoShoppingDetailsModel.data!.video!.popularVideos!.isNotEmpty?
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Text(AppTags.popularVideo.tr,style: isMobile(context)? AppThemeData.headerTextStyle_16:AppThemeData.headerTextStyle_16.copyWith(fontSize: 13.sp)),
            ),
            SizedBox(
              height: isMobile(context)? 150.h:200.h,
              child: ListView.builder(
                padding: EdgeInsets.only(right: 15.w),
                itemCount: videoShoppingDetailsModel.data!.video!.popularVideos!.length,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      videoShoppingDetailsController.videoShoppingDetail(videoShoppingDetailsModel.data!.video!.popularVideos![index].slug.toString());
                    },
                    child: Padding(
                        padding: EdgeInsets.only(right: 0.w, left: 15.w),
                        child: SizedBox(
                          //height: 120.h,
                          width: isMobile(context)? 105.w:90.w,

                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color:Colors.white,
                                    borderRadius: BorderRadius.circular(10.r),
                                    image:  DecorationImage(
                                      image:  NetworkImage(videoShoppingDetailsModel.data!.video!.popularVideos![index].thumbnail.toString()),
                                      fit: BoxFit.cover,)
                                ),
                              ),
                              Positioned(child: SvgPicture.asset("assets/icons/play_video.svg")),

                              Positioned(
                                top: 5.h,
                                left: 10.w,
                                child: Text("LIVE",style: AppThemeData.todayDealNewStyle,),
                              ),
                              Positioned(
                                bottom: 5.h,
                                left: 3.w,
                                right: 3.w,
                                child: Text(videoShoppingDetailsModel.data!.video!.popularVideos![index].title.toString(),style: isMobile(context)? AppThemeData.timeDateTextStyle_12:AppThemeData.timeDateTextStyleTab,overflow: TextOverflow.ellipsis,),
                              )
                            ],
                          ),
                        ),
                    ),
                  );
                },
              ),
            ),
          ],
        ):const SizedBox(),
      ],
    );
  }

  Widget backButton(context)=>Padding(
    padding: EdgeInsets.symmetric(horizontal: isMobile(context) ? 6.w:3.w,vertical: isMobile(context) ?6.h:3.h),
    child: InkWell(
      onTap: (){
        Get.back();
      },
      child: Container(
        width: 17.w,
        height: isMobile(context) ? 17.h:20.h,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(5.r)
        ),
        child: Padding(
          padding: EdgeInsets.all(4.r),
          child: SvgPicture.asset(Images.videoBackButton,),
        ),
      ),
    ),
  );
}