import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../_route/routes.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/dashboard_controller.dart';
import '../../models/user_data_model.dart';
import 'package:yoori_ecommerce/src/utils/app_tags.dart';
import '../../data/local_data_helper.dart';
import '../../utils/app_theme_data.dart';
import 'package:yoori_ecommerce/src/utils/responsive.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  bool isDark = false;
  int _index = 0;
  final homeScreenController = Get.put(DashboardController());

  final List _list = [
    {
      "icon": "home",
      "title": AppTags.home.tr,
    },
    {
      "icon": "d_user",
      "title": AppTags.account.tr,
    },
    {
      "icon": "d_places",
      "title": AppTags.trackOrder.tr,
    },
    {
      "icon": "d_notifications",
      "title": AppTags.notification.tr,
    },
    {
      "icon": "d_settings",
      "title": AppTags.settings.tr,
    },
    {
      "icon": "exit",
      "title": AppTags.logOut.tr,
    }
  ];

  UserDataModel? userDataModel = UserDataModel();
  @override
  void initState() {
    userDataModel = LocalDataHelper().getUserAllData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: MediaQuery.of(context).size.height,
      width: 112.w,
      color: Colors.white,
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 20.h),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.h,
              ),
              userDataModel != null
                  ? Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Container(
                        width: isMobile(context)? 65.w:40.w,
                        height: 65.h,
                        decoration: BoxDecoration(
                          color: AppThemeData.categoryColors,
                          border: Border.all(
                              width: 0,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          shape: BoxShape.circle,
                        ),
                        child: ClipOval(
                          child: Image.network(userDataModel!.data!.image!),
                        ),
                      ),
                    )
                  : Container(),
              Expanded(
                flex: 7,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount:
                        userDataModel != null ? _list.length : _list.length - 1,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          _onItemTapped(index);
                          if (index == 0) {
                            homeScreenController.changeTabIndex(0);

                          }
                          if (index == 1) {
                            homeScreenController.changeTabIndex(4);
                          }
                          if (index == 2) {
                            Get.toNamed(Routes.trackingOrder);
                          }
                          if (index == 3) {
                            Get.toNamed(Routes.notificationContent);
                          }
                          if (index == 4) {
                            Get.toNamed(Routes.settings);
                          }
                          if (index == 5) {
                            
                            AuthController.authInstance.signOut();
                          }
                          Scaffold.of(context).closeDrawer();
                        },
                        child: Container(
                          height: 70.h,
                          width: 112.w,
                          color: _index == index
                              ? AppThemeData.drawerBoxColor
                              : Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/${_list[index]["icon"]}.svg",height: 20.h,width: 20.w,
                                color: _index == index
                                    ? Colors.white
                                    : AppThemeData.drawerIconColor.withOpacity(1.0),
                              ),
                               SizedBox(height: 8.h),
                              Text(
                                _list[index]["title"],
                                style: TextStyle(
                                    color: _index == index
                                        ? Colors.white
                                        : AppThemeData.headlineTextColor,
                                    fontFamily: 'Poppins',
                                  fontSize: isMobile(context)? 13.w:9.w
                                ),
                              )
                            ],
                          ),
                        ),
                        //onTap: _onItemTapped,
                      );
                    }
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  logoutDialogue() {
    return AwesomeDialog(
      context: context,
      animType: AnimType.SCALE,
      dialogType: DialogType.WARNING,
      body: Center(
        child: Text(
          'Do you Really want to logout?',
          style: AppThemeData.priceTextStyle_14,
        ),
      ),
      btnOkOnPress: () {

        // Get.delete<CartContentController>();
      },
      btnCancelOnPress: () {
        Get.back();
      },
    ).show();
  }


  void _onItemTapped(int index) {
    setState(() {
      _index = index;
    });
  }
}
