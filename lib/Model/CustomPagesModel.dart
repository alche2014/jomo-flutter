// To parse this JSON data, do
//
//     final customPagesModel = customPagesModelFromJson(jsonString);

import 'dart:convert';

CustomPagesModel customPagesModelFromJson(String str) =>
    CustomPagesModel.fromJson(json.decode(str));

String customPagesModelToJson(CustomPagesModel data) =>
    json.encode(data.toJson());

class CustomPagesModel {
  CustomPagesModel({
    this.customPages,
  });

  List<CustomPage>? customPages;

  factory CustomPagesModel.fromJson(Map<String, dynamic> json) =>
      CustomPagesModel(
        customPages: List<CustomPage>.from(
            json["custom_pages"].map((x) => CustomPage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "custom_pages": List<dynamic>.from(customPages!.map((x) => x.toJson())),
      };
}

class CustomPage {
  CustomPage({
    this.id,
    this.graphqlId,
    this.pageName,
    this.title,
    this.isImage,
    this.imageSrc,
    this.isVideo,
    this.videoSrc,
    this.isFilter,
    this.isClickable,
    this.sortOrder,
    this.selectionType,
  });

  int? id;
  String? graphqlId;
  String? pageName;
  String? title;
  bool? isImage;
  String? imageSrc;
  bool? isVideo;
  String? videoSrc;
  bool? isFilter;
  bool? isClickable;
  String? sortOrder;
  String? selectionType;

  factory CustomPage.fromJson(Map<String, dynamic> json) => CustomPage(
        id: json["id"],
        graphqlId: json["graphql_id"],
        pageName: json["page_name"],
        title: json["title"],
        isImage: json["is_image"],
        imageSrc: json["image_src"],
        isVideo: json["is_video"],
        videoSrc: json["video_src"],
        isFilter: json["is_filter"],
        isClickable: json["is_clickable"],
        sortOrder: json["sort_order"],
        selectionType: json["selection_type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "graphql_id": graphqlId,
        "page_name": pageName,
        "title": title,
        "is_image": isImage,
        "image_src": imageSrc,
        "is_video": isVideo,
        "video_src": videoSrc,
        "is_filter": isFilter,
        "is_clickable": isClickable,
        "sort_order": sortOrder,
        "selection_type": selectionType,
      };
}
