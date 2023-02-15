//
//
//
// import 'base/base_response_model.dart';
// import 'model/firstLogin/first_login_response.dart';
// import 'model/login/login_response.dart';
//
// abstract class Deserializer {
//   static final Map<Type, Function(Map<String, dynamic>)> _deserializers = {
//     LoginResponse: (Map<String, dynamic> json) => LoginResponse.fromJson(json),
//     FirstLoginResponse: (Map<String, dynamic> json) => FirstLoginResponse.fromJson(json),
//
//
//
//
//   };
//
//   static Response deserialize<Response extends BaseResponseModel>(
//       Map<String, dynamic> json) {
//
//     return Deserializer._deserializers[Response]!(json);
//   }
// }
