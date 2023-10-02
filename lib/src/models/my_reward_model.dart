class MyRewardModel {
  bool? success;
  String? message;
  Data? data;

  MyRewardModel({this.success, this.message, this.data});

  MyRewardModel.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      success = json['success'];
      message = json['message'];
      data = Data.fromJson(json['data']);
    }
  }
}

class Data {
  Reward? reward;
  RewardDetails? rewardDetails;

  Data.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      reward = Reward.fromJson(json['reward']);
      rewardDetails = RewardDetails.fromJson(json['reward_details']);
    }
  }
}

class Reward {
  int? id;
  int? userId;
  int? rewards;
  String? lastConverted;
  String? createdAt;
  String? updatedAt;
  String? lastConversion;
  String? rewardSum;

  Reward.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      id = json['id'];
      userId = json['user_id'];
      rewards = json['rewards'];
      lastConverted = json['last_converted'];
      createdAt = json['created_at'];
      updatedAt = json['updated_at'];
      lastConversion = json['last_conversion'];
      rewardSum = json['reward_sum'];
    }
  }
}

class RewardDetails {
  int? currentPage;
  List<RewardDetailData>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;

  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  RewardDetails.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      currentPage = json['current_page'];
      from = json['from'];
      lastPage = json['last_page'];
      perPage = json['per_page'];
      to = json['to'];
      total = json['total'];
      data = List<RewardDetailData>.from(json['data']?.map((x) => RewardDetailData.fromJson(x)));
      firstPageUrl = json['first_page_url'];
      lastPageUrl = json['last_page_url'];
      nextPageUrl = json['next_page_url'];
      path = json['path'];
      prevPageUrl = json['prev_page_url'];
    }
  }
}

class RewardDetailData {
  int? id;
  int? rewardId;
  int? productId;
  int? productQty;
  int? reward;
  String? createdAt;
  String? updatedAt;
  Product? product;

  RewardDetailData.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      id = json['id'];
      rewardId = json['reward_id'];
      productId = json['product_id'];
      productQty = json['product_qty'];
      reward = json['reward'];
      createdAt = json['created_at'];
      updatedAt = json['updated_at'];
      product = Product.fromJson(json['product']);
    }
  }
}



class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}

class Product {
  int? id;
  String? image190x230;
  String? image40x40;
  String? image72x72;
  String? image110x122;
  int? specialDiscountCheck;
  int? discountPercentage;
  String? productName;

  Product(
      {this.id,
        this.image190x230,
        this.image40x40,
        this.image72x72,
        this.image110x122,
        this.specialDiscountCheck,
        this.discountPercentage,
        this.productName});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image190x230 = json['image_190x230'];
    image40x40 = json['image_40x40'];
    image72x72 = json['image_72x72'];
    image110x122 = json['image_110x122'];
    specialDiscountCheck = json['special_discount_check'];
    discountPercentage = json['discount_percentage'];
    productName = json['product_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image_190x230'] = this.image190x230;
    data['image_40x40'] = this.image40x40;
    data['image_72x72'] = this.image72x72;
    data['image_110x122'] = this.image110x122;
    data['special_discount_check'] = this.specialDiscountCheck;
    data['discount_percentage'] = this.discountPercentage;
    data['product_name'] = this.productName;
    return data;
  }
}
