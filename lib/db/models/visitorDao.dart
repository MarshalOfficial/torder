import 'package:TOrder/db/models/visitor.dart';

import '../dao.dart';

class VisitorDao implements Dao<Visitor> {
  final tableName = 'visitors';
  final columnId = 'visitorcode';
  final _columnName = 'visitorname';
  final _columnMobile = 'mobileno';
  final _columnPocketPass = 'pocketpassword';

  @override
  String get createTableQuery =>
      "CREATE TABLE $tableName($columnId INTEGER PRIMARY KEY,"
      " $_columnName TEXT,"
      " $_columnMobile TEXT,"
      " $_columnPocketPass TEXT)";

  @override
  Visitor fromMap(Map<String, dynamic> query) {
    Visitor visitor = Visitor(query[columnId], query[_columnName],
        query[_columnMobile], query[_columnPocketPass]);

    return visitor;
  }

  @override
  Map<String, dynamic> toMap(Visitor object) {
    return <String, dynamic>{
      _columnName: object.visitorName,
      _columnMobile: object.mobileNo,
      _columnPocketPass: object.pocketPassword
    };
  }

  @override
  List<Visitor> fromList(List<Map<String, dynamic>> query) {
    List<Visitor> visitors = List<Visitor>();
    for (Map map in query) {
      visitors.add(fromMap(map));
    }
    return visitors;
  }
}
