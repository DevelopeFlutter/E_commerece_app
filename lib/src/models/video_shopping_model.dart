class VideoShoppingModel {
  bool? success;
  String? message;
  List<Data>? data;

  VideoShoppingModel({this.success, this.message, this.data});

  VideoShoppingModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? slug;
  bool? isLive;
  String? thumbnail;
  String? title;

  Data({this.id, this.slug, this.isLive, this.thumbnail, this.title});

  Data.fromJson(Map<String, dynamic> json) {
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
