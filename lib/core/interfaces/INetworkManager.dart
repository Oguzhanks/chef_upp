// ignore_for_file: file_names

import 'package:dio/dio.dart';

import '../enum/request_type.dart';

import 'INetworkModel.dart';
import 'IResponseModel.dart';

abstract class INetworkManager {
  Future<IResponseModel<R?>> send<T extends INetworkModel, R>(
    String path, {
    required T parseModel,
    required RequestType method,
    String? urlSuffix,
    Map<String, dynamic>? queryParameters,
    Options? options,
    Duration? expiration,
    dynamic data,
    ProgressCallback? onReceiveProgress,
    CancelToken? canceltoken,
  });

  Interceptors get dioIntercaptors;
}
