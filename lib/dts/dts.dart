import 'package:TOrder/api/api_repo.dart';
import 'package:TOrder/db/DatabaseProvider.dart';
import 'package:TOrder/db/models/productDao.dart';
import 'package:TOrder/db/models/visitorDao.dart';
import 'package:TOrder/db/repos/productDatabaseRepository.dart';
import 'package:TOrder/db/repos/visitorDatabaseRepository.dart';
import 'package:TOrder/extension/extension.dart';
import 'package:geolocator/geolocator.dart';

class DTS {
  static String deviceID;
  static Position position;

  static void getAllDataFromServer(String deviceid) async {
    deviceID = deviceid;
    var result = true;

    bool isGPSOn = await Extension.isLocationServiceEnabled();
    if (!isGPSOn) {
      Extension.showErrorToast("جی پی اس دستگاه خود را روشن کنید");
      return;
    } else {
      position = await Extension.getCurrentLocation();
    }

    if (result) result = await getVisitors();
    if (result) result = await getProducts();
  }

  static Future<bool> getVisitors() async {
    try {
      var lst = await ApiRepo.callWithHeaserParams(
          'DTS_GetVisitors',
          '{"deviceid":"' +
              deviceID +
              '","lat":' +
              position.latitude.toString() +
              ',"long":' +
              position.longitude.toString() +
              '}');
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

  static Future<bool> getProducts() async {
    try {
      var lst = await ApiRepo.callWithHeaserParams(
          'DTS_GetProducts',
          '{"deviceid":"' +
              deviceID +
              '","lat":' +
              position.latitude.toString() +
              ',"long":' +
              position.longitude.toString() +
              '}');
      var result = Extension.isApiCallResultSucceed(lst);
      if (result) {
        var repo = new ProductDatabaseRepository(DatabaseProvider.get);
        await repo.deleteall();
        lst.forEach((element) {
          repo.insert(ProductDao().fromMap(element));
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
