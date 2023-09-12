import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

export 'product_model.dart';

class Product extends Equatable {
  const Product({
    required this.id,
    required this.averageRatings,
    required this.brandId,
    required this.brandName,
    required this.color,
    required this.name,
    required this.description,
    required this.gender,
    required this.price,
    required this.reviewCount,
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
  final num price;
  final num averageRatings;
  final num reviewCount;
  final List<dynamic> images;
  final List<dynamic> sizes;
  final DateTime createdAt;
  final DateTime updatedAt;

  static Product fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      color: json['color'],
      brandId: json['brandId'],
      brandName: json['brandName'],
      gender: json['gender'],
      price: json['price'],
      averageRatings: json['averageRatings'],
      reviewCount: json['reviewCount'],
      images: json['images'],
      sizes: json['sizes'],
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
      'averageRating': averageRatings,
      'reviwesCount': reviewCount,
      'images': images,
      'sizes': sizes,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  @override
  List<Object?> get props => [id, name, description];
}
