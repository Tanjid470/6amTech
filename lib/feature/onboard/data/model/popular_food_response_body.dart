class PopularFoodResponse {
  int? totalSize;
  dynamic limit;
  dynamic offset;
  List<Products>? products;

  PopularFoodResponse({this.totalSize, this.limit, this.offset, this.products});

  PopularFoodResponse.fromJson(Map<String, dynamic> json) {
    totalSize = json['total_size'];
    limit = json['limit'];
    offset = json['offset'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

}

class Products {
  String? name;
  String? description;
  String? image;
  int? price;
  int? tax;
  String? taxType;
  int? discount;
  String? discountType;
  int? orderCount;
  dynamic avgRating;
  String? restaurantName;
  String? imageFullUrl;

  Products(
      {
        this.name,
        this.description,
        this.image,
        this.price,
        this.tax,
        this.taxType,
        this.discount,
        this.discountType,
        this.orderCount,
        this.avgRating,
        this.restaurantName,
        this.imageFullUrl,
      });

  Products.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    image = json['image'];
    price = json['price'];
    tax = json['tax'];
    taxType = json['tax_type'];
    discount = json['discount'];
    discountType = json['discount_type'];
    orderCount = json['order_count'];
    avgRating = json['avg_rating'];
    restaurantName = json['restaurant_name'];
    imageFullUrl = json['image_full_url'];
  }

}
