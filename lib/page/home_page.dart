import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:flutter_webrtc_demo/page/audio_call_page.dart';
import 'package:flutter_webrtc_demo/page/r_history.dart';
import 'package:flutter_webrtc_demo/page/video_call_page.dart';
import 'package:get/get.dart';

import '../controller/socket_service.dart';
import '../helper/Chat.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final socketS = Get.put(SocketService());
  late int currentIndex;
  @override
  Widget build(BuildContext context) {
    socketS.initializeSocket();
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
            SizedBox(
              height: 210,
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
            SizedBox(height: 20),

            ListView.builder(
              shrinkWrap: true,
              primary: false,
              padding: EdgeInsets.only(top: 12),
              itemCount: chatsData.length + 1,
              itemBuilder: ((context, index) => (index != chatsData.length)
                  ? ChatCard(chat: chatsData[index], press: () {}
                      //  => Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => InboxScreen()),
                      // ),
                      )
                  : Padding(
                      padding: EdgeInsets.only(top: 12, bottom: 12 * 5),
                      child: Text(
                        'Tap and hold on a chat for more options',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          color: Color.fromARGB(255, 0, 93, 75),
                        ),
                      ),
                    )),
            ),
            // ListView.builder(
            //   shrinkWrap: true,
            //   primary: false,
            //   itemCount: 20,
            //   itemBuilder: (BuildContext context, int index) {
            //     return ListTile(
            //       title: Text('hhhhhh'),
            //       onTap: () {},
            //       dense: true,
            //     );
            //   },
            // ),
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
          } else if (currentIndex == 3) {
            Get.to(() => RHistoryPage());
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

//-----//

class ChatCard extends StatelessWidget {
  const ChatCard({
    Key? key,
    required this.chat,
    required this.press,
  }) : super(key: key);

  final Chat chat;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    // return CartWidget(chat: chat, isDarkMode: isDarkMode);
    return ListTile(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => ChatScreen(
        //       image: chat.image,
        //       name: chat.name,
        //       status: chat.isActive,
        //       chat: chat,
        //     ),
        //   ),
        // );
      },
      onLongPress: () {
        print('object');
      },
      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      leading: Container(
        decoration: BoxDecoration(
          boxShadow: [
            // BoxShadow(
            //   color: Colors.grey.withOpacity(.5),
            //   blurRadius: 5.0,
            //   spreadRadius: 1,
            //   offset: Offset(0.0, 0.0),
            // )
          ],
          // borderRadius: BorderRadius.circular(100),
          // border: Border.all(
          //   width: 1,
          //   color: Colors.white,
          // ),
        ),
        child: CircleAvatar(
          radius: 26,
          backgroundImage: AssetImage(
            chat.image,
          ),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  chat.name,
                  // fontWeight: FontWeight.w600,
                  // maxLines: 2,
                  // color: isDarkMode ? Colors.white : Colors.black87,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Opacity(
                opacity: 0.5,
                child: Text(
                  chat.time,
                  // fontSize: 12,
                  // // color: isDarkMode ? Colors.white : Colors.black87,
                  // color: chat.msgTotal == 0
                  //     ? Colors.white
                  //     : isDarkMode
                  //         ? Color.fromARGB(255, 0, 93, 75)
                  //         : Color.fromARGB(255, 0, 93, 75) ,
                ),
              ),
            ],
          ),
          SizedBox(height: 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    if (chat.isSeen == true && chat.msgTotal == 0)
                      Icon(
                        Icons.done_all_sharp,
                        color: Color.fromARGB(255, 0, 93, 75),
                        size: 18,
                      )
                    else if (chat.isSeen == false && chat.msgTotal > 0)
                      Icon(
                        Icons.done_all_sharp,
                        color: Color.fromARGB(255, 0, 93, 75),
                        size: 18,
                      )
                    else if (chat.isSeen == false && chat.msgTotal == 0)
                      Icon(
                        Icons.done_all_sharp,
                        color: Color.fromARGB(255, 0, 93, 75),
                        size: 18,
                      ),
                    Expanded(
                      child: Opacity(
                        opacity: 0.6,
                        child: Text(
                          ' ${chat.lastMessage}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  SizedBox(width: 2),
                  Icon(Icons.volume_off_rounded),
                  SizedBox(width: 8),
                  if (chat.msgTotal != 0)
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: isDarkMode
                          ? Color.fromARGB(255, 0, 93, 75)
                          : Color.fromARGB(255, 0, 93, 75),
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Text(
                          chat.msgTotal.toString() + 0.toString(),
                          style: TextStyle(fontSize: 10),
                          // fontSize: 10,
                          // color: Color.fromARGB(255, 0, 93, 75) ,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
      // trailing: KText(text: '11/11/2022'),
      dense: true,
      enabled: true,
      autofocus: true,
      // focusColor: hexToColor('#F3F3F3'),
      // hoverColor: hexToColor('#F3F3F3'),
      // selectedColor: hexToColor('#F3F3F3'),
    );
  }
}
