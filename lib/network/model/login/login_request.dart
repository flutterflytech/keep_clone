import '../../base/base_request_model.dart';

abstract class _Keys {
  static const String mPin = 'mPin';
}

class LoginRequest extends BaseRequestModel {
  final String mPin;

  LoginRequest(
    this.mPin,
  );

  @override
  Map<String, dynamic> get parameters => {
        _Keys.mPin: mPin,
      };
}
