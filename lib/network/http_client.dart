// import 'dart:core';
//
// import 'package:dio/dio.dart';
//
// import 'model/accountType/account_type_end_point.dart';
// import 'model/accountType/account_type_request.dart';
// import 'model/accountType/account_type_response.dart';
// import 'model/accounts/accounts_end_point.dart';
// import 'model/accounts/accounts_request.dart';
// import 'model/accounts/accounts_response.dart';
// import 'model/applyForFedoraCash/apply_for_fedora_cash_end_point.dart';
// import 'model/applyForFedoraCash/apply_for_fedora_cash_request.dart';
// import 'model/applyForFedoraCash/apply_for_fedora_cash_response.dart';
// import 'model/applyForServices/apply_for_services_end_point.dart';
// import 'model/applyForServices/apply_for_services_request.dart';
// import 'model/applyForServices/apply_for_services_response.dart';
// import 'model/beneficiary/beneficiary_end_point.dart';
// import 'model/beneficiary/beneficiary_request.dart';
// import 'model/beneficiary/beneficiary_response.dart';
// import 'model/cancelService/cancel_service_end_point.dart';
// import 'model/cancelService/cancel_service_request.dart';
// import 'model/cancelService/cancel_service_response.dart';
// import 'model/dashboard/dashboard_end_point.dart';
// import 'model/dashboard/dashboard_request.dart';
// import 'model/dashboard/dashboard_response.dart';
// import 'model/deleteBeneficiary/delete_beneficiary_end_point.dart';
// import 'model/deleteBeneficiary/delete_beneficiary_response.dart';
// import 'model/deviceToken/device_token_end_point.dart';
// import 'model/deviceToken/device_token_request.dart';
// import 'model/firstLogin/first_login_end_point.dart';
// import 'model/firstLogin/first_login_request.dart';
// import 'model/firstLogin/first_login_response.dart';
// import 'model/forgotPin/forgot_pin_end_point.dart';
// import 'model/forgotPin/forgot_pin_request.dart';
// import 'model/forgotPin/forgot_pin_response.dart';
// import 'model/fundTransfer/fund_transfer_end_point.dart';
// import 'model/fundTransfer/fund_transfer_response.dart';
// import 'model/generateMpin/generate_mpin_end_point.dart';
// import 'model/generateMpin/generate_mpin_request.dart';
// import 'model/generateMpin/generate_mpin_response.dart';
// import 'model/grievances/grievances_end_point.dart';
// import 'model/grievances/grievances_request.dart';
// import 'model/grievances/grievances_response.dart';
// import 'model/login/login_end_point.dart';
// import 'model/login/login_request.dart';
// import 'model/login/login_response.dart';
//
// import 'model/notifications/notifications_end_point.dart';
// import 'model/notifications/notifications_request.dart';
// import 'model/notifications/notifications_response.dart';
// import 'model/onlineServices/online_services_end_point.dart';
// import 'model/onlineServices/online_services_request.dart';
// import 'model/onlineServices/online_services_response.dart';
// import 'model/otpVerification/otp_verification_end_point.dart';
// import 'model/otpVerification/otp_verification_request.dart';
// import 'model/otpVerification/otp_verification_response.dart';
// import 'model/profileDetails/profile_details_end_point.dart';
// import 'model/profileDetails/profile_details_request.dart';
// import 'model/profileDetails/profile_details_response.dart';
// import 'model/receiverDetails/receiver_details_end_point.dart';
// import 'model/receiverDetails/receiver_details_request.dart';
// import 'model/requestHistory/request_history_end_point.dart';
// import 'model/seenNotification/seen_notification_end_point.dart';
// import 'model/seenNotification/seen_notification_request.dart';
// import 'model/seenNotification/seen_notification_response.dart';
// import 'model/setLimit/set_limit_end_point.dart';
// import 'model/setLimit/set_limit_response.dart';
// import 'model/sharePrice/share_price_end_point.dart';
// import 'model/sharePrice/share_price_request.dart';
// import 'model/sharePrice/share_price_response.dart';
// import 'model/transactions/transaction_end_point.dart';
// import 'model/transactions/transaction_request.dart';
// import 'model/transactions/transaction_response.dart';
// import 'model/transactionsDetails/transactions_details_end_point.dart';
// import 'model/transactionsDetails/transactions_details_request.dart';
// import 'model/transactionsDetails/transactions_details_response.dart';
// import 'model/transferToOtherBank/transfer_to_other_bank_end_point.dart';
// import 'model/transferToOtherBank/transfer_to_other_bank_response.dart';
// import 'model/validateFundTransfer/validate_fund_transfer_end_point.dart';
// import 'model/validateFundTransfer/validate_fund_transfer_request.dart';
// import 'model/validateFundTransfer/validate_fund_transfer_response.dart';
// import 'network_result.dart';

