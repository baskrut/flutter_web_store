import 'package:web_store/res/api_params.dart';
import 'package:web_store/services/http_service/http_requester.dart';
import 'package:web_store/services/http_service/http_types.dart';
import 'package:http/http.dart';

class HttpService {

/*  static Future<Response> logOut() async {
    return await HttpRequester.request(
      type: HttpRequestTypes.post,
      route: BASE_URL + ApiFunctions.logout,
      params: {ApiParams.token: SessionService.token},
    );
  }*/



  static Future<Response> getFoundProducts() async {

    return await HttpRequester.request(
      type: HttpRequestTypes.get,
      route: ApiParams.baseUrl + ApiParams.brand,
      params: {
      },
    );
  }





/*  static Future<Response> register({
    String firstName,
    String email,
    String password,
  }) async {
    return await HttpRequester.request(
      type: HttpRequestTypes.post,
      route: BASE_URL + ApiFunctions.registration,
      params: {
        ApiParams.firstName: firstName,
        ApiParams.email: email,
        ApiParams.password: password,
      },
    );
  }*/

/*
  static Future<Response> acceptCode({
    String email,
    String code,
  }) async {
    return await HttpRequester.request(
      type: HttpRequestTypes.post,
      route: BASE_URL + ApiFunctions.acceptCode,
      params: {
        ApiParams.email: email,
        ApiParams.code: code,
      },
    );
  }*/

/*  static Future<Response> changePassword({
    String email,
    String password,
  }) async {
    return await HttpRequester.request(
      type: HttpRequestTypes.get,
      route: BASE_URL + ApiFunctions.changePassword,
      params: {
        ApiParams.email: email,
        ApiParams.password: password,
      },
    );
  }*/

/*  static Future<Response> signIn({
    String email,
    String password,
  }) async {
    return await HttpRequester.request(
      type: HttpRequestTypes.get,
      route: BASE_URL + ApiFunctions.login,
      params: {
        ApiParams.password: password,
        ApiParams.email: email,
      },
    );
  }*/

/*  static Future<Response> signInGoogle({
    String email,
    String googleToken,
  }) async {
    return await HttpRequester.request(
      type: HttpRequestTypes.get,
      route: BASE_URL + ApiFunctions.loginGoogle,
      params: {
        ApiParams.googleToken: googleToken,
        ApiParams.email: email,
      },
    );
  }

  static Future<Response> registerGoogle({
    String email,
    String googleToken,
  }) async {
    return await HttpRequester.request(
      type: HttpRequestTypes.get,
      route: BASE_URL + ApiFunctions.registerGoogle,
      params: {
        ApiParams.googleToken: googleToken,
        ApiParams.email: email,
      },
    );
  }*/

/*  static Future<Response> getRefreshedToken(String refreshToken) async {
    return await HttpRequester.request(
      type: HttpRequestTypes.get,
      route: BASE_URL + ApiFunctions.updateToken,
      params: {
        ApiParams.refreshToken: refreshToken,
      },
    );
  }*/
}
