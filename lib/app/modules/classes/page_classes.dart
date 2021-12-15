import 'package:easy_localization/easy_localization.dart';
import 'package:uol_edtech_challenge/app/modules/classes/controller_classes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uol_edtech_challenge/app/modules/classes/widgets/ItemListaClasses.dart';

class PageClasses extends GetView<ControllerClasses> {

  @override
  Widget build(BuildContext context) {
    final ControllerClasses controller = Get.put(ControllerClasses());

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      controller.loadList();
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          tr("classes").toUpperCase(),
        ),
      ),
      body:
      CustomScrollView(
        slivers: <Widget>[
          Obx(
                () => SliverFillRemaining(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.only(top: 5, left: 2, right: 2),
                      itemCount: controller.list.length,
                      itemBuilder: (context, position) {
                        return ItemListaClasses(classes: controller.list[position]);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}