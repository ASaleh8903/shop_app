class SearchModel {
  bool? status;
  String? message;
  SearchData? data;

  SearchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message']?.toString();
    data = json['data'] != null ? SearchData.fromJson(json['data']) : null;
  }
}

class SearchData {
  int? currentPage;
  List<Product>? products;
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

  SearchData.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];

    if (json['data'] != null) {
      products = (json['data'] as List)
          .map((item) => Product.fromJson(item))
          .toList();
    }

    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url']?.toString();
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url']?.toString();
    to = json['to'];
    total = json['total'];
  }
}

class Product {
  int? id;
  dynamic price;
  dynamic oldPrice;
  int? discount;
  String? image;
  String? name;
  String? description;

  Product({
    this.id,
    this.price,
    this.oldPrice,
    this.discount,
    this.image,
    this.name,
    this.description,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'price': price,
      'old_price': oldPrice,
      'discount': discount,
      'image': image,
      'name': name,
      'description': description,
    };
  }
}
