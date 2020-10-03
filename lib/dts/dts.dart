import 'package:TOrder/api/api_repo.dart';

class DTS {
  static String deviceID;

  static void getAllDataFromServer(String deviceid) async {
    deviceID = deviceid;
    await getVisitors();
  }

  static void getVisitors() async {
    try {
      var lst = ApiRepo.callWithHeaserParams(
          'DTS_GetVisitors', '{"deviceid":"' + deviceID + '"}');
    } catch (e) {
      var err = e.toString();
    }
  }
}
