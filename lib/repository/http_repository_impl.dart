import 'dart:convert';

import 'package:bbu_mobile_app/auth/models/login_req.dart';
import 'package:bbu_mobile_app/auth/models/login_res.dart';
import 'package:bbu_mobile_app/models/http_base_response.dart';
import 'package:bbu_mobile_app/repository/http_repository.dart';
import 'package:bbu_mobile_app/service/api.dart';
import 'package:http/http.dart' as httpClient;

class HttpRepositoryImpl extends Api implements HttpRepository {
  @override
  Future<HttpBaseResponse<LoginRes>> login(LoginReq req) async {
    try {
      var url = Uri.parse(loginUrl);
      var response = await httpClient
          .post(
            url,
            headers: headers,
            body: jsonEncode(req.toJson()),
            encoding: encodeUft8,
          )
          .timeout(
            Duration(seconds: 5),
          );
      Map map = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return HttpBaseResponse(
            code: 200,
            isSuccess: true,
            message: "Login Success",
            data: LoginRes.fromJson(map));
      } else {
        return HttpBaseResponse(
            code: 400, isSuccess: false, message: map['message'], data: null);
      }
    } catch (e) {
      return HttpBaseResponse(
          code: 500, isSuccess: false, message: e.toString(), data: null);
    }
  }
}
