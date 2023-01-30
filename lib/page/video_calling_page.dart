import 'dart:math';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:get/get.dart';

import '../controller/socket_service.dart';
import '../main.dart';
import 'CameraView.dart';

// late List<CameraDescription> cameras;

class VideoCallingPage extends StatefulWidget {
  @override
  _VideoCallingPageState createState() => _VideoCallingPageState();
}

class _VideoCallingPageState extends State<VideoCallingPage> {
//  final StopWatchTimer _stopWatchTimer = StopWatchTimer(); // Create instance.
  late CameraController _cameraController;
  Future<void>? cameraValue;
  bool isRecoring = false;
  bool flash = false;
  bool iscamerafront = true;
  double transform = 0;

  @override
  void initState() {
    super.initState();
    // _cameraController = CameraController(cameras[0], ResolutionPreset.high);
    // cameraValue = _cameraController.initialize();
  }

  @override
  void dispose() async {
    super.dispose();
    //  _cameraController.dispose();
    //   await _stopWatchTimer.dispose();
  }

  final socketS = Get.put(SocketService());
  @override
  Widget build(BuildContext context) {
    // if (!_cameraController.value.isInitialized) {
    //   return Container();
    // }
    socketS.initializeSocket();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 190, 73, 233),
        title: Text(
          'Habibur Rahman',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.black87,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            // child: CameraPreview(_cameraController),
            child: socketS.remoteRenderer != null
                ? RTCVideoView(socketS.remoteRenderer)
                : SizedBox(),
          ),

          Positioned(
            bottom: 70.0,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 6),
                height: 60,
                width: Get.width,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.6),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      width: 1,
                      color: Colors.white,
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.video_call,
                        color: Colors.white,
                        size: 30,
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color?>(
                            Colors.transparent),
                        shadowColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        shape: MaterialStateProperty.all(CircleBorder()),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        socketS.initializeSocket();
                      },
                      child: Icon(
                        Icons.mic,
                        color: Colors.white,
                        size: 30,
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color?>(
                            Colors.transparent),
                        shadowColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        shape: MaterialStateProperty.all(CircleBorder()),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.image_sharp,
                        color: Colors.white,
                        size: 25,
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color?>(
                            Colors.transparent),
                        shadowColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        shape: MaterialStateProperty.all(CircleBorder()),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          iscamerafront = !iscamerafront;
                          transform = transform + pi;
                        });
                        int cameraPos = iscamerafront ? 0 : 1;
                        _cameraController = CameraController(
                          cameras[cameraPos],
                          ResolutionPreset.high,
                        );
                        cameraValue = _cameraController.initialize();
                      },
                      child: Icon(
                        Icons.flip_camera_ios_rounded,
                        color: Colors.white,
                        size: 25,
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color?>(
                            Colors.transparent),
                        shadowColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        shape: MaterialStateProperty.all(CircleBorder()),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.call,
                        color: Colors.white,
                        size: 25,
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color?>(Colors.redAccent),
                        shadowColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        shape: MaterialStateProperty.all(CircleBorder()),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Positioned(
          //   bottom: 0.0,
          //   child: Container(
          //     // color: Colors.black,
          //     padding: EdgeInsets.only(top: 5, bottom: 5),
          //     width: MediaQuery.of(context).size.width,
          //     child: Column(
          //       children: [
          //         Row(
          //           mainAxisSize: MainAxisSize.max,
          //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //           children: [
          //             IconButton(
          //                 icon: Icon(
          //                   Icons.image,
          //                   color: Colors.white,
          //                   size: 25,
          //                 ),
          //                 highlightColor: Colors.grey.withOpacity(.5),
          //                 onPressed: () {
          //                   setState(() {
          //                     flash = !flash;
          //                   });
          //                   flash
          //                       ? _cameraController
          //                           .setFlashMode(FlashMode.torch)
          //                       : _cameraController.setFlashMode(FlashMode.off);
          //                 }),
          //             GestureDetector(
          //               onLongPress: () async {
          //                 await _cameraController.startVideoRecording();
          //                 setState(() {
          //                   isRecoring = true;
          //                 });
          //               },
          //               onLongPressUp: () async {
          //                 XFile videopath =
          //                     await _cameraController.stopVideoRecording();
          //                 setState(() {
          //                   isRecoring = false;
          //                 });
          //                 Navigator.push(
          //                   context,
          //                   MaterialPageRoute(
          //                     builder: (builder) => VideoViewPage(
          //                       path: videopath.path,
          //                     ),
          //                   ),
          //                 );
          //               },
          //               onTap: () {
          //                 if (!isRecoring) takePhoto(context);
          //               },
          //               child: isRecoring
          //                   ? Icon(
          //                       Icons.radio_button_on,
          //                       color: Colors.red,
          //                       size: 80,
          //                     )
          //                   : Icon(
          //                       Icons.panorama_fish_eye,
          //                       color: Colors.white,
          //                       size: 70,
          //                     ),
          //             ),
          //             IconButton(
          //               icon: Transform.rotate(
          //                 angle: transform,
          //                 child: Icon(
          //                   Icons.flip_camera_ios,
          //                   color: Colors.white,
          //                   size: 25,
          //                 ),
          //               ),
          //               highlightColor: Colors.blueAccent,
          //               onPressed: () async {
          //                 setState(() {
          //                   iscamerafront = !iscamerafront;
          //                   transform = transform + pi;
          //                 });
          //                 int cameraPos = iscamerafront ? 0 : 1;
          //                 _cameraController = CameraController(
          //                   cameras[cameraPos],
          //                   ResolutionPreset.high,
          //                 );
          //                 cameraValue = _cameraController.initialize();
          //               },
          //             ),
          //           ],
          //         ),
          //         SizedBox(
          //           height: 4,
          //         ),
          //         KText(
          //           text: 'Hold for Video, tap for photo',
          //           color: Colors.white,
          //           fontSize: 12,
          //         )
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  void takePhoto(BuildContext context) async {
    XFile file = await _cameraController.takePicture();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (builder) => CameraViewPage(
          path: file.path,
        ),
      ),
    );
  }
}
