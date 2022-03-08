import '../../core/package/network/core_network.dart';

class ProjectErrorModel extends INetworkModel<ProjectErrorModel> {
  String? code;
  String? message;
  ProjectErrorModel({this.code, this.message});
  @override
  ProjectErrorModel fromJson(Map<String, dynamic> json) => ProjectErrorModel(
        code: json['code'],
        message: json['message'],
      );

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'code': code,
        'message': message,
      };
}
