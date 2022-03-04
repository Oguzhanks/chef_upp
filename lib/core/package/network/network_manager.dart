import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:chef_upp/core/package/network/utils/request_type_extension.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
// ignore: implementation_imports
import 'package:dio/src/adapters/io_adapter.dart' if (dart.library.html) 'package:dio/src/adapters/browser_adapter.dart' as adapter;
import 'package:flutter/foundation.dart';
import 'package:retry/retry.dart';

import 'enum/request_type.dart';
import 'interface/INetworkManager.dart';
import 'interface/INetworkModel.dart';
import 'interface/IResponseModel.dart';
import 'model/empty_model.dart';
import 'model/error_model.dart';
import 'model/response_model.dart';
import '../../utils/custom_logger.dart';

part 'operation/network_model_parser.dart';
part 'operation/network_wrapper.dart';

class NetworkManager with dio.DioMixin implements dio.Dio, INetworkManager {
  late Future<DioError> Function(DioError error, NetworkManager newService)? onRefreshToken;

  late VoidCallback? onRefreshFail;

  final int _maxCount = 3;

  late INetworkModel? errorModel;

  bool isEnableTest;

  final bool? isEnableLogger;

  @override
  dio.Interceptors get dioIntercaptors => interceptors;

  NetworkManager({
    required BaseOptions options,
    this.isEnableLogger,
    dio.Interceptor? interceptor,
    this.onRefreshToken,
    this.onRefreshFail,
    this.errorModel,
    this.isEnableTest = false,
  }) {
    this.options = options;

    _addLoggerInterceptor(isEnableLogger ?? false);
    _addNetworkIntercaptors(interceptor);
    httpClientAdapter = adapter.createAdapter();
  }

  void _addLoggerInterceptor(bool isEnableLogger) {
    if (isEnableLogger) interceptors.add(dio.LogInterceptor());
  }

  @override
  Future<IResponseModel<R?>> sendX<T extends INetworkModel, R>(
    String path, {
    required T parseModel,
    required RequestType method,
    String? urlSuffix = '',
    Map<String, dynamic>? queryParameters,
    Options? options,
    Duration? expiration,
    dynamic data,
    ProgressCallback? onReceiveProgress,
    CancelToken? canceltoken,
  }) async {
    options ??= Options();
    options.method = method.stringValue;
    final body = _getBodyModel(data);

    try {
      final response = await request('$path$urlSuffix', data: body, options: options, queryParameters: queryParameters, cancelToken: canceltoken);
      final responseStatusCode = response.statusCode ?? HttpStatus.notFound;
      if (responseStatusCode >= HttpStatus.ok && responseStatusCode <= HttpStatus.multipleChoices) {
        return _getResponseResult<T, R>(response.data, parseModel);
      } else {
        return ResponseModel(error: ErrorModel(description: response.data.toString()));
      }
    } on DioError catch (e) {
      return _onError<R>(e);
    }
  }

  ResponseModel<R> _getResponseResult<T extends INetworkModel, R>(dynamic data, T parserModel) {
    final model = _parseBody<R, T>(data, parserModel);
    return ResponseModel<R>(data: model);
  }

  ResponseModel<R> _onError<R>(DioError e) {
    final errorResponse = e.response;
    CustomLogger(isEnabled: isEnableLogger).printError(e.message);
    var error = ErrorModel(description: e.message, statusCode: errorResponse != null ? errorResponse.statusCode : HttpStatus.internalServerError);
    if (errorResponse != null) {
      error = _generateErrorModel(error, errorResponse.data);
    }
    return ResponseModel<R>(error: error);
  }

  ErrorModel _generateErrorModel(ErrorModel error, dynamic data) {
    if (errorModel == null) {
      error.response = data;
    } else {
      error.model = errorModel?.fromJson(jsonDecode(data));
    }
    return error;
  }
}
