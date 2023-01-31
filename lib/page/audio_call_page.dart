import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class AudioCallPage extends StatelessWidget {
  const AudioCallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF675C5C),
      body: Container(
        decoration: new BoxDecoration(
            gradient: new LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 190, 73, 233),
            Color.fromARGB(255, 190, 73, 233),
            Color.fromARGB(255, 21, 236, 229)
          ],
        )),
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              title: Text(
                'Audio Call Page',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
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
            Stack(
              children: [
                Container(
                  height: Get.height / 1.2,
                  // color: Colors.amber,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 180,
                      ),
                      Center(
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.white,
                              child: FlutterLogo(size: 50),
                            ),
                            SizedBox(height: 12),
                            Text(
                              'Habibur Rahman',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Calling ...',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 00.0,
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
                              Icons.videocam_off_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color?>(
                                      Colors.transparent),
                              shadowColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent),
                              shape: MaterialStateProperty.all(CircleBorder()),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Icon(
                              Icons.mic_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color?>(
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
                              backgroundColor:
                                  MaterialStateProperty.all<Color?>(
                                      Colors.transparent),
                              shadowColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent),
                              shape: MaterialStateProperty.all(CircleBorder()),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              // setState(() {
                              //   iscamerafront = !iscamerafront;
                              //   transform = transform + pi;
                              // });
                              // int cameraPos = iscamerafront ? 0 : 1;
                              // _cameraController = CameraController(
                              //   cameras[cameraPos],
                              //   ResolutionPreset.high,
                              // );
                              // cameraValue = _cameraController.initialize();
                            },
                            child: Icon(
                              Icons.volume_up_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color?>(
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
                                  MaterialStateProperty.all<Color?>(
                                      Colors.redAccent),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
