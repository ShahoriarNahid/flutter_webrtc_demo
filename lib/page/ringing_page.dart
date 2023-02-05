import 'package:flutter/material.dart';
import 'package:flutter_webrtc_demo/page/home_page.dart';
import 'package:get/get.dart';

import '../controller/socket_service.dart';

class RingingPage extends StatefulWidget {
  const RingingPage({super.key});

  @override
  State<RingingPage> createState() => _RingingPageState();
}

class _RingingPageState extends State<RingingPage> {
  final socketS = Get.put(SocketService());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: KAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(children: [
          SizedBox(
            height: 40,
          ),
          TextField(
            onChanged: socketS.userName,
          ),
          SizedBox(
            height: 40,
          ),
          TextField(onChanged: socketS.room),
          SizedBox(
            height: 40,
          ),
          TextButton(
            onPressed: () {
              Get.to(HomePage());
              // socketS.initializeSocket();
              // if (socketS.userName.value != null &&
              //     socketS.room.value != null) {
              //   socketS.initializeSocket();
              // }
            },
            child: Text('call'),
          ),
        ]),
      ),
    );
  }
}
