import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class RHistoryPage extends StatelessWidget {
  const RHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Color(0xff389ae8),
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.grey[50],
        systemNavigationBarColor: Colors.white,
      ),
    );
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 235, 235),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff389ae8),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('Recharge History'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.info_outline_rounded),
            iconSize: 30,
          ),
          SizedBox(
            width: 8,
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                child: Text('Showing upto last 10 recharges 45 days',
                    style: TextStyle(color: Colors.black38)),
              ),
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Container(
            width: Get.width,
            height: 70,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(left: 15, top: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('09 Jan 2023 07:00 PM',
                      style: TextStyle(color: Colors.black38)),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Recharge Amount',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      Text(
                        '৳109',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 15,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: Get.width,
            height: 70,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(left: 15, top: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('15 Jan 2023 09:06 PM',
                      style: TextStyle(color: Colors.black38)),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Recharge Amount',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      Text(
                        '৳250',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 15,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: Get.width,
            height: 70,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(left: 15, top: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('07 Feb 2023 08:48 PM',
                      style: TextStyle(color: Colors.black38)),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Recharge Amount',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      Text(
                        '৳250',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 15,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: Get.width,
            height: 70,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(left: 15, top: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('27 Feb 2023 10:03 PM',
                      style: TextStyle(color: Colors.black38)),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Recharge Amount',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      Text(
                        '৳200',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 15,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: Get.width,
            height: 70,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(left: 15, top: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('07 Mar 2023 10:57 AM',
                      style: TextStyle(color: Colors.black38)),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Recharge Amount',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      Text(
                        '৳41',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 15,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
