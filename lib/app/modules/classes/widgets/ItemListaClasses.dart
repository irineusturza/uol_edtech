import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uol_edtech_challenge/app/modules/classes/controller_classes.dart';
import 'package:uol_edtech_challenge/app/modules/classes/model_classes.dart';
import 'package:intl/intl.dart';


class ItemListaClasses extends StatelessWidget {
  final ModelClasses? classes;
  final RxString progressString = ''.obs;
  final RxDouble progressPercent = 0.0.obs;
  final RxBool waiting = false.obs;
  final RxBool downloading = false.obs;

  ItemListaClasses({this.classes});

  @override
  Widget build(BuildContext context) {
    final ControllerClasses controller = Get.put(ControllerClasses());
    final DateTime timeStamp = DateTime.fromMillisecondsSinceEpoch(classes!.created_at!);

    return Container(
      constraints: BoxConstraints(minHeight: 90.0),
      color: Colors.transparent,
      child: Card(
        // margin: EdgeInsets.zero,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ListTile(
              leading:
                classes!.status! == "COMPLETED"
                ?
                SizedBox(height: 50.0, width: 50.0, child: Icon(Icons.check_circle, color: Colors.green,))
                :
                classes!.status! == "IN_PROGRESS"
                  ?
                  SizedBox(height: 50.0, width: 50.0, child: Align(
                    alignment: Alignment.center,
                    child: Text(classes!.summary["percentage"].toString() + "%", style: TextStyle(fontSize: 18),),
                  ))
                  :
                  SizedBox(height: 50.0, width: 50.0,  )
              ,
              trailing: InkWell(
                onTap: (){
                  controller.remove(id: classes!.id!);
                },
                child: Container(
                    //Area disponível para toque
                    width: 55.0,
                    height: 50.0,
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(
                          Icons.delete_forever,
                          color: Colors.redAccent,
                          size: 25,
                        )
                      ],
                    )),
              ),
              title: Text(classes!.name!, overflow: TextOverflow.ellipsis, maxLines: 2, style: TextStyle(fontSize: 14.0)),
              subtitle: Column(
                children: [
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        height: 5.0,
                      ),
                      Icon(
                          Icons.calendar_today,
                        color: Colors.grey,
                        size: 15,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        formatDate(timeStamp, [dd, '/', mm, '/', yyyy]),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        height: 5.0,
                      ),
                      Icon(
                        Icons.qr_code,
                        color: Colors.grey,
                        size: 15,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        classes!.id!.length > 10 ? classes!.id!.substring(0, 10)+'...' : classes!.id!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ],
              ),
              enabled: true,
              onTap: () async {
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
