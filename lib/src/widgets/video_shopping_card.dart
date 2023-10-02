import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:yoori_ecommerce/src/utils/images.dart';
import '../utils/app_theme_data.dart';
import 'package:flutter/material.dart';

import '../_route/routes.dart';
import '../utils/responsive.dart';

class VideoShoppingCard extends StatelessWidget {
  const VideoShoppingCard({
    Key? key,
    required this.dataModel,
    required this.index,
  }) : super(key: key);
  final dynamic dataModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          Routes.detailsVideoShopping,
          parameters: {
            'videoSlug': dataModel.slug
                .toString(),
          },
        );
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10.r),
              image: DecorationImage(
                image: NetworkImage(
                  dataModel.thumbnail.toString(),
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          isMobile(context)?
          Positioned(child: SvgPicture.asset(Images.playVideo)):
          Positioned(child: SvgPicture.asset(Images.playVideo,height: 30.h,)),
          dataModel.isLive
              ? Positioned(
                  top: 5.h,
                  left: 10.w,
                  child: Text(
                    "LIVE",
                    style: isMobile(context)? AppThemeData.todayDealNewStyle:AppThemeData.todayDealNewStyleTab,
                  ),
                )
              : const SizedBox(),
          Positioned(
            bottom: 5.h,
            left: 3.w,
            right: 3.w,
            child: Text(
              dataModel.title,
              style: isMobile(context)? AppThemeData.timeDateTextStyle_12:AppThemeData.timeDateTextStyleTab,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
