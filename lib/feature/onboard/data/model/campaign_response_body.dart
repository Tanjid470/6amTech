class CampaignResponse {
  List<CampaignItem>? campaigns;

  CampaignResponse({this.campaigns});

  factory CampaignResponse.fromJson(List<dynamic> json) {
    return CampaignResponse(
      campaigns: json.map((e) => CampaignItem.fromJson(e)).toList(),
    );
  }
}

class CampaignItem {
  int? id;
  String? name;
  String? image;
  String? imageFullUrl;
  String? description;
  double? price;
  double? discount;
  String? discountType;
  bool? veg;
  String? restaurantName;
  List<Category>? categories;
  List<Variation>? variations;
  List<AddOn>? addOns;

  CampaignItem({
    this.id,
    this.name,
    this.image,
    this.imageFullUrl,
    this.description,
    this.price,
    this.discount,
    this.discountType,
    this.veg,
    this.restaurantName,
    this.categories,
    this.variations,
    this.addOns,
  });

  factory CampaignItem.fromJson(Map<String, dynamic> json) {
    return CampaignItem(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      imageFullUrl: json['image_full_url'],
      description: json['description'],
      price: (json['price'] as num?)?.toDouble(),
      discount: (json['discount'] as num?)?.toDouble(),
      discountType: json['discount_type'],
      veg: json['veg'] == 1,
      restaurantName: json['restaurant_name'],
      categories: (json['category_ids'] as List?)
          ?.map((e) => Category.fromJson(e))
          .toList(),
      variations: (json['variations'] as List?)
          ?.map((e) => Variation.fromJson(e))
          .toList(),
      addOns: (json['add_ons'] as List?)
          ?.map((e) => AddOn.fromJson(e))
          .toList(),
    );
  }
}

class Category {
  String? id;
  String? categoryName;

  Category({this.id, this.categoryName});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      categoryName: json['category_name'],
    );
  }
}

class Variation {
  String? name;
  String? type;
  int? min;
  int? max;
  String? requiredField;
  List<VariationValue>? values;

  Variation({this.name, this.type, this.min, this.max, this.requiredField, this.values});

  factory Variation.fromJson(Map<String, dynamic> json) {
    return Variation(
      name: json['name'],
      type: json['type'],
      min: int.tryParse(json['min'].toString() ?? "0"),
      max: int.tryParse(json['max'].toString() ?? "0"),
      requiredField: json['required'],
      values: (json['values'] as List?)
          ?.map((e) => VariationValue.fromJson(e))
          .toList(),
    );
  }
}

class VariationValue {
  String? label;
  String? optionPrice;

  VariationValue({this.label, this.optionPrice});

  factory VariationValue.fromJson(Map<String, dynamic> json) {
    return VariationValue(
      label: json['label'],
      optionPrice: json['optionPrice'],
    );
  }
}

class AddOn {
  int? id;
  String? name;
  double? price;

  AddOn({this.id, this.name, this.price});

  factory AddOn.fromJson(Map<String, dynamic> json) {
    return AddOn(
      id: json['id'],
      name: json['name'],
      price: (json['price'] as num?)?.toDouble(),
    );
  }
}
