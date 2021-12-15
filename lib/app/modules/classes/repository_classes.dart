
import 'package:get/get.dart';
import 'package:uol_edtech_challenge/app/modules/classes/provider_classes.dart';

class RepositoryClasses {
  var provider = Get.put(ProviderClasses());
  Future getAll() async {
    return provider.list().then((value) {
      return value;
    });
  }

}
