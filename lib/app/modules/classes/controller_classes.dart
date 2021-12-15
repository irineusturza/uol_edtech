import 'package:get/get.dart';
import 'package:uol_edtech_challenge/app/modules/classes/model_classes.dart';
import 'package:uol_edtech_challenge/app/modules/classes/repository_classes.dart';

class ControllerClasses extends GetxController {
  final RxList<ModelClasses> list = <ModelClasses>[].obs;
  final RxInt currentLength = 0.obs;

  Future<void> loadList() async {
    var response = await (RepositoryClasses().getAll());

    this.list.clear();

    if (response != null){
      for (var c in response) {
        this.list.add(
          ModelClasses(
            company_id: c["company_id"],
            created_at: c["created_at"],
            name: c["name"],
            id: c["id"],
            status: c["status"],
            summary: c["summary"],
          )
        );
      }
    }

    this.list.sort();

    currentLength.value = this.list.length;

  }

  Future<void> remove({required String id}) async {

    this.list.removeWhere((item) => item.id == id);

    this.list.sort();

    currentLength.value = this.list.length;

  }

}