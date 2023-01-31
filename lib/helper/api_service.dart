import 'dart:async';
import 'dart:core';
import 'package:dio/dio.dart';

import 'package:get/get.dart' hide Response;

class ApiService {
  final _dio = Dio();
  // final _userC = Get.put(UserController());
  // final locationC = Get.put(LocationController());

  // Future<Response> postDynamic({
  //   required String path,
  //   dynamic body,
  //   bool authentication = false,
  // }) async {
  //   locationC.getCurrentLocation();
  //   try {
  //     final response = await _dio.post(
  //       path,
  //       data: body,
  //       options: Options(
  //         followRedirects: false,
  //         // will not throw errors
  //         validateStatus: (status) => true,
  //         headers: {
  //           'Content-Type': 'application/json',
  //           // 'latLng':   '${locationC.latLng.value.latitude},${locationC.latLng.value.longitude}',
  //           'latLng':
  //               '${locationC.latLng.value.latitude},${locationC.latLng.value.longitude}',
  //           'Authorization': authentication
  //               ? 'Bearer ${Get.put(UserController()).getToken()}'
  //               : null
  //         },
  //       ),
  //     );

  //     return response;
  //   } catch (e) {
  //     print(e);
  //     throw ('Something went wrong');
  //   }
  // }

  Future<Response> getDynamic({
    required String path,
    Map<String, dynamic>? queryParameters,
    bool authentication = false,
  }) async {
    //  locationC.getCurrentLocation();
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(
          followRedirects: false,
          // will not throw errors
          validateStatus: (status) => true,
          headers: {
            'Content-Type': 'application/json',
            // 'latLng':   '${locationC.latLng.value.latitude},${locationC.latLng.value.longitude}',
            'latLng': '23.90560,93.094535',
            'Authorization':
                'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ6aWEiLCJyb2xlcyI6IlJPTEVfQURNSU4iLCJpc0FkbWluIjp0cnVlLCJleHAiOjE2NzY5NDE5ODIsImlhdCI6MTY3NTE0MTk4Mn0.qfRe6PX2HArGM-CbKPcODM5KfUvycTPPVbamaG9YvfH5sUPhIujMEfb7z9zkuP93hw0iDVi-r5w5NBcDir6lJg'
          },
        ),
      );
      return response;
    } catch (e) {
      print(e);
      throw ('Something went wrong');
    }
  }
}
