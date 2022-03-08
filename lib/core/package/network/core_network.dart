library core_network;

export 'package:dio/src/dio_mixin.dart';
export 'package:dio/src/form_data.dart';
export 'package:dio/src/multipart_file.dart';
export 'package:dio/src/options.dart';

// UTILS
export 'src/utils/request_type_extension.dart';
// INTERFACE

export 'src/interface/IErrorModel.dart';
export 'src/interface/INetworkModel.dart';
export 'src/interface/INetworkManager.dart';
export 'src/interface/IResponseModel.dart';
// MODEL
export 'src/model/empty_model.dart';
export 'src/enum/request_type.dart';
export 'src/model/error_model.dart';
export 'src/model/response_model.dart';
// NETWORK
export 'src/network_manager.dart';
