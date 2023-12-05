import 'package:bbu_mobile_app/auth/models/login_res.dart';
import 'package:bbu_mobile_app/views/base_views.dart';


abstract interface class LoginView implements BaseView{
  void onLoginSuccess(LoginRes res);
}
