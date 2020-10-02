import 'package:TOrder/db/models/visitor.dart';
import 'package:TOrder/db/models/visitorDao.dart';
import 'package:TOrder/db/repos_interfaces/visitorRepository.dart';

import '../DatabaseProvider.dart';

class VisitorDatabaseRepository implements VisitorRepository {
  final dao = VisitorDao();

  @override
  DatabaseProvider databaseProvider;

  VisitorDatabaseRepository(this.databaseProvider);

  @override
  Future<Visitor> insert(Visitor visitor) async {
    final db = await databaseProvider.db();
    visitor.visitorCode = await db.insert(dao.tableName, dao.toMap(visitor));
    return visitor;
  }

  @override
  Future<Visitor> delete(Visitor visitor) async {
    final db = await databaseProvider.db();
    await db.delete(dao.tableName,
        where: dao.columnId + " = ?", whereArgs: [visitor.visitorCode]);
    return visitor;
  }

  @override
  Future<Visitor> update(Visitor visitor) async {
    final db = await databaseProvider.db();
    await db.update(dao.tableName, dao.toMap(visitor),
        where: dao.columnId + " = ?", whereArgs: [visitor.visitorCode]);
    return visitor;
  }

  @override
  Future<List<Visitor>> getNotes() async {
    final db = await databaseProvider.db();
    List<Map> maps = await db.query(dao.tableName);
    return dao.fromList(maps);
  }
}
