import 'package:bbu_mobile_app/auth/models/login_req.dart';
import 'package:bbu_mobile_app/auth/models/login_res.dart';
import 'package:bbu_mobile_app/models/http_base_response.dart';

abstract interface class HttpRepository{
  Future<HttpBaseResponse<LoginRes>> login(LoginReq req);
}