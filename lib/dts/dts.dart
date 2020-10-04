import 'package:TOrder/api/api_repo.dart';
import 'package:TOrder/db/DatabaseProvider.dart';
import 'package:TOrder/db/models/visitorDao.dart';
import 'package:TOrder/db/repos/visitorDatabaseRepository.dart';
import 'package:TOrder/extension/extension.dart';

class DTS {
  static String deviceID;

  static void getAllDataFromServer(String deviceid) async {
    deviceID = deviceid;
    var result = true;

    if (result) result = await getVisitors();
  }

  static Future<bool> getVisitors() async {
    try {
      var lst = await ApiRepo.callWithHeaserParams(
          'DTS_GetVisitors', '{"deviceid":"' + deviceID + '"}');
      var result = Extension.isApiCallResultSucceed(lst);
      if (result) {
        var repo = new VisitorDatabaseRepository(DatabaseProvider.get);
        await repo.deleteall();
        lst.forEach((element) {
          repo.insert(VisitorDao().fromMap(element));
        });

        return true;
      } else {
        return false;
      }
    } catch (e) {
      Extension.showErrorToast(e.toString());
      return false;
    }
  }
}
