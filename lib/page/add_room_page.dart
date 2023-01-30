import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_webrtc_demo/page/room_page.dart';
import 'package:get/get.dart';

class AddRoomPage extends StatelessWidget {
  const AddRoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 190, 73, 233),
        title: Text('Create Room'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          inputField(
              hintText: 'User name',
              onChanged: (value) {
                print(value);
              }),
          SizedBox(
            height: 15,
          ),
          inputField(
            hintText: 'Room name',
            onChanged: (value) {
              print(value);
            },
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => Get.to(() => RoomPage()),
                child: Text('Create Room'),
                style: ElevatedButton.styleFrom(shape: StadiumBorder()),
              ),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: () => Get.to(() => RoomPage()),
                child: Text('Join Room'),
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Container inputField({
    required void Function(String)? onChanged,
    required String? hintText,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.grey),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              width: .5,
              style: BorderStyle.solid,
              color: Colors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              width: .5,
              style: BorderStyle.solid,
              color: Colors.grey,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              width: .5,
              style: BorderStyle.solid,
              color: Colors.grey,
            ),
          ),
          errorBorder: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[300],
          isDense: true,
        ),
      ),
    );
  }
}
