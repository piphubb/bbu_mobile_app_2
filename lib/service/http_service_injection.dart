import 'package:bbu_mobile_app/repository/http_repository.dart';
import 'package:bbu_mobile_app/repository/http_repository_impl.dart';

class HttpServiceInjection{

  static final HttpServiceInjection _instance = HttpServiceInjection._Internal();

  factory HttpServiceInjection(){
    return _instance;
  }
  HttpServiceInjection._Internal();

  HttpRepository get httpRepository => HttpRepositoryImpl();
}