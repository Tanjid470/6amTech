

class Category {
  int? id;
  String? name;
  String? image;
  int? parentId;
  int? position;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? priority;
  String? slug;
  int? productsCount;
  int? childesCount;
  String? orderCount;
  String? imageFullUrl;

  Category(
      {this.id,
        this.name,
        this.image,
        this.parentId,
        this.position,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.priority,
        this.slug,
        this.productsCount,
        this.childesCount,
        this.orderCount,
        this.imageFullUrl,
        });

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    parentId = json['parent_id'];
    position = json['position'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    priority = json['priority'];
    slug = json['slug'];
    productsCount = json['products_count'];
    childesCount = json['childes_count'];
    orderCount = json['order_count'];
    imageFullUrl = json['image_full_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['parent_id'] = parentId;
    data['position'] = position;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['priority'] = priority;
    data['slug'] = slug;
    data['products_count'] = productsCount;
    data['childes_count'] = childesCount;
    data['order_count'] = orderCount;
    data['image_full_url'] = imageFullUrl;

    return data;
  }
}

