import 'package:TOrder/db/DatabaseProvider.dart';
import 'package:TOrder/db/models/visitor.dart';

abstract class VisitorRepository {
  DatabaseProvider databaseProvider;

  Future<Visitor> insert(Visitor visitor);

  Future<Visitor> update(Visitor visitor);

  Future<Visitor> delete(Visitor visitor);

  Future<List<Visitor>> getVisitors();

  void deleteall();
}
