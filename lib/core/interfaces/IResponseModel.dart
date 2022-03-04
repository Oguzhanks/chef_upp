// ignore_for_file: file_names

import 'IErrorModel.dart';

abstract class IResponseModel<T> {
  T data;
  IErrorModel? error;

  IResponseModel(this.data, this.error);
}
