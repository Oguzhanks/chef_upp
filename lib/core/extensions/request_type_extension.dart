import '../enum/request_type.dart';

extension NetworkTypeExtension on RequestType {
  String get stringValue {
    switch (this) {
      case RequestType.get:
        return 'GET';
      case RequestType.post:
        return 'POST';
      case RequestType.delete:
        return 'DELETE';
      case RequestType.put:
        return 'PUT';
      default:
        throw 'Method Not Found';
    }
  }
}
