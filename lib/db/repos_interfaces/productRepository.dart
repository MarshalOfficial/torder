import 'package:TOrder/db/models/product.dart';

import '../DatabaseProvider.dart';

abstract class ProductRepository {
  DatabaseProvider databaseProvider;

  Future<Product> insert(Product product);

  Future<Product> update(Product product);

  Future<Product> delete(Product product);

  Future<List<Product>> getProducts();

  void deleteall();
}
