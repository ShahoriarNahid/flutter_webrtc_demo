import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../helper/api_service.dart';
import '../helper/log.dart';
import '../model/userList_model.dart';

class UserListController extends GetxController with ApiService {
  final userListModel = RxList<UserListModel>();
  final isLoading = RxBool(false);

  void getUserModelList() async {
    try {
      isLoading.value = true;
      final params = {
        'agencyId': 'b37c1cee-08e8-44a8-b6c7-3bb3b54c5e08',
        'apiKey': 'ZWR1Y2l0aW9uQkRBMTIzNDU2Nzg5'
      };
      final res = await getDynamic(
        queryParameters: params,
        path: 'http://123.200.22.150:9001/get_agency_employees_by_agency_id',
      );
      kLog(res);
      if (res.data['status'] != null &&
          res.data['status'].contains('successful') == true) {
        final data = res.data['data']
            .map((json) => UserListModel.fromJson(json as Map<String, dynamic>))
            .toList()
            .cast<UserListModel>() as List<UserListModel>;

        //  // kLog(data.length);

        if (data.isNotEmpty) {
          isLoading.value = false;
          userListModel.clear();
          userListModel.addAll(data);
        }
      }
      isLoading.value = false;
    } on DioError catch (e) {
      print(e.message);
    }
  }
}
