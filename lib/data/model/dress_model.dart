class DressModel {
  String? sId;
  String? name;
  String? image;
  String? description;
  int? price;
  int? discount;
  String? category;
  bool? sale;
  int? rating;
  String? createdAt;
  String? updatedAt;

  DressModel({
    this.sId,
    this.name,
    this.image,
    this.description,
    this.price,
    this.discount,
    this.category,
    this.sale,
    this.rating,
    this.createdAt,
    this.updatedAt,
  });

  DressModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    price = json['price'];
    discount = json['discount'];
    category = json['category'];
    sale = json['sale'];
    rating = json['rating'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}
