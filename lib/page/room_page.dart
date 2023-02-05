import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:get/get.dart';

import '../controller/socket_service.dart';

class RoomPage extends StatelessWidget {
  final socketS = Get.put(SocketService());
  @override
  Widget build(BuildContext context) {
    socketS.initializeSocket();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 190, 73, 233),
        title: Text('Room'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          SizedBox(
            height: 210,
            width: Get.width,
            child: Row(children: [
              Flexible(
                child: Container(
                  key: const Key('local'),
                  margin: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                  decoration: const BoxDecoration(color: Colors.black),
                  child: RTCVideoView(socketS.localRenderer),
                ),
              ),
              Flexible(
                child: Container(
                  key: const Key('remote'),
                  margin: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                  decoration: const BoxDecoration(color: Colors.black),
                  child: RTCVideoView(socketS.remoteRenderer),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
