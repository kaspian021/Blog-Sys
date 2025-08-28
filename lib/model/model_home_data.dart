

// Define the root model for the home data
class ModelHomeData {
  final List<Following> following;
  final List<Category> category;
  final ProductsBest productsBest;

  ModelHomeData({
    required this.following,
    required this.category,
    required this.productsBest,
  });

  factory ModelHomeData.fromJson(Map<String, dynamic> json) {
    return ModelHomeData(
      following: (json['following'] as List<dynamic>)
          .map((e) => Following.fromJson(e as Map<String, dynamic>))
          .toList(),
      category: (json['category'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      productsBest:
          ProductsBest.fromJson(json['products_best'] as Map<String, dynamic>),
    );
  }
}

// Model for the 'Following' section
class Following {
  final int id;
  final String username;
  final String imagePath;
  final Location location;
  final List<Product> products;

  Following({
    required this.id,
    required this.username,
    required this.imagePath,
    required this.location,
    required this.products,
  });

  factory Following.fromJson(Map<String, dynamic> json) {
    return Following(
      id: json['id'] as int,
      username: json['username'] as String,
      imagePath: json['image_path'] as String,
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      products: (json['products'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

// Model for 'Location'
class Location {
  final double lat;
  final double long;

  Location({
    required this.lat,
    required this.long,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      lat: json['lat'] as double,
      long: json['long'] as double,
    );
  }
}

// Model for a 'Product'
class Product {
  final String name;
  final int price;
  final DateTime date;
  final String writer;
  final int id;
  final String imagePath;
  final String desc;
  final String category;
  final int like;
  final int ownerId;

  Product({
    required this.name,
    required this.price,
    required this.date,
    required this.writer,
    required this.id,
    required this.imagePath,
    required this.desc,
    required this.category,
    required this.like,
    required this.ownerId,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'] as String,
      price: json['price'] as int,
      date: DateTime.parse(json['date'] as String),
      writer: json['writer'] as String,
      id: json['id'] as int,
      imagePath: json['image_path'] as String,
      desc: json['desc'] as String,
      category: json['category'] as String,
      like: json['like'] as int,
      ownerId: json['owner_id'] as int,
    );
  }
}

// Model for the 'Category' section
class Category {
  final String title;
  final String imagePath;

  Category({
    required this.title,
    required this.imagePath,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      title: json['title'] as String,
      imagePath: json['image_path'] as String,
    );
  }
}

// Model for the 'ProductsBest' section
class ProductsBest {
  final List<Product> allProduct;

  ProductsBest({
    required this.allProduct,
  });

  factory ProductsBest.fromJson(Map<String, dynamic> json) {
    return ProductsBest(
      allProduct: (json['all_product'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}