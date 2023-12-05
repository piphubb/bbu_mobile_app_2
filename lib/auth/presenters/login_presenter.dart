import 'package:bbu_mobile_app/auth/models/login_req.dart';
import 'package:bbu_mobile_app/auth/views/login_view.dart';
import 'package:bbu_mobile_app/repository/http_repository.dart';
import 'package:bbu_mobile_app/service/http_service_injection.dart';


class LoginPresenter{
  late LoginView view;
  late HttpRepository httpRepository;
  LoginPresenter(this.view){
    httpRepository = HttpServiceInjection().httpRepository;
  }
  void login(LoginReq req){
    view.onLoading();
    httpRepository.login(req).then((value){
      view.onHiding();
      if(value.isSuccess == true){
        view.onLoginSuccess(value.data!);
      }else{
        view.onError(value.message!);
      }
    });
  }
}