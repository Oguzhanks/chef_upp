import '../interface/IErrorModel.dart';
import '../interface/INetworkModel.dart';

class ErrorModel<T> implements IErrorModel {
  @override
  int? statusCode;

  @override
  String? description;

  ErrorModel({this.statusCode, this.description});

  @override
  INetworkModel? model;

  @override
  dynamic response;
}
