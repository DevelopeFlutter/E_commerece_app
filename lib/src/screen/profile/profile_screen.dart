import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoori_ecommerce/src/utils/images.dart';
import '../../_route/routes.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/dashboard_controller.dart';
import '../../controllers/profile_content_controller.dart';
import '../../data/local_data_helper.dart';
import '../../models/user_data_model.dart';
import '../../servers/repository.dart';
import 'package:yoori_ecommerce/src/utils/app_tags.dart';
import '../../utils/app_theme_data.dart';
import 'package:yoori_ecommerce/src/utils/responsive.dart';
import '../../utils/validators.dart';
import '../../widgets/loader/shimmer_profile_screen.dart';
import 'edit_profile_screen.dart';
import 'my_download_screen.dart';
import 'my_reward_screen.dart';
import 'wallet/my_wallet_screen.dart';
import 'order_history_screen.dart';

class ProfileContent extends StatefulWidget {
  const ProfileContent({Key? key}) : super(key: key);

  @override
  State<ProfileContent> createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
  final homeScreenController = Get.put(DashboardController());
  var emailPhoneController = TextEditingController();
  final ProfileContentController _profileContentController =
      Get.put(ProfileContentController());
  String? user = LocalDataHelper().getUserToken();
  bool isWallet = LocalDataHelper().getConfigData().data!.appConfig!.walletSystem!;

  var addons = LocalDataHelper().getConfigData().data!.addons!;

  @override
  Widget build(BuildContext context) {
    return Obx(() => _profileWithLogin(_profileContentController.user!.value));
  }

