// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/services.dart';
//
// import '../deserializer.dart';
// import '../network_result.dart';
// import 'base_request_model.dart';
// import 'base_response_model.dart';
//
// @visibleForTesting
// enum HttpMethod {
//   httpDelete,
//   httpGet,
//   httpPatch,
//   httpPost,
//   httpPut,
//
// }
//
// String _httpMethodValue(HttpMethod method) {
//   switch (method) {
//     case HttpMethod.httpDelete:
//       return 'DELETE';
//     case HttpMethod.httpGet:
//       return 'GET';
//     case HttpMethod.httpPatch:
//       return 'PATCH';
//     case HttpMethod.httpPost:
//       return 'POST';
//     case HttpMethod.httpPut:
//       return 'PUT';
//
//   }
//   throw PlatformException(code: 'unknownHttpMethod');
// }
//
// abstract class BaseEndpoint<Request extends BaseRequestModel,
//     Response extends BaseResponseModel> {
//   final Dio _dio;
//   final String _path;
//   final HttpMethod _httpMethod;
//
//   BaseEndpoint(
//     this._dio,
//     this._path,
//     this._httpMethod,
//   );
//
//   Future<NetworkResult<Response>> request(Request parameters, {bool isQuery = false}) async {
//     print(' Future<NetworkResult<Response>> ${parameters.parameters}');
//     try {
//       final response = await _dio.request(
//         _path,
//         data: isQuery ? null : parameters.parameters,
//         queryParameters: isQuery ? parameters.parameters : null,
//         options: Options(
//             headers: parameters.headers, method: _httpMethodValue(_httpMethod)),
//       );
//
//       var data = response.data;
//       print("KKKKK emd point ${parameters.parameters}");
//
//       return NetworkResult.success(
//           Deserializer.deserialize<Response>(response.data));
//     } on DioError catch (ex) {
//       debugPrint(
//           '${ex.requestOptions.path} ${ex.error} ${ex.response?.data != null ? ex.response?.data['message'] : ''}');
//       //TODO Check for un-authorize login and logout fom app
//       // if ((ex?.response?.statusCode ?? 0) == 403) {
//       //   await MyApp.logoutUsecase.logout();
//       // }
//       return NetworkResult.failure(ex);
//     } on Exception catch (ex) {
//       debugPrint(ex.toString());
//       return NetworkResult.failure(ex);
//     }
//   }
// }
//
// abstract class DeleteEndpoint<Request extends BaseRequestModel,
//         Response extends BaseResponseModel>
//     extends BaseEndpoint<Request, Response> {
//   DeleteEndpoint(
//     Dio dio,
//     String path,
//   ) : super(
//           dio,
//           path,
//           HttpMethod.httpDelete,
//         );
// }
//
// abstract class GetEndpoint<Request extends BaseRequestModel,
//         Response extends BaseResponseModel>
//     extends BaseEndpoint<Request, Response> {
//   GetEndpoint(
//     Dio dio,
//     String path,
//   ) : super(
//           dio,
//           path,
//           HttpMethod.httpGet,
//         );
// }
//
// abstract class PatchEndpoint<Request extends BaseRequestModel,
//         Response extends BaseResponseModel>
//     extends BaseEndpoint<Request, Response> {
//   PatchEndpoint(
//     Dio dio,
//     String path,
//   ) : super(
//           dio,
//           path,
//           HttpMethod.httpPatch,
//         );
// }
//
// abstract class PostEndpoint<Request extends BaseRequestModel,
//         Response extends BaseResponseModel>
//     extends BaseEndpoint<Request, Response> {
//   PostEndpoint(
//     Dio dio,
//     String path,
//   ) : super(
//           dio,
//           path,
//           HttpMethod.httpPost,
//         );
// }
//
// abstract class PutEndpoint<Request extends BaseRequestModel,
//         Response extends BaseResponseModel>
//     extends BaseEndpoint<Request, Response> {
//   PutEndpoint(
//     Dio dio,
//     String path,
//   ) : super(
//           dio,
//           path,
//           HttpMethod.httpPut,
//         );
// }
