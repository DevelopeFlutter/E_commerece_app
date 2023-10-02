class VideoShoppingDetailsModel {
  bool? success;
  String? message;
  Data? data;

  VideoShoppingDetailsModel({this.success, this.message, this.data});

  VideoShoppingDetailsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Video? video;

  Data({this.video});

  Data.fromJson(Map<String, dynamic> json) {
    video = json['video'] != null ? Video.fromJson(json['video']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (video != null) {
      data['video'] = video!.toJson();
    }
    return data;
  }
}

class Video {
  int? id;
  String? slug;
  String? style;
  String? videoType;
  dynamic videoUrl;
  String? thumbnail;
  String? title;
  List<Products>? products;
  List<RelatedProducts>? relatedProducts;
  bool? hasRelatedProducts;
  List<PopularVideos>? popularVideos;

  Video(
      {this.id,
        this.slug,
        this.style,
        this.videoType,
        this.videoUrl,
        this.thumbnail,
        this.title,
        this.products,
        this.relatedProducts,
        this.hasRelatedProducts,
        this.popularVideos
      });

  Video.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    style = json['style'];
    videoType = json['video_type'];
    videoUrl = json['video_url'];
    thumbnail = json['thumbnail'];
    title = json['title'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    if (json['related_products'] != null) {
      relatedProducts = <RelatedProducts>[];
      json['related_products'].forEach((v) {
        relatedProducts!.add(RelatedProducts.fromJson(v));
      });
    }
    hasRelatedProducts = json['has_related_products'];
    if (json['popular_videos'] != null) {
      popularVideos = <PopularVideos>[];
      json['popular_videos'].forEach((v) {
        popularVideos!.add(PopularVideos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    data['style'] = style;
    data['video_type'] = videoType;
    data['video_url'] = videoUrl;
    data['thumbnail'] = thumbnail;
    data['title'] = title;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    if (relatedProducts != null) {
      data['related_products'] =
          relatedProducts!.map((v) => v.toJson()).toList();
    }
    data['has_related_products'] = hasRelatedProducts;
    if (popularVideos != null) {
      data['popular_videos'] =
          popularVideos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? id;
  String? slug;
  String? title;
  String? specialDiscountType;
  dynamic specialDiscount;
  dynamic discountPrice;
  dynamic formattedPrice;
  dynamic formattedDiscount;
  String? image;
  dynamic price;
  dynamic rating;
  int? reviewsCount;
  int? currentStock;
  int? reward;
  bool? isNew;
  int? minimumOrderQuantity;
  bool? isFavourite;
  bool? hasVariant;

  Products(
      {this.id,
        this.slug,
        this.title,
        this.specialDiscountType,
        this.specialDiscount,
        this.discountPrice,
        this.formattedPrice,
        this.formattedDiscount,
        this.image,
        this.price,
        this.rating,
        this.reviewsCount,
        this.currentStock,
        this.reward,
        this.isNew,
        this.minimumOrderQuantity,
        this.isFavourite,
        this.hasVariant
      });

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    title = json['title'];
    specialDiscountType = json['special_discount_type'];
    specialDiscount = json['special_discount'];
    discountPrice = json['discount_price'];
    formattedPrice = json['formatted_price'];
    formattedDiscount = json['formatted_discount'];
    image = json['image'];
    price = json['price'];
    rating = json['rating'];
    reviewsCount = json['reviews_count'];
    currentStock = json['current_stock'];
    reward = json['reward'];
    isNew = json['is_new'];
    minimumOrderQuantity = json['minimum_order_quantity'];
    isFavourite = json['is_favourite'];
    hasVariant = json['has_variant'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    data['title'] = title;
    data['special_discount_type'] = specialDiscountType;
    data['special_discount'] = specialDiscount;
    data['discount_price'] = discountPrice;
    data['formatted_price'] = formattedPrice;
    data['formatted_discount'] = formattedDiscount;
    data['image'] = image;
    data['price'] = price;
    data['rating'] = rating;
    data['reviews_count'] = reviewsCount;
    data['current_stock'] = currentStock;
    data['reward'] = reward;
    data['is_new'] = isNew;
    data['minimum_order_quantity'] = minimumOrderQuantity;
    data['is_favourite'] = isFavourite;
    data['has_variant'] = hasVariant;
    return data;
  }
}

class RelatedProducts {
  RelatedProducts({
    this.id,
    this.slug,
    this.title,
    this.specialDiscountType,
    this.specialDiscount,
    this.discountPrice,
    this.formattedPrice,
    this.formattedDiscount,
    this.image,
    this.price,
    this.rating,
    this.reviewsCount,
    this.currentStock,
    this.reward,
    this.isNew,
    this.minimumOrderQuantity,
    this.isFavourite
  });

  RelatedProducts.fromJson(dynamic json) {
    id = json['id'];
    slug = json['slug'];
    title = json['title'];
    specialDiscountType = json['special_discount_type'];
    specialDiscount = json['special_discount'];
    discountPrice = json['discount_price'];
    formattedPrice = json['formatted_price'];
    formattedDiscount = json['formatted_discount'];
    image = json['image'];
    price = json['price'];
    rating = json['rating'];
    reviewsCount = json['reviews_count'];
    currentStock = json['current_stock'];
    reward = json['reward'];
    isNew = json['is_new'];
    minimumOrderQuantity = json['minimum_order_quantity'];
    isFavourite = json['is_favourite'];
    hasVariant = json['has_variant'];
  }
  int? id;
  String? slug;
  String? title;
  String? specialDiscountType;
  dynamic specialDiscount;
  dynamic discountPrice;
  dynamic formattedPrice;
  dynamic formattedDiscount;
  String? image;
  dynamic price;
  dynamic rating;
  int? reviewsCount;
  int? currentStock;
  int? reward;
  bool? isNew;
  int? minimumOrderQuantity;
  bool? isFavourite;
  bool? hasVariant;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    data['title'] = title;
    data['special_discount_type'] = specialDiscountType;
    data['special_discount'] = specialDiscount;
    data['discount_price'] = discountPrice;
    data['formatted_price'] = formattedPrice;
    data['formatted_discount'] = formattedDiscount;
    data['image'] = image;
    data['price'] = price;
    data['rating'] = rating;
    data['reviews_count'] = reviewsCount;
    data['current_stock'] = currentStock;
    data['reward'] = reward;
    data['is_new'] = isNew;
    data['minimum_order_quantity'] = minimumOrderQuantity;
    data['is_favourite'] = isFavourite;
    data['has_variant'] = hasVariant;
    return data;
  }

}
class PopularVideos {
  int? id;
  String? slug;
  bool? isLive;
  String? thumbnail;
  String? title;

  PopularVideos({this.id, this.slug, this.isLive, this.thumbnail, this.title});

  PopularVideos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    isLive = json['is_live'];
    thumbnail = json['thumbnail'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    data['is_live'] = isLive;
    data['thumbnail'] = thumbnail;
    data['title'] = title;
    return data;
  }
}
