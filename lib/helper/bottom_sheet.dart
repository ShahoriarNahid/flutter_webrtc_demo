import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_webrtc_demo/helper/log.dart';
import 'package:get/get.dart';

import '../controller/userlist_controller.dart';

searchLocationBottomSheet() async {
  final userListC = Get.put(UserListController());
  try {
    await Get.bottomSheet(
      isScrollControlled: true,
      barrierColor: Colors.transparent,
      persistent: false,
      isDismissible: true,
      SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          height: 440,
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              SizedBox(
                height: 365,
                child: ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: userListC.userListModel.length,
                    itemBuilder: (context, index) {
                      final item = userListC.userListModel[index];
                      return ListTile(
                        onTap: () {},
                        leading: CircleAvatar(
                          radius: 20,
                          child: FlutterLogo(),
                        ),
                        title: Text(item.fullname != ''
                            ? '${item.fullname}'
                            : '${item.username}'),
                        trailing: Container(
                          // color: Colors.amber,
                          width: 50,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  kLog(jsonEncode(item));
                                },
                                icon: Icon(Icons.add),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(height: 5),
              Center(
                child: ElevatedButton(
                  onPressed: () => Get.to(() => null),
                  child: Text('Add User'),
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    backgroundColor: Colors.green,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  } catch (e) {
    print(e);
  }
}
