import 'package:get/get.dart';
import 'package:yoori_ecommerce/src/models/coupon_list_model.dart';

import 'package:yoori_ecommerce/src/servers/repository.dart';

class VoucherController extends GetxController {
  Rx<CouponListModel?> couponListModel = CouponListModel().obs;

  @override
  void onInit() async {
    await Repository().getVoucherList().then((value) {
      couponListModel.value = value;
    });
    super.onInit();
  }
}
