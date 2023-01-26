import 'package:flutter/material.dart';
import 'package:flutter_webrtc_demo/page/audio_call_page.dart';
import 'package:flutter_webrtc_demo/page/video_call_page.dart';
import 'package:get/get.dart';

import '../controller/socket_service.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final socketS = Get.put(SocketService());
  late int currentIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 190, 73, 233),
        title: Text('WeabRTC'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.group_add_rounded),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_horiz),
          ),
          SizedBox(height: 10),
        ],
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('hhhhhh'),
                  onTap: () {},
                  dense: true,
                );
              },
            ),
            // TextField(
            //   onChanged: socketS.userName,
            // ),
            // SizedBox(
            //   height: 40,
            // ),
            // TextField(onChanged: socketS.room),
            // SizedBox(
            //   height: 40,
            // ),
            // Center(
            //   child: ElevatedButton(
            //     onPressed: () async {
            //       if (socketS.userName.value.isNotEmpty &&
            //           socketS.room.value.isNotEmpty) {
            //         socketS.initializeSocket();
            //       }

            //       //  await Get.to(VideoCallPage());
            //     },
            //     child: Text('Call'),
            //   ),
            // ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(255, 190, 73, 233),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (int value) {
          setState(() {
            currentIndex = value;
          });
          print(currentIndex);
          if (currentIndex == 1) {
            Get.to(() => AudioCallPage());
          } else if (currentIndex == 2) {
            Get.to(() => VideoCallPage());
          }
        },
        items: [
          BottomNavigationBarItem(
            label: 'Chats',
            icon: Icon(Icons.chat_rounded),
          ),
          BottomNavigationBarItem(
            label: 'Calls',
            icon: Icon(Icons.videocam_rounded),
          ),
          BottomNavigationBarItem(
            label: 'People',
            icon: Icon(Icons.people_rounded),
          ),
          BottomNavigationBarItem(
            label: 'Group',
            icon: Icon(Icons.group_add_rounded),
          ),
        ],
      ),
    );
  }
}
