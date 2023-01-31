import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:flutter_webrtc_demo/page/audio_call_page.dart';
import 'package:flutter_webrtc_demo/page/r_history.dart';
import 'package:flutter_webrtc_demo/page/video_call_page.dart';
import 'package:get/get.dart';

import '../controller/socket_service.dart';
import '../controller/userlist_controller.dart';
import '../helper/Chat.dart';
import 'add_room_page.dart';
import 'video_calling_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final socketS = Get.put(SocketService());
  final userListC = Get.put(UserListController());
  late int currentIndex;
  @override
  Widget build(BuildContext context) {
    // socketS.initializeSocket();
    userListC.getUserModelList();

    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: Color.fromARGB(255, 190, 73, 233),
    //     title: Text('WeabRTC'),
    //     actions: [
    //       IconButton(
    //         onPressed: () {},
    //         icon: Icon(Icons.group_add_rounded),
    //       ),
    //       IconButton(
    //         onPressed: () {},
    //         icon: Icon(Icons.more_horiz),
    //       ),
    //       SizedBox(height: 10),
    //     ],
    //   ),
    //   body: OrientationBuilder(builder: (context, orientation) {
    //     return Stack(children: <Widget>[
    //       Positioned(
    //           left: 0.0,
    //           right: 0.0,
    //           top: 0.0,
    //           bottom: 0.0,
    //           child: Container(
    //             margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
    //             width: MediaQuery.of(context).size.width,
    //             height: MediaQuery.of(context).size.height,
    //             child: RTCVideoView(
    //               socketS.remoteRenderer,
    //             ),
    //             decoration: BoxDecoration(color: Colors.black54),
    //           )),
    //       Positioned(
    //         left: 20.0,
    //         top: 20.0,
    //         child: Container(
    //           width: orientation == Orientation.portrait ? 90.0 : 120.0,
    //           height: orientation == Orientation.portrait ? 120.0 : 90.0,
    //           child: RTCVideoView(
    //             socketS.localRenderer,
    //             mirror: true,
    //           ),
    //           decoration: BoxDecoration(color: Colors.black54),
    //         ),
    //       ),
    //     ]);
    //   }),
    //   floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    //   floatingActionButton: SizedBox(
    //       width: 240.0,
    //       child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: <Widget>[
    //             FloatingActionButton(
    //               heroTag: 'btn1',
    //               child: const Icon(Icons.switch_camera),
    //               tooltip: 'Camera',
    //               onPressed: () {},
    //             ),
    //             // FloatingActionButton(
    //             //   child: const Icon(Icons.desktop_mac),
    //             //   tooltip: 'Screen Sharing',
    //             //   onPressed: () {},
    //             // ),
    //             FloatingActionButton(
    //               heroTag: 'btn2',
    //               onPressed: () {},
    //               tooltip: 'Hangup',
    //               child: Icon(Icons.call_end),
    //               backgroundColor: Colors.pink,
    //             ),
    //             FloatingActionButton(
    //               heroTag: 'btn3',
    //               child: const Icon(Icons.mic_off),
    //               tooltip: 'Mute Mic',
    //               onPressed: () {
    //                 socketS.initializeSocket();
    //               },
    //             )
    //           ])),
    // );

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
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  padding: EdgeInsets.only(top: 12),
                  itemCount: userListC.userListModel.length,
                  itemBuilder: ((context, index) {
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
                        width: 105,
                        child: Row(
                          children: [
                            IconButton(
                              color: Colors.green,
                              onPressed: () {
                                Get.to(AudioCallPage(
                                  user: item,
                                ));
                              },
                              icon: Icon(Icons.call),
                            ),
                            SizedBox(width: 5),
                            IconButton(
                              color: Colors.red,
                              onPressed: () {
                                Get.to(VideoCallPage(user: item));
                              },
                              icon: Icon(Icons.video_camera_front),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                      // => (index != chatsData.length)
                      // ? ChatCard(
                      //   chat: chatsData[index], press: () {}
                      //     //  => Navigator.push(
                      //     //   context,
                      //     //   MaterialPageRoute(builder: (context) => InboxScreen()),
                      //     // ),
                      //     )
                      // : Padding(
                      //     padding: EdgeInsets.only(top: 12, bottom: 12 * 5),
                      //     child: Text(
                      //       'Tap and hold on a chat for more options',
                      //       textAlign: TextAlign.center,
                      //       style: TextStyle(
                      //         fontWeight: FontWeight.w700,
                      //         fontSize: 12,
                      //         color: Color.fromARGB(255, 0, 93, 75),
                      //       ),
                      //     ),
                      //   )),

                      )),
            ],
          ),
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
            Get.to(() => null);
          } else if (currentIndex == 2) {
            Get.to(() => null);
          } else if (currentIndex == 3) {
            Get.to(() => AddRoomPage());
          }
        },
        items: [
          BottomNavigationBarItem(
            label: 'Chats',
            icon: Icon(Icons.chat_rounded),
          ),
          BottomNavigationBarItem(
            label: 'Audio',
            icon: Icon(Icons.call_rounded),
          ),
          BottomNavigationBarItem(
            label: 'Video',
            icon: Icon(Icons.videocam_rounded),
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
                child: Text('abc'
                    // fontWeight: FontWeight.w600,
                    // maxLines: 2,
                    // color: isDarkMode ? Colors.white : Colors.black87,
                    ),
              ),
              SizedBox(
                width: 5,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // Get.to(AudioCallPage());
                    },
                    icon: Icon(Icons.call),
                  ),
                  IconButton(
                    onPressed: () {
                      // Get.to(VideoCallPage());
                    },
                    icon: Icon(Icons.video_call),
                  ),
                  IconButton(
                    onPressed: () {
                      // Get.to(AddRoomPage());
                    },
                    icon: Icon(Icons.group),
                  ),
                ],
              ),
              // Opacity(
              //   opacity: 0.5,
              //   child: Text(
              //     chat.time,
              //     // fontSize: 12,
              //     // // color: isDarkMode ? Colors.white : Colors.black87,
              //     // color: chat.msgTotal == 0
              //     //     ? Colors.white
              //     //     : isDarkMode
              //     //         ? Color.fromARGB(255, 0, 93, 75)
              //     //         : Color.fromARGB(255, 0, 93, 75) ,
              //   ),
              // ),
            ],
          ),
          SizedBox(height: 3),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Expanded(
          //       child: Row(
          //         children: [
          //           if (chat.isSeen == true && chat.msgTotal == 0)
          //             Icon(
          //               Icons.done_all_sharp,
          //               color: Color.fromARGB(255, 0, 93, 75),
          //               size: 18,
          //             )
          //           else if (chat.isSeen == false && chat.msgTotal > 0)
          //             Icon(
          //               Icons.done_all_sharp,
          //               color: Color.fromARGB(255, 0, 93, 75),
          //               size: 18,
          //             )
          //           else if (chat.isSeen == false && chat.msgTotal == 0)
          //             Icon(
          //               Icons.done_all_sharp,
          //               color: Color.fromARGB(255, 0, 93, 75),
          //               size: 18,
          //             ),
          //           Expanded(
          //             child: Opacity(
          //               opacity: 0.6,
          //               child: Text(
          //                 ' ${chat.lastMessage}',
          //                 maxLines: 1,
          //                 overflow: TextOverflow.ellipsis,
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //     Row(
          //       children: [
          //         SizedBox(width: 2),
          //         Icon(Icons.volume_off_rounded),
          //         SizedBox(width: 8),
          //         if (chat.msgTotal != 0)
          //           CircleAvatar(
          //             radius: 10,
          //             backgroundColor: isDarkMode
          //                 ? Color.fromARGB(255, 0, 93, 75)
          //                 : Color.fromARGB(255, 0, 93, 75),
          //             child: Padding(
          //               padding: const EdgeInsets.all(1.0),
          //               child: Text(
          //                 chat.msgTotal.toString() + 0.toString(),
          //                 style: TextStyle(fontSize: 10),
          //                 // fontSize: 10,
          //                 // color: Color.fromARGB(255, 0, 93, 75) ,
          //               ),
          //             ),
          //           ),
          //       ],
          //     ),
          //   ],
          // ),
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
