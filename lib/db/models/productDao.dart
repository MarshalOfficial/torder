import 'package:TOrder/db/models/product.dart';

import '../dao.dart';

class ProductDao implements Dao<Product> {
  final tableName = 'products';
  final columnId = 'ID';
  final _columneRPCode = 'ERPCode';
  final _columnBrandERPCode = 'BrandERPCode';
  final _columnKArtNo = 'KArtNo';
  final _columnKBarcode = 'KBarCode';
  final _columnKName = 'K_Name';
  final _columnKpricesail = 'K_price_sail';
  final _columnKpricesail2 = 'K_price_sail2';
  final _columnKpricesail3 = 'K_price_sail3';
  final _columnEndUserPrice = 'EndUserPrice';
  final _columnProductID = 'ProductID';
  final _columnPcompanyID = 'PcompanyID';
  final _columnPBarCodeID = 'PBarCodeID';
  final _columnvat = 'vat';
  final _columnMojodi = 'Mojodi';

  @override
  String get createTableQuery =>
      "CREATE TABLE $tableName($columnId INTEGER PRIMARY KEY AUTOINCREMENT,"
      " $_columneRPCode TEXT,"
      " $_columnBrandERPCode TEXT,"
      " $_columnKArtNo TEXT,"
      " $_columnKBarcode TEXT,"
      " $_columnKName TEXT,"
      " $_columnKpricesail INTEGER,"
      " $_columnKpricesail2 INTEGER,"
      " $_columnKpricesail3 INTEGER,"
      " $_columnEndUserPrice INTEGER,"
      " $_columnProductID INTEGER,"
      " $_columnPcompanyID INTEGER,"
      " $_columnPBarCodeID INTEGER,"
      " $_columnvat INTEGER,"
      " $_columnMojodi INTEGER)";

  @override
  Product fromMap(Map<String, dynamic> query) {
    Product product = Product(
        query[_columneRPCode],
        query[_columnBrandERPCode],
        query[_columnKArtNo],
        query[_columnKBarcode],
        query[_columnKName],
        query[_columnKpricesail],
        query[_columnKpricesail2],
        query[_columnKpricesail3],
        query[_columnEndUserPrice],
        query[_columnProductID],
        query[_columnPcompanyID],
        query[_columnPBarCodeID],
        query[_columnvat],
        query[_columnMojodi]);

    return product;
  }

  @override
  Map<String, dynamic> toMap(Product object) {
    return <String, dynamic>{
      _columneRPCode: object.eRPCode,
      _columnBrandERPCode: object.brandERPCode,
      _columnKArtNo: object.kArtNo,
      _columnKBarcode: object.kBarCode,
      _columnKName: object.kName,
      _columnKpricesail: object.kpricesail,
      _columnKpricesail2: object.kpricesail2,
      _columnKpricesail3: object.kpricesail3,
      _columnEndUserPrice: object.endUserPrice,
      _columnProductID: object.productID,
      _columnPcompanyID: object.pcompanyID,
      _columnPBarCodeID: object.pBarCodeID,
      _columnvat: object.vat,
      _columnMojodi: object.mojodi,
    };
  }

  @override
  List<Product> fromList(List<Map<String, dynamic>> query) {
    List<Product> products = List<Product>();
    for (Map map in query) {
      products.add(fromMap(map));
    }
    return products;
  }
}
