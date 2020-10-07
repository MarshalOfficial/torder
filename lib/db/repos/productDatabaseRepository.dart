import 'package:TOrder/db/models/product.dart';
import 'package:TOrder/db/models/productDao.dart';
import 'package:TOrder/db/repos_interfaces/productRepository.dart';

import '../DatabaseProvider.dart';

class ProductDatabaseRepository implements ProductRepository {
  final dao = ProductDao();

  @override
  DatabaseProvider databaseProvider;

  ProductDatabaseRepository(this.databaseProvider);

  @override
  Future<Product> insert(Product product) async {
    final db = await databaseProvider.db();
    product.id = await db.insert(dao.tableName, dao.toMap(product));
    return product;
  }

  @override
  Future<Product> delete(Product product) async {
    final db = await databaseProvider.db();
    await db.delete(dao.tableName,
        where: dao.columnId + " = ?", whereArgs: [product.id]);
    return product;
  }

  @override
  Future<Product> update(Product product) async {
    final db = await databaseProvider.db();
    await db.update(dao.tableName, dao.toMap(product),
        where: dao.columnId + " = ?", whereArgs: [product.id]);
    return product;
  }

  @override
  Future<List<Product>> getProducts() async {
    final db = await databaseProvider.db();
    List<Map> maps = await db.query(dao.tableName);
    return dao.fromList(maps);
  }

  @override
  void deleteall() async {
    final db = await databaseProvider.db();
    await db.execute('delete from ' + dao.tableName);
  }
}
