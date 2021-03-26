import 'package:http/http.dart' as http;
import 'package:web_store/services/http_service/http_types.dart';



class HttpRequester {
  static const String tag = '[HttpRequester]';

  static Future<http.Response> request({
    HttpRequestTypes type,
    String route,
    Map<String, dynamic> body,
    Map<String, String> params,
    String token,
  }) async {
    String paramsString = '';

    params.forEach((key, value) => paramsString += '$key=$value');
    paramsString = paramsString.replaceFirst('&', '');

    // logger.d('$tag => ${route.replaceFirst(BASE_URL, EMPTY_STRING)} => current token : ${params[ApiParams.token]}');
    http.Response response;

    switch (type) {
      case HttpRequestTypes.get:
        response = await http.get(route + paramsString);
        break;
      case HttpRequestTypes.post:
        response = await http.post(route + paramsString, body: body);
        break;
      case HttpRequestTypes.patch:
        response = await http.patch(route + paramsString, body: body);
        break;
      case HttpRequestTypes.put:
        response = await http.put(route + paramsString, body: body);
        break;
    }

   /* if (response.body == 'Not found!') {
      DialogService.instance.show(ErrorDialog());
    }

    if (response.body == 'Email or password entered incorrectly!') {
      DialogService.instance.show(ErrorDialog(errorCase: ErrorCase.wrongPassword));
    }

    if (response.body == 'This email is already registered!') {
      DialogService.instance.show(ErrorDialog(errorCase: ErrorCase.wrongEmail));
    }
*/
    return response;
  }
}