// Future<void> _injectHeaders(RequestOptions request) async {
//   final headers = request.headers;
//   headers['Authorization'] = 'Basic ZmVkb3JhOmZlZG9yYQ==';
//   if ((ACCESS_TOKEN ?? '').isNotEmpty == true) {
//     headers['accessToken'] = ACCESS_TOKEN;
//   } else {
//     headers['accessToken'] = ACCESS_TOKEN;
//   }
//   request.headers = headers;
// }
//
// Dio _setupDio() {
//   final instance = Dio(BaseOptions(
//     connectTimeout: 20000,
//     baseUrl: ApiService().baseUrl,
//   ));
//   instance.interceptors
//       .add(InterceptorsWrapper(onRequest: (request, handler) async {
//     await _injectHeaders(request);
//     debugPrint(request.uri.toString());
//     debugPrint('headers = ${request.headers}');
//     debugPrint('data = ${request.data.toString()}');
//     return handler.next(request); //continue
//     // If you want to resolve the request with some custom data，
//     // you can resolve a `Response` object eg: return `dio.resolve(response)`.
//     // If you want to reject the request with a error message,
//     // you can reject a `DioError` object eg: return `dio.reject(dioError)`
//   }, onResponse: (response, handler) {
//     // Do something with response data
//     if(response.data['statusCode'] ==0 && response.data['error']['errorCode'] == 2){
//
//       Alerts.showInfoAlert(navigatorKey.currentContext!, 'Access Denied', 2);
//     }
//     debugPrint(response.requestOptions.uri.toString());
//
//
//     debugPrint(response.data.toString());
//     assert(response.data is Map<String, dynamic>);
//     // return response.requestOptions.extra['decoder'](response.data);
//     return handler.next(response); // continue
//     // If you want to reject the request with a error message,
//     // you can reject a `DioError` object eg: return `dio.reject(dioError)`
//   }, onError: (DioError e, handler) {
//     debugPrint(e.toString());
//     if(e.type == DioErrorType.connectTimeout){
//       String? currentPath;
//       navigatorKey.currentState?.popUntil((route) {
//         currentPath = route.settings.name;
//         return true;
//       });
//       if(currentPath != RoutesName.LOGIN_PAGE ){
//         Alerts.showInfoAlert(navigatorKey.currentContext!, 'Connection Timed Out', 2);
//
//       }else{
//         Alerts.showInfoAlert(navigatorKey.currentContext!, 'Connection Timed Out', 1);
//
//       }
//
//
//
//     }else{
//       return handler.next(e);
//
//     }
//    //continue
//     // If you want to resolve the request with some custom data，
//     // you can resolve a `Response` object eg: return `dio.resolve(response)`.
//   }));
//   // final performanceInterceptor = DioFirebasePerformanceInterceptor();
//   // _instance.interceptors.add(performanceInterceptor);
//   return instance;
// }
//
// class HttpClient {
//   final Dio _dio;
//
//   HttpClient._(this._dio);
//
//   HttpClient.env() : this._(_setupDio());
//
//   Future<NetworkResult<LoginResponse>> loginRequest(
//     String mPin,
//   ) async {
//     final requestData = LoginRequest(mPin);
//
//     final endpointUseCase = LoginEndpointUsecase(_dio);
//
//     return endpointUseCase.request(requestData);
//   }
//
//   Future<NetworkResult<FirstLoginResponse>> firstLoginRequest(
//     String mobileNo,
//     String mPin,
//   ) async {
//     final requestData = FirstLoginRequest(mobileNo, mPin);
//
//     final endpointUseCase = FirstLoginEndpointUsecase(_dio);
//
//     return endpointUseCase.request(requestData);
//   }
//
//   Future<NetworkResult<RegistrationResponse>> registerRequest(
//     String accountNumber,
//     String membershipId,
//     String name,
//     String mobileNo,
//   ) async {
//     final requestData =
//         RegisterRequest(accountNumber, membershipId, name, mobileNo);
//
//     final endpointUseCase = RegisterEndpointUseCase(_dio);
//
//     return endpointUseCase.request(requestData);
//   }
//
//   Future<NetworkResult<ForgotPinResponse>> forgotPinRequest(
//       String mobileNo) async {
//     final requestData = ForgotPinRequest(mobileNo);
//
//     final endpointUseCase = ForgotPinEndpointUseCase(_dio);
//
//     return endpointUseCase.request(requestData);
//   }
//
//   Future<NetworkResult<OtpVerificationResponse>> otpVerificationRequest(
//       String mobile, String otp) async {
//     final requestData = OtpVerificationRequest(mobile, otp);
//
//     final endpointUseCase = OtpVerificationEndpointUseCase(_dio);
//
//     return endpointUseCase.request(requestData);
//   }
//
//   Future<NetworkResult<GenerateMPinResponse>> createMPinRequest(
//       String mPin) async {
//     final requestData = GenerateMPinRequest(mPin);
//
//     final endpointUseCase = GenerateMPinEndpointUseCase(_dio);
//
//     return endpointUseCase.request(requestData);
//   }
//
//   Future<NetworkResult<AccountsResponse>> accountsDetailsRequest() async {
//     final requestData = AccountsRequest();
//
//     final endpointUseCase = AccountsEndpointUseCase(_dio);
//
//     return endpointUseCase.request(requestData);
//   }
//
//   Future<NetworkResult<FundTransferResponse>> fundTransferRequest(String acNo,
//       String receiverAccountNumber, String transactionAmount,String remark) async {
//     final requestData =
//         FundTransferRequest(acNo, receiverAccountNumber, transactionAmount,remark);
//
//     final endpointUseCase = FundTransferEndpointUseCase(_dio);
//
//     return endpointUseCase.request(requestData);
//   }
//
//   Future<NetworkResult<ReceiverDetailsResponse>> receiverDetailsRequest(
//     String receiverAccountNumber,
//   ) async {
//     final requestData = ReceiverDetailsRequest(receiverAccountNumber);
//
//     final endpointUseCase = ReceiverDetailsEndpointUseCase(_dio);
//
//     return endpointUseCase.request(requestData, isQuery: true);
//   }
//
//   Future<NetworkResult<TransactionResponse>> transactionsRequest(
//     String accountNumber,
//     String count,
//     String page,
//   ) async {
//     final requestData = TransactionRequest(accountNumber, count, page);
//
//     final endpointUseCase = TransactionEndpointUseCase(_dio);
//
//     return endpointUseCase.request(requestData, isQuery: true);
//   }
//
//   Future<NetworkResult<OnlineServicesResponse>> onlineServicesRequest() async {
//     final requestData = OnlineServicesRequest();
//
//     final endpointUseCase = OnlineServicesEndpointUseCase(_dio);
//
//     return endpointUseCase.request(requestData);
//   }
//
//   Future<NetworkResult<ApplyForServiceResponse>> applyForServiceRequest(
//     String serviceId,
//     String amount,
//     String orderDate,
//     String timeSlot,
//     String addressId,
//     String optionActionType,
//     String duration,
//     String accountId,
//   ) async {
//     final requestData = ApplyForServiceRequest(serviceId, amount, orderDate,
//         int.parse(timeSlot), addressId, optionActionType, duration, accountId);
//
//     final endpointUseCase = ApplyForServiceEndpointUseCase(_dio);
//
//     return endpointUseCase.request(requestData);
//   }
//
//   Future<NetworkResult<ProfileDetailsResponse>> profileDetailsRequest(
//     String userId,
//   ) async {
//     final requestData = ProfileDetailsRequest(userId);
//
//     final endpointUseCase = ProfileDetailsEndpointUseCase(_dio);
//
//     return endpointUseCase.request(requestData, isQuery: true);
//   }
//
//   Future<NetworkResult<BeneficiaryResponse>> beneficiaryRequest(
//     String userId,
//   ) async {
//     final requestData = BeneficiaryRequest(userId);
//
//     final endpointUseCase = BeneficiaryEndpointUseCase(_dio);
//
//     return endpointUseCase.request(requestData, isQuery: true);
//   }
//
//   Future<NetworkResult<DeviceTokenResponse>> deviceTokenRequest(
//     String deviceToken,
//   ) async {
//     final requestData = DeviceTokenRequest(deviceToken);
//
//     final endpointUseCase = DeviceTokenEndpointUseCase(_dio);
//
//     return endpointUseCase.request(requestData);
//   }
//
//   Future<NetworkResult<NotificationsResponse>> notificationsRequest() async {
//     final requestData = NotificationsRequest();
//
//     final endpointUseCase = NotificationsEndpointUseCase(_dio);
//
//     return endpointUseCase.request(requestData);
//   }
//
//   Future<NetworkResult<TransactionDetailsResponse>> notificationsDetailsRequest(
//     String notificationId,
//   ) async {
//     final requestData = TransactionDetailsRequest(notificationId);
//
//     final endpointUseCase = TransactionDetailsEndpointUseCase(_dio);
//
//     return endpointUseCase.request(requestData, isQuery: true);
//   }
//
//   Future<NetworkResult<SharePriceResponse>> sharePriceRequest() async {
//     final requestData = SharePriceRequest();
//
//     final endpointUseCase = SharePriceEndpointUseCase(_dio);
//
//     return endpointUseCase.request(requestData);
//   }
//
//   Future<NetworkResult<DashboardResponse>> dashboardRequest() async {
//     final requestData = DashboardRequest();
//
//     final endpointUseCase = DashboardEndpointUseCase(_dio);
//
//     return endpointUseCase.request(requestData);
//   }
//
//   Future<NetworkResult<ApplyForFedoraCashResponse>> applyForFedoraCashRequest(
//     String serviceId,
//     String remark,
//     int amount,
//     String accountNumber,
//   ) async {
//     final requestData =
//         ApplyForFedoraCashRequest(serviceId, remark, amount, accountNumber);
//
//     final endpointUseCase = ApplyForFedoraCashEndpointUseCase(_dio);
//
//     return endpointUseCase.request(requestData);
//   }
//
//   Future<NetworkResult<AccountTypeResponse>> accountTypeRequest() async {
//     final requestData = AccountTypeRequest();
//
//     final endpointUseCase = AccountTypeEndpointUseCase(_dio);
//
//     return endpointUseCase.request(requestData);
//   }
//
//   Future<NetworkResult<RequestHistoryResponse>> requestHistoryRequest(
//       int serviceType, int optionAction) async {
//     final requestData = RequestHistoryRequest(serviceType, optionAction);
//
//     final endpointUseCase = RequestHistoryEndpointUseCase(_dio);
//
//     return endpointUseCase.request(requestData, isQuery: true);
//   }
//
//   Future<NetworkResult<CancelServiceResponse>> cancelServiceRequest(
//     String onlineServiceId,
//     int status,
//     String orderDate,
//     int timeSlot,
//   ) async {
//     final requestData =
//         CancelServiceRequest(onlineServiceId, status, orderDate, timeSlot);
//
//     final endpointUseCase = CancelServiceEndpointUseCase(_dio);
//
//     return endpointUseCase.request(requestData);
//   }
//
//
//   Future<NetworkResult<TransferToOtherBankResponse>> transferToOtherBankRequest(String senderAccountNumber,
//       String otherBankDetailsId, String transactionAmount) async {
//     final requestData =
//     TransferToOtherBankRequest(senderAccountNumber, otherBankDetailsId, transactionAmount);
//
//     final endpointUseCase = TransferToOtherBankEndpointUseCase(_dio);
//
//     return endpointUseCase.request(requestData);
//   }
//
//
//   Future<NetworkResult<GrievancesResponse>> grievancesRequest(String description,) async {
//     final requestData =
//     GrievancesRequest(description);
//
//     final endpointUseCase = GrievancesEndpointUseCase(_dio);
//
//     return endpointUseCase.request(requestData);
//   }
//
//   Future<NetworkResult<ValidateFundTransferResponse>> validateFundTransferRequest(String otp,) async {
//     final requestData =
//     ValidateFundTransferRequest(otp);
//
//     final endpointUseCase = ValidateFundTransferEndpointUseCase(_dio);
//
//     return endpointUseCase.request(requestData);
//   }
//
//   Future<NetworkResult<SetLimitResponse>> setLimitRequest(int odaLimit,int laaLimit) async {
//
//     final requestData =
//     SetLimitRequest(odaLimit, laaLimit);
//
//     final endpointUseCase = SetLimitEndpointUseCase(_dio);
//
//     return endpointUseCase.request(requestData,isQuery: true);
//   }
//
//   Future<NetworkResult<DeleteBeneficiaryResponse>> deleteBeneficiaryRequest(String beneficiaryId) async {
//
//     final requestData =
//     DeleteBeneficiaryRequest(beneficiaryId);
//
//     final endpointUseCase = DeleteBeneficiaryEndpointUseCase(_dio);
//
//     return endpointUseCase.request(requestData,isQuery: true);
//   }
//
//
//   Future<NetworkResult<SeenNotificationsResponse>> seenNotificationsRequest(List<String> notificationIdArray) async {
//
//     final requestData =
//     SeenNotificationsRequest('$notificationIdArray');
//
//
//     final endpointUseCase = SeenNotificationsEndpointUseCase(_dio);
//
//     return endpointUseCase.request(requestData,);
//   }
//
//
// }
