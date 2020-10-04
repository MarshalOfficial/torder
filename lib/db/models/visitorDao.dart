import 'package:TOrder/db/models/visitor.dart';

import '../dao.dart';

class VisitorDao implements Dao<Visitor> {
  final tableName = 'visitors';
  final columnVisitorCode = 'Visitor_Code';
  final _columnVisitorName = 'Visitor_Name';
  final _columnMobileNo = 'MobileNo';
  final _columnPocketPassword = 'PocketPassword';
  final _columnIsYou = 'IsYou';

  @override
  String get createTableQuery =>
      "CREATE TABLE $tableName($columnVisitorCode INTEGER PRIMARY KEY,"
      " $_columnVisitorName TEXT,"
      " $_columnMobileNo TEXT,"
      " $_columnPocketPassword TEXT,"
      " $_columnIsYou INTEGER)";

  @override
  Visitor fromMap(Map<String, dynamic> query) {
    Visitor visitor = Visitor(
        query[columnVisitorCode],
        query[_columnVisitorName],
        query[_columnMobileNo],
        query[_columnPocketPassword],
        query[_columnIsYou]);

    return visitor;
  }

  @override
  Map<String, dynamic> toMap(Visitor object) {
    return <String, dynamic>{
      _columnVisitorName: object.visitorName,
      _columnMobileNo: object.mobileNo,
      _columnPocketPassword: object.pocketPassword,
      _columnIsYou: object.isYou
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
