import 'package:flutter/foundation.dart';

@immutable
abstract class BaseRequestModel {
  Map<String, dynamic> get headers => {};
  Map<String, dynamic> get parameters;
}