  Widget _profileWithLogin(UserDataModel userDataModel) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: userDataModel.data != null &&
                _profileContentController.profileDataModel.value.data != null
            ?_mainUi(userDataModel)
            : const ShimmerProfileScreen(),
      ),
    );
  }
  //Main ui
  Widget _mainUi(UserDataModel userDataModel)=>ListView(
    children: [
      SizedBox(
        height: isMobile(context) ? 20.h : 25.h,
      ),
      Container(
        height: 160.h,
        width: MediaQuery.of(context).size.width,
        color: const Color(0xffF8F8F8),
        child: Padding(
          padding:
          EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //SizedBox(height: 5,),
              Container(
                width: isMobile(context) ? 74.w : 50.w,
                height: 74.h,
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 0.w,
                      color: Theme.of(context)
                          .scaffoldBackgroundColor),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 2.r,
                        blurRadius: 10.r,
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(0, 5))
                  ],
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      userDataModel.data!.image!.toString(),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "${userDataModel.data!.firstName!.toString()} ${userDataModel.data!.lastName!.toString()}",
                style: isMobile(context)
                    ? AppThemeData.headerTextStyle_16
                    : AppThemeData.headerTextStyle_14,
              ),
            ],
          ),
        ),
      ),
      userDataModel.data!.email == "" &&
          userDataModel.data!.phone == "" ? const SizedBox() :
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Container(
          transform:
          Matrix4.translationValues(0.0, -20.0, 0.0),
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            color: AppThemeData.lightBackgroundColor,
            borderRadius:
            const BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: AppThemeData.headlineTextColor
                    .withOpacity(0.1),
                spreadRadius: 0.r,
                blurRadius: 30.r,
                offset: const Offset(
                    0, 15), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(20.r),
            child: Column(
              children: [
                userDataModel.data!.phone == ""
                    ? const SizedBox()
                    : Row(
                    children: [
                      SizedBox(
                        height: 20.h,
                        width: 20.w,
                        child: SvgPicture.asset(
                          "assets/icons/phone_color.svg",
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                          userDataModel.data!.phone!.toString(),
                          style: isMobile(context) ?
                          AppThemeData.titleTextStyle_14
                              : AppThemeData.titleTextStyle_11Tab,
                      ),
                    ],
                ),
                SizedBox(
                  height: userDataModel.data!.phone == ""
                      ? 0.h
                      : 10.h,
                ),
                userDataModel.data!.email == ""
                    ? const SizedBox()
                    : Row(
                  children: [
                    SizedBox(
                        height: 20.h,
                        width: 20.w,
                        child: SvgPicture.asset(Images.email)),
                    SizedBox(width: 10.w,),
                    Text(
                      userDataModel.data!.email!.toString(),
                      style: isMobile(context) ?
                      AppThemeData.titleTextStyle_14 : AppThemeData.titleTextStyle_11Tab,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      //mobile And tab View
      isMobile(context)? mobileView(userDataModel):tabView(userDataModel),
      Padding(
        padding:
        EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
        child: InkWell(
          onTap: () {
            accountDeleteDialogue(userDataModel);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  AppTags.deleteYourAccount.tr,
                  style: AppThemeData.todayDealNewStyleTab.copyWith(fontSize: 12.sp))
            ],
          ),
        ),
      ),
    ],
  );
  //Mobile view
  Widget mobileView(UserDataModel userDataModel)=> Padding(
    padding: EdgeInsets.symmetric(horizontal: 15.w),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(7.r)),
        boxShadow: [
          BoxShadow(
            color: AppThemeData.boxShadowColor.withOpacity(0.1),
            spreadRadius: 0.r,
            blurRadius: 6.r,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(height: 10.h),
          isWallet != false ?
          InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MyWalletScreen(
                      userDataModel: userDataModel,
                    ),
                  ),
                );
              },
              child: mobileViewTile("wallet",AppTags.myWallet.tr)
          ) : const SizedBox(),

          isWallet != false ? divider():const SizedBox(),
          //Digital Product
          _profileContentController.profileDataModel.value.data!
              .isOrderedDigitalProduct != false ?
          InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MyDownload(),
                  ),
                );
              },
              child: mobileViewTile("download",AppTags.myDownload.tr)
          ) : const SizedBox(),

          _profileContentController.profileDataModel.value.data!
              .isOrderedDigitalProduct != false ?
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: const Divider(
              color: AppThemeData.dividerColor,
              thickness: 1,
            ),
          ) : const SizedBox(),
          //My reward
          for (int i = 0; i < addons.length; i++)
            addons[i].addonIdentifier == "reward" && addons[i].status == true
                ? InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MyRewardScreen(
                        userDataModel: userDataModel,
                        conversionRate: addons[i].addonData!.conversionRate.toString(),
                      ),
                    ),
                  );
                },
                child: mobileViewTile("reward",AppTags.myRewards.tr)
            ) : const SizedBox(),

          for (int i = 0; i < addons.length;i++)
            addons[i].addonIdentifier == "reward" &&
                addons[i].status == true
                ? divider()
                : const SizedBox(),

          InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EditProfile(
                      userDataModel: _profileContentController.profileDataModel.value,
                    ),
                  ),
                );
              },
              child: mobileViewTile("edit_profile",AppTags.editProfile.tr)
          ),
          divider(),
          InkWell(
              onTap: () {
                homeScreenController.changeTabIndex(3);
              },
              child: mobileViewTile("favourites",AppTags.favorites.tr)
          ),
          divider(),
          InkWell(
              onTap: () {
                Get.toNamed(Routes.notificationContent);
              },
              child: mobileViewTile("notification",AppTags.notification.tr)
          ),
          divider(),
          InkWell(
              onTap: () {
                Get.toNamed(Routes.trackingOrder);
              },
              child: mobileViewTile("track_order",AppTags.trackOrder.tr)
          ),
          divider(),
          InkWell(
              onTap: () {
                Get.toNamed(
                  Routes.orderHistory,
                  parameters: {
                    'routeName': RouteCheckOfOrderHistory.profileScreen.toString(),
                  },
                );
              },
              child: mobileViewTile("order_history",AppTags.orderHistory.tr)
          ),
          divider(),
          InkWell(
              onTap: () {
                Get.toNamed(Routes.voucherList);
              },
              child: mobileViewTile("voucher_color",AppTags.voucher.tr)
          ),
          divider(),
          InkWell(
              onTap: () {
                Get.toNamed(Routes.changePassword);
              },
              child: mobileViewTile("change_password",AppTags.changePassword.tr)
          ),
          divider(),
          InkWell(
              onTap: () {
                Get.toNamed(Routes.settings);
              },
              child: mobileViewTile("setting",AppTags.settings.tr)
          ),
          divider(),
          InkWell(
              onTap: () {
                logoutDialogue();
              },
              child: mobileViewTile("logout",AppTags.logOut.tr)
          ),
          SizedBox(height: 10.h),
        ],
      ),
    ),
  );
  //Tab View
  Widget tabView(UserDataModel userDataModel)=>Padding(
    padding: EdgeInsets.symmetric(horizontal: 15.w),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(7.r)),
        boxShadow: [
          BoxShadow(
            color: AppThemeData.boxShadowColor.withOpacity(0.1),
            spreadRadius: 0.r,
            blurRadius: 6.r,
            offset: const Offset(
                0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          isWallet!= false
              ? InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MyWalletScreen(
                      userDataModel: userDataModel,
                    ),
                  ),
                );
              },
              child: tabViewTile("wallet",AppTags.myWallet.tr)
          ) : const SizedBox(),

          isWallet !=
              false
              ? divider()
              : const SizedBox(),
          //Digital Product
          _profileContentController.profileDataModel.value.data!
              .isOrderedDigitalProduct !=
              false
              ? InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MyDownload(),
                  ),
                );
              },
              child: tabViewTile("download",AppTags.myDownload.tr)
          ) : const SizedBox(),

          _profileContentController.profileDataModel.value.data!
              .isOrderedDigitalProduct !=
              false
              ? divider()
              : const SizedBox(),
          //My reward
          for (int i = 0; i < addons.length; i++)
            addons[i].addonIdentifier == "reward" && addons[i].status == true
                ? InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MyRewardScreen(
                        userDataModel: userDataModel,
                        conversionRate: addons[i]
                            .addonData!
                            .conversionRate
                            .toString(),
                      ),
                    ),
                  );
                },
                child: tabViewTile("reward",AppTags.myRewards.tr))
                : const SizedBox(),
          for (int i = 0; i < addons.length; i++)
            addons[i].addonIdentifier == "reward" && addons[i].status == true
                ? divider() : const SizedBox(),

          InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EditProfile(
                      userDataModel: _profileContentController
                          .profileDataModel.value,
                    ),
                  ),
                );
              },
              child: tabViewTile("edit_profile",AppTags.editProfile.tr)
          ),
          divider(),
          InkWell(
              onTap: () {
                homeScreenController.changeTabIndex(3);
              },
              child: tabViewTile("favourites",AppTags.favorites.tr)
          ),
          divider(),
          InkWell(
              onTap: () {
                Get.toNamed(Routes.notificationContent);
              },
              child: tabViewTile("notification",AppTags.notification.tr)
          ),
          divider(),
          InkWell(
              onTap: () {
                Get.toNamed(Routes.trackingOrder);
              },
              child: tabViewTile("track_order",AppTags.trackOrder.tr)
          ),
          divider(),
          InkWell(
              onTap: () {
                Get.toNamed(
                  Routes.orderHistory,
                  parameters: {
                    'routeName': RouteCheckOfOrderHistory
                        .profileScreen
                        .toString(),
                  },
                );
              },
              child: tabViewTile("order_history",AppTags.orderHistory.tr)
          ),
          divider(),
          InkWell(
            onTap: () {
              Get.toNamed(Routes.voucherList);
            },
            child: tabViewTile("voucher_color",AppTags.voucher.tr),
          ),
          divider(),
          InkWell(
            onTap: () {
              Get.toNamed(Routes.changePassword);
            },
            child: tabViewTile("change_password",AppTags.changePassword.tr),
          ),
          divider(),
          InkWell(
            onTap: () {
              Get.toNamed(Routes.settings);
            },
            child: tabViewTile("setting",AppTags.settings.tr),
          ),
          divider(),
          InkWell(
            onTap: () {
              logoutDialogue();
            },
            child: tabViewTile("logout",AppTags.logOut.tr),
          ),
          SizedBox(height: 10.h),
        ],
      ),
    ),
  );
  //Mobile View Tile Widget
  Widget mobileViewTile(String icon,String title)=>ListTile(
    horizontalTitleGap: 0.0,
    visualDensity: const VisualDensity(
        horizontal: 0, vertical: -4),
    leading: SizedBox(
      height: 20.h,
      width: 20.w,
      child: SvgPicture.asset(
          "assets/icons/$icon.svg"),
    ),
    title: Text(
      title,
      style: AppThemeData.profileTxtTileTitle,
    ),
  );
  // Tab View Tile Widget
  Widget tabViewTile(String icon,String title)=>Row(
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 8.h),
        child: SizedBox(
          height: 20.h,
          width: 20.w,
          child: SvgPicture.asset(
              "assets/icons/$icon.svg"),
        ),
      ),
      Text(
        title,
        style: AppThemeData.profileTxtTileTitle.copyWith(fontSize: 12.sp)
      ),
    ],
  );
  //Divider
  Widget divider()=> Padding(
    padding: EdgeInsets.symmetric(horizontal: 15.w),
    child: const Divider(
      color: AppThemeData.dividerColor,
      thickness: 1,
    ),
  );
  //Logout Dialogue
  logoutDialogue() {
    return AwesomeDialog(
      width: isMobile(context)
          ? MediaQuery.of(context).size.width
          : MediaQuery.of(context).size.width - 100.w,
      context: context,
      animType: AnimType.SCALE,
      dialogType: DialogType.NO_HEADER,
      btnOkColor: AppThemeData.okButton,
      btnCancelColor: AppThemeData.cancelButton,
      buttonsTextStyle: TextStyle(fontSize: isMobile(context) ? 13.sp : 10.sp),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: Text(
            AppTags.doYouReallyWantToLogout.tr,
            style: isMobile(context)
                ? AppThemeData.priceTextStyle_14.copyWith(fontSize: 16.sp,fontWeight: FontWeight.w600)
                : AppThemeData.titleTextStyle_11Tab,
          ),
        ),
      ),
      btnOkOnPress: () {
        homeScreenController.changeTabIndex(0);
        AuthController.authInstance.signOut();
      },
      btnCancelOnPress: () {
        Get.back();
      },
    ).show();
  }
  //Account Delete Dialog
  accountDeleteDialogue(userDataModel) {
    return AwesomeDialog(
      width: isMobile(context)
          ? MediaQuery.of(context).size.width
          : MediaQuery.of(context).size.width - 100.w,
      context: context,
      animType: AnimType.SCALE,
      dialogType: DialogType.NO_HEADER,
      btnOkColor: AppThemeData.okButton,
      btnCancelColor: AppThemeData.cancelButton,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                AppTags.enterYourEmailPhoneNumberToContinue.tr,
                style: isMobile(context)
                    ? AppThemeData.priceTextStyle_14
                    : AppThemeData.titleTextStyle_11Tab,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              height: isMobile(context) ? 42.h : 48.h,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xffF4F4F4)),
                borderRadius: BorderRadius.all(Radius.circular(5.r)),
              ),
              child: TextField(
                style: isMobile(context)
                    ? AppThemeData.titleTextStyle_13
                    : AppThemeData.titleTextStyleTab,
                controller: emailPhoneController,
                maxLines: 1,
                textAlign: TextAlign.left,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: AppTags.enterYourEmailPhone.tr,
                  hintStyle: isMobile(context)
                      ? AppThemeData.hintTextStyle_13
                      : AppThemeData.hintTextStyle_10Tab,
                  contentPadding: EdgeInsets.only(
                    left: 8.w,
                    right: 8.w,
                    bottom: 8.h,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      btnOkOnPress: () {
        if (emailPhoneController.text == userDataModel.data!.email! ||
            emailPhoneController.text == userDataModel.data!.phone) {
          Repository().deleteAccount().then((value) {
            if (value) {
              _profileContentController.removeUserData();
              AuthController.authInstance.signOut();
              Get.offAllNamed(Routes.logIn);
            }
          });
        } else {
          showErrorToast(AppTags.pleaseEnterCorrectEmailPhone.tr);
        }
      },
      btnCancelOnPress: () {
        Get.back();
      },
    ).show();
  }
}
