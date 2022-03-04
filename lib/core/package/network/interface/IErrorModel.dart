// ignore_for_file: file_names

import 'INetworkModel.dart';

abstract class IErrorModel<T> {
  int? statusCode;
  String? description;
  INetworkModel? model;
  dynamic response;
}
