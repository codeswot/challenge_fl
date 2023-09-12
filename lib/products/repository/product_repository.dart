import 'package:challenge_fl/products/models/models.dart';

abstract class ProductRepository {
  Stream<List<Product>> products();
}
