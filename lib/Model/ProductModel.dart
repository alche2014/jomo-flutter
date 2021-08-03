import 'dart:convert';

ProductIdModel productIdModelFromJson(Map<String, dynamic> json) =>
    ProductIdModel.fromJson(json);

String productIdModelToJson(ProductIdModel data) => json.encode(data.toJson());


Products productTagModelFromJson(Map<String, dynamic> json) =>
    Products.fromJson(json["products"]);

String productTagModelToJson(Products data) => json.encode(data.toJson());

class ProductIdModel {
  ProductIdModel({
    this.node,
  });

  ProductIdModelNode? node;

  factory ProductIdModel.fromJson(Map<String, dynamic> json) => ProductIdModel(
        node: ProductIdModelNode.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "node": node!.toJson(),
      };
}

class ProductIdModelNode {
  ProductIdModelNode({
    this.id,
    this.products,
  });

  String? id;
  Products? products;

  factory ProductIdModelNode.fromJson(Map<String, dynamic> json) =>
      ProductIdModelNode(
        id: json["id"],
        products: Products.fromJson(json["products"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "products": products!.toJson(),
      };
}

class Products {
  Products({
    this.pageInfo,
    this.edges,
  });

  PageInfo? pageInfo;
  List<ProductsEdge>? edges;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        pageInfo: PageInfo.fromJson(json["pageInfo"]),
        edges: List<ProductsEdge>.from(
            json["edges"].map((x) => ProductsEdge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pageInfo": pageInfo!.toJson(),
        "edges": List<dynamic>.from(edges!.map((x) => x.toJson())),
      };
}

class ProductsEdge {
  ProductsEdge({
    this.cursor,
    this.node,
  });

  String? cursor;
  PurpleNode? node;

  factory ProductsEdge.fromJson(Map<String, dynamic> json) => ProductsEdge(
        cursor: json["cursor"],
        node: PurpleNode.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "cursor": cursor,
        "node": node!.toJson(),
      };
}

class PurpleNode {
  PurpleNode({
    this.title,
    this.tags,
    this.description,
    this.descriptionHtml,
    this.productType,
    this.handle,
    this.publishedAt,
    this.onlineStoreUrl,
    this.variants,
    this.options,
    this.images,
    this.id,
  });

  String? title;
  List<String>? tags;
  String? description;
  String? descriptionHtml;
  String? productType;
  String? handle;
  DateTime? publishedAt;
  String? onlineStoreUrl;
  Variants? variants;
  List<Option>? options;
  Images? images;
  String? id;

  factory PurpleNode.fromJson(Map<String, dynamic> json) => PurpleNode(
    title: json["title"],
    tags: List<String>.from(json["tags"].map((x) => x)),
    description: json["description"],
    descriptionHtml: json["descriptionHtml"],
    productType: json["productType"],
    handle: json["handle"],
    publishedAt: DateTime.parse(json["publishedAt"]),
    onlineStoreUrl: json["onlineStoreUrl"],
    variants: Variants.fromJson(json["variants"]),
    options: List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
    images: Images.fromJson(json["images"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "tags": List<dynamic>.from(tags!.map((x) => x)),
    "description": description,
    "descriptionHtml": descriptionHtml,
    "productType": productType,
    "handle": handle,
    "publishedAt": publishedAt!.toIso8601String(),
    "onlineStoreUrl": onlineStoreUrl,
    "variants": variants!.toJson(),
    "options": List<dynamic>.from(options!.map((x) => x.toJson())),
    "images": images!.toJson(),
    "id": id,
  };
}

class Images {
  Images({
    this.edges,
  });

  List<ImagesEdge>? edges;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        edges: List<ImagesEdge>.from(
            json["edges"].map((x) => ImagesEdge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "edges": List<dynamic>.from(edges!.map((x) => x.toJson())),
      };
}

class ImagesEdge {
  ImagesEdge({
    this.node,
  });

  ImageClass? node;

  factory ImagesEdge.fromJson(Map<String, dynamic> json) => ImagesEdge(
        node: ImageClass.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "node": node!.toJson(),
      };
}

class ImageClass {
  ImageClass({
    this.src,
  });

  String? src;

  factory ImageClass.fromJson(Map<String, dynamic> json) => ImageClass(
        src: json["src"],
      );

  Map<String, dynamic> toJson() => {
        "src": src,
      };
}

class Option {
  Option({
    this.name,
    this.values,
  });

  String? name;
  List<String>? values;

  factory Option.fromJson(Map<String, dynamic> json) => Option(
    name: json["name"],
    values: List<String>.from(json["values"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "values": List<dynamic>.from(values!.map((x) => x)),
  };
}


class Variants {
  Variants({
    this.edges,
  });

  List<VariantsEdge>? edges;

  factory Variants.fromJson(Map<String, dynamic> json) => Variants(
        edges: List<VariantsEdge>.from(
            json["edges"].map((x) => VariantsEdge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "edges": List<dynamic>.from(edges!.map((x) => x.toJson())),
      };
}

class VariantsEdge {
  VariantsEdge({
    this.node,
  });

  FluffyNode? node;

  factory VariantsEdge.fromJson(Map<String, dynamic> json) => VariantsEdge(
        node: FluffyNode.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "node": node!.toJson(),
      };
}

class FluffyNode {
  FluffyNode({
    this.image,
    this.id,
    this.price,
    this.sku,
    this.compareAtPrice,
    this.availableForSale,
    this.selectedOptions,
  });

  ImageClass? image;
  String? id;
  String? price;
  String? sku;
  String? compareAtPrice;
  bool? availableForSale;
  List<SelectedOption>? selectedOptions;

  factory FluffyNode.fromJson(Map<String, dynamic> json) => FluffyNode(
    image: ImageClass.fromJson(json["image"]),
    id: json["id"],
    price: json["price"],
    sku: json["sku"],
    compareAtPrice: json["compareAtPrice"],
    availableForSale: json["availableForSale"],
    selectedOptions: List<SelectedOption>.from(json["selectedOptions"].map((x) => SelectedOption.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "image": image!.toJson(),
    "id": id,
    "price": price,
    "sku": sku,
    "compareAtPrice": compareAtPrice,
    "availableForSale": availableForSale,
    "selectedOptions": List<dynamic>.from(selectedOptions!.map((x) => x.toJson())),
  };
}

class SelectedOption {
  SelectedOption({
    this.name,
    this.value,
  });

  String? name;
  String? value;

  factory SelectedOption.fromJson(Map<String, dynamic> json) => SelectedOption(
        name: json["name"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
      };
}

class PageInfo {
  PageInfo({
    this.hasNextPage,
    this.hasPreviousPage,
  });

  bool? hasNextPage;
  bool? hasPreviousPage;

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
        hasNextPage: json["hasNextPage"],
        hasPreviousPage: json["hasPreviousPage"],
      );

  Map<String, dynamic> toJson() => {
        "hasNextPage": hasNextPage,
        "hasPreviousPage": hasPreviousPage,
      };
}
