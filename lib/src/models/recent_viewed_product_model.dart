class RecentViewedProductModel {
  bool? success;
  String? message;
  late final List<RecentViewedProductModelData> data;

  RecentViewedProductModel({this.success, this.message,required this.data});

  RecentViewedProductModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <RecentViewedProductModelData>[];
      json['data'].forEach((v) {
        data.add( RecentViewedProductModelData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['data'] = this.data.map((v) => v.toJson()).toList();
    return data;
  }
}

class RecentViewedProductModelData {
  int? id;
  String? slug;
  String? title;
  String? shortDescription;
  String? specialDiscountType;
  String? specialDiscount;
  String? discountPrice;
  dynamic formattedPrice;
  dynamic formattedDiscount;
  String? image;
  String? price;
  dynamic rating;
  int? totalReviews;
  int? currentStock;
  int? reward;
  int? minimumOrderQuantity;
  bool? isFavourite;
  bool? isNew;
  bool? hasVariant;

  RecentViewedProductModelData(
      {this.id,
        this.slug,
        this.title,
        this.shortDescription,
        this.specialDiscountType,
        this.specialDiscount,
        this.discountPrice,
        this.formattedPrice,
        this.formattedDiscount,
        this.image,
        this.price,
        this.rating,
        this.totalReviews,
        this.currentStock,
        this.reward,
        this.minimumOrderQuantity,
        this.isFavourite,
        this.isNew,
        this.hasVariant
      });

  RecentViewedProductModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    title = json['title'];
    isNew = json['is_new'];
    shortDescription = json['short_description'];
    specialDiscountType = json['special_discount_type'];
    specialDiscount = json['special_discount'];
    discountPrice = json['discount_price'];
    formattedPrice = json['formatted_price'];
    formattedDiscount = json['formatted_discount'];
    image = json['image'];
    price = json['price'];
    rating = json['rating'];
    totalReviews = json['total_reviews'];
    currentStock = json['current_stock'];
    reward = json['reward'];
    minimumOrderQuantity = json['minimum_order_quantity'];
    isFavourite = json['is_favourite'];
    hasVariant = json['has_variant'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    data['title'] = title;
    data['is_new'] = isNew;
    data['short_description'] = shortDescription;
    data['special_discount_type'] = specialDiscountType;
    data['special_discount'] = specialDiscount;
    data['discount_price'] = discountPrice;
    data['formatted_price'] = formattedPrice;
    data['formatted_discount'] = formattedDiscount;
    data['image'] = image;
    data['price'] = price;
    data['rating'] = rating;
    data['total_reviews'] = totalReviews;
    data['current_stock'] = currentStock;
    data['reward'] = reward;
    data['minimum_order_quantity'] = minimumOrderQuantity;
    data['is_favourite'] = isFavourite;
    data['has_variant'] = hasVariant;
    return data;
  }
}
