import 'package:equatable/equatable.dart';

abstract class BaseState extends Equatable{
  final bool isLoading;
  final String errorMessage;


  const BaseState(this.isLoading, this.errorMessage);
}
