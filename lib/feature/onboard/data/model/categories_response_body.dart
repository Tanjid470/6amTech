
class CategoryResponse {
  List<Categories>? categories;

  CategoryResponse({this.categories});

  factory CategoryResponse.fromJson(List<dynamic> json) {
    return CategoryResponse(
      categories: json.map((e) => Categories.fromJson(e)).toList(),
    );
  }
}
class Categories {
  String? name;
  String? image;
  String? imageFullUrl;

  Categories(
      {
        this.name,
        this.image,
        this.imageFullUrl,
        });

  Categories.fromJson(Map<String, dynamic> json) {

    name = json['name'];
    image = json['image'];
    imageFullUrl = json['image_full_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    data['image_full_url'] = imageFullUrl;

    return data;
  }
}

