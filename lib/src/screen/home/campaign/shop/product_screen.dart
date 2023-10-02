import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../models/visit_shop_model.dart';
import '../../../../utils/responsive.dart';
import '../../../../widgets/product_card_widgets/shop_product_card.dart';


class ProductScreen extends StatelessWidget {
  final VisitShopModel? visitShopModel;
  const ProductScreen({Key? key, this.visitShopModel}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.only(
                left: 15.w,
                right: 15.w,
                bottom: 15.h,
              ),
              itemCount: visitShopModel!.data!.products!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isMobile(context)? 2:3,
                childAspectRatio: .75,
                mainAxisSpacing: isMobile(context)? 15:20,
                crossAxisSpacing: isMobile(context)? 15:20,
              ),
              itemBuilder: (context, index) {
                return ShopProductCard(
                  dataModel: visitShopModel!.data!.products!,
                  index: index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
