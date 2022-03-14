import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);

    _mainHeaders = {
      'content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }
}
