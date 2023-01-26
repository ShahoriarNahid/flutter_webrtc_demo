import 'package:flutter/material.dart';
import 'package:flutter_webrtc_demo/page/videocall_page.dart';
import 'package:get/get.dart';

import '../controller/socket_service.dart';

class CallPage extends StatefulWidget {
  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  final socketS = Get.put(SocketService());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Call page'),
      ),
      body: Column(
        children: [
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
          Center(
            child: ElevatedButton(
              onPressed: () async {
                if (socketS.userName.value.isNotEmpty &&
                    socketS.room.value.isNotEmpty) {
                  socketS.initializeSocket();
                }

                //  await Get.to(VideoCallPage());
              },
              child: Text('Call'),
            ),
          ),
        ],
      ),
    );
  }
}
