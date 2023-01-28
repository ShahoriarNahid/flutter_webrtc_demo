import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc_demo/page/r_history.dart';
import 'package:flutter_webrtc_demo/page/ringing_page.dart';
import 'package:get/get.dart';
import 'page/home_page.dart';

late List<CameraDescription> cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RingingPage(),
    );
  }
}
