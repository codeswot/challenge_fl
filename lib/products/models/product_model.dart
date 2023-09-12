import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

export 'product_model.dart';

class Product extends Equatable {
  const Product({
    required this.id,
    required this.averageRating,
    required this.brandId,
    required this.brandName,
    required this.color,
    required this.name,
    required this.description,
    required this.gender,
    required this.price,
    required this.reviwesCount,
    required this.images,
    required this.sizes,
    required this.createdAt,
    required this.updatedAt,
  });
  final String id;
  final String name;
  final String description;
  final String color;
  final String brandId;
  final String brandName;
  final String gender;
  final double price;
  final double averageRating;
  final int reviwesCount;
  final List<String> images;
  final List<double> sizes;
  final DateTime createdAt;
  final DateTime updatedAt;

  static Product fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      color: json['color'] as String,
      brandId: json['brandId'] as String,
      brandName: json['brandName'] as String,
      gender: json['gender'] as String,
      price: json['price'] as double,
      averageRating: json['averageRating'] as double,
      reviwesCount: json['reviwesCount'] as int,
      images: json['images'] as List<String>,
      sizes: json['sizes'] as List<double>,
      createdAt: (json['createdAt'] as Timestamp).toDate(),
      updatedAt: (json['updatedAt'] as Timestamp).toDate(),
    );
  }

  static Product fromSnapshot(DocumentSnapshot snap) {
    return Product.fromJson(snap.data() as Map<String, dynamic>);
  }

  Map<String, Object> toDocument() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'color': color,
      'brandId': brandId,
      'brandName': brandName,
      'gender': gender,
      'price': price,
      'averageRating': averageRating,
      'reviwesCount': reviwesCount,
      'images': images,
      'sizes': sizes,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  @override
  List<Object?> get props => [id, name, description];
}
