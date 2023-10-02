import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:timelines/timelines.dart';
import 'package:yoori_ecommerce/src/utils/images.dart';

import '../../controllers/tracking_order_controller.dart';
import '../../models/track_order_model.dart';
import 'package:yoori_ecommerce/src/utils/app_tags.dart';
import '../../utils/app_theme_data.dart';
import 'package:yoori_ecommerce/src/utils/responsive.dart';

class TrackingOrder extends StatelessWidget {
  TrackingOrder({Key? key}) : super(key: key);
  final trackingOrderController = Get.find<TrackingOrderController>();
   final List statusList =[
    "Order Pending",
    "Order Confirm",
    "Order Picked Up",
    "Order On The Way",
    "Order Delivered",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:isMobile(context)? AppBar(
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
          AppTags.trackOrder.tr,
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
          AppTags.trackOrder.tr,
          style: AppThemeData.headerTextStyle_14,
        ),
      ),
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: Container(
                height: 48.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppThemeData.boxShadowColor.withOpacity(0.1),
                      spreadRadius: 0,
                      blurRadius: 20,
                      offset: const Offset(0, 15),
                    ),
                  ],
                ),
                child: TextField(
                  controller: trackingOrderController.trackingController,
                  cursorColor: Colors.black87,
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    hintText: AppTags.searchParcel.tr,
                    border: InputBorder.none,
                    contentPadding:
                    EdgeInsets.only(top: 15.h, bottom: 15.h, left: 15.h),
                    hintStyle: TextStyle(
                      fontSize: isMobile(context)? 13.sp:10.sp,
                    ),
                    suffixIcon: InkWell(
                      onTap: () {
                        if (trackingOrderController
                            .trackingController.text.isNotEmpty) {
                          trackingOrderController.isLoadingUpdate(true);
                          trackingOrderController
                              .getTrackingOrder(trackingOrderController
                              .trackingController.text)
                              .then(
                                (value) {
                              trackingOrderController.isLoadingUpdate(false);
                              trackingOrderController.loadDataUpdate(true);
                            },
                          );
                        } else {
                          trackingOrderController.textFieldEmptySnackBar();
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 20.w,
                          top: 15.h,
                          bottom: 15.h,
                          right: 20.w,
                        ),
                        child: SvgPicture.asset(Images.searchBar,
                          height: 17.5.h,
                          width: 18.w,
                        ),
                      ),
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: isMobile(context)?  15.sp:11.sp,
                  ),
                ),
              ),
            ),
          ),
          Obx(
                () => trackingOrderController.isLoading.value
                ? SizedBox(
              height: 580.h,
              child: Lottie.asset(
                "assets/lottie/searching.json",
                height: 300.h,
                width: 300.w,
              ),
            )
                : trackingOrderController.trackingOrderModel != null
                ? _trackingWidget(context,trackingOrderController.trackingOrderModel!.data!)
            /*Timeline.tileBuilder(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        theme: TimelineThemeData(
                          nodePosition: .95,
                          connectorTheme: const ConnectorThemeData(
                            thickness: 3.0,
                            color: Color(0xffd3d3d3),
                            space: 50,
                          ),
                          indicatorTheme: const IndicatorThemeData(
                            size: 15.0,
                          ),
                        ),
                        builder: TimelineTileBuilder.connected(
                          contentsAlign: ContentsAlign.reverse,
                          connectorBuilder: (_, index, __) {
                            if (trackingOrderController.trackingOrderModel!
                                .data!.order!.isOrderDelivered!) {
                              return const DashedLineConnector(
                                color: AppThemeData.dashedLineConnectorColor,
                              );
                            } else {
                              if (index ==
                                  trackingOrderController.trackingOrderModel!
                                          .data!.order!.orderHistory!.length -
                                      2) {
                                return DashedLineConnector(
                                  color: AppThemeData.dashedLineConnectorColor.withOpacity(0.4),
                                );
                              } else {
                                return const DashedLineConnector(
                                  color: AppThemeData.dashedLineConnectorColor,
                                );
                              }
                            }
                          },
                          indicatorBuilder: (_, index) {
                            if (index ==
                                trackingOrderController.trackingOrderModel!
                                        .data!.order!.orderHistory!.length -
                                    1) {
                              return DotIndicator(
                                size: 20.r,
                                color: AppThemeData.dashedLineConnectorColor.withOpacity(0.4),
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 15.r,
                                ),
                              );
                            } else {
                              return DotIndicator(
                                size: 20.r,
                                color: AppThemeData.dashedLineConnectorColor,
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 15.r,
                                ),
                              );
                            }
                          },
                          itemExtentBuilder: (_, __) => 80.h,
                          contentsBuilder: (context, index) =>
                              orderTrackDetails(
                            trackingOrderController.trackingOrderModel!.data!
                                .order!.orderHistory![trackingOrderController
                                    .trackingOrderModel!
                                    .data!
                                    .order!
                                    .orderHistory!
                                    .length -
                                (index + 1)],
                            index, context,
                          ),
                          itemCount: trackingOrderController.trackingOrderModel!
                              .data!.order!.orderHistory!.length,
                        ),
                      )*/
                : SizedBox(
              height: 580.h,
              child: Center(
                child: Lottie.asset(
                  "assets/lottie/notFound.json",
                  height: 300.h,
                  width: 300.w,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _trackingWidget(context,Data data)=>Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    child: AnimatedContainer(
      duration: const Duration(seconds: 1),
      //height: 387.h,
      width: 343.w,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow:  const [
          BoxShadow(
              color: Color(0x0D404040),
              offset: Offset(0, 1),
              spreadRadius: 0.5,
              blurRadius: 1),
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(10.r),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0,top: 16.0),
            child: Text("Tracking Information",style: Theme.of(context).textTheme.displayLarge!.copyWith(fontWeight: FontWeight.w600,fontSize: 16.sp),),
          ),
          Timeline.tileBuilder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            theme: TimelineThemeData(
              nodePosition: .95,
              connectorTheme: const ConnectorThemeData(
                thickness: 2.0,
                color: Color(0xffd3d3d3),
              ),
              indicatorTheme: const IndicatorThemeData(
                size: 15.0,
              ),
            ),
            builder: TimelineTileBuilder.connected(
              contentsAlign: ContentsAlign.reverse,
              connectorBuilder: (_, index, __) {
                return DashedLineConnector(
                  color: index<data.order!.orderTrackingStatus!?AppThemeData.trackingSelectorColor:AppThemeData.trackingUnSelectorColor,
                  gap: 3,
                );
              },
              itemExtentBuilder: (_, __) => 70.h,
              contentsBuilder: (context, index) =>
                  orderTrackDetails(index,context),

              itemCount: 5,
              indicatorBuilder: (_, index) {
                return  DotIndicator(
                  size: 20.r,
                  color: index<data.order!.orderTrackingStatus!?AppThemeData.trackingSelectorColor:AppThemeData.trackingUnSelectorColor,
                  child: Icon(
                    Icons.check,
                    color: index<data.order!.orderTrackingStatus!?Colors.white:Colors.transparent,
                    size: 15.r,
                  ),
                );
              },

            ),
          ),
        ],
      ),
    ),
  );
  Widget? orderTrackDetails( index,context) {
    return deliveryTrackItem(
        "order_created",
        statusList[index],
        "Order history",
        index,
        context
    );
  }

  /* Widget? orderTrackDetails(OrderHistory orderHistory, index,context) {
    switch (orderHistory.event) {
      case "order_create_event":
        return deliveryTrackItem(
          "order_created",
          "Order Created",
          orderHistory.createdAt,
          index,
            context
        );
      case "delivery_hero_assigned":
        return deliveryTrackItem(
          "delivery_hero_assigned",
          "Delivery Hero Assigned",
          orderHistory.createdAt,
          index,
            context
        );
      case "delivery_hero_changed":
        return deliveryTrackItem(
          "delivery_hero_changed",
          "Delivery Hero Changed",
          orderHistory.createdAt,
          index,
            context
        );
      case "order_confirm_event":
        return deliveryTrackItem(
          "order_confirm",
          "Order Confirm",
          orderHistory.createdAt,
          index,
            context
        );
      case "order_picked_up_event":
        return deliveryTrackItem(
          "order_picked",
          "Order Picked Up",
          orderHistory.createdAt,
          index,
            context
        );
      case "order_on_the_way_event":
        return deliveryTrackItem(
          "order_on_the_way",
          "Order On The way",
          orderHistory.createdAt,
          index,
            context
        );
      case "order_pending_event":
        return deliveryTrackItem(
          "order_pending",
          "Order Pending",
          orderHistory.createdAt,
          index,
            context
        );
      case "order_canceled_event":
        return deliveryTrackItem(
          "order_cancelled",
          "Order Cancelled",
          orderHistory.createdAt,
          index,
            context
        );
      case "order_delivered_event":
        return deliveryTrackItem(
          "order_delivered",
          "Order Delivered",
          orderHistory.createdAt,
          index,
            context
        );
      case "pending":
        return deliveryTrackItem(
          "order_delivered",
          "Order Delivered",
          "Pending",
          index,
            context
        );
      default:
        return deliveryTrackItem(
          "",
          "",
          "",
          index,
          context,
        );
    }
  }*/

  Widget deliveryTrackItem(image, title, subtitle, index,context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w),
      child: ListTile(
        dense: true,
        contentPadding: EdgeInsets.zero,
        leading: Container(
          width: 42.w,
          height: 42.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
            color: AppThemeData.trackingMultipleColor[index % AppThemeData.trackingMultipleColor.length].withOpacity(0.1),
          ),
          child: Center(
            child: SvgPicture.asset(
              "assets/icons/track_order/$image.svg",
              height: 21.h,
              width: 21.w,
              color: AppThemeData.trackingMultipleColor[index % AppThemeData.trackingMultipleColor.length],
            ),
          ),
        ),
        title: Text(
          title,
          style: isMobile(context)? AppThemeData.trackingOrderTitle:AppThemeData.trackingOrderTitleTab,
        ),
        subtitle: Text(
          subtitle,
          style: isMobile(context)? AppThemeData.trackingOrderSubTitle:AppThemeData.trackingOrderSubTitleTab,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

