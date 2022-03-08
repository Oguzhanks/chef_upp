import '../../../core/package/network/core_network.dart';
import '../../model/error_model.dart';
import 'network_config.dart';

class DioManager {
  static DioManager? _instace;
  static DioManager get instance {
    if (_instace != null) _instace!;

    _instace = DioManager._init();
    return _instace!;
  }

  late INetworkManager networkManager;
  late NetworkConfig _config;
  DioManager._init() {
    _config = DevNetworkConfig();
    networkManager = NetworkManager(
      options: _config.options,
      isEnableLogger: true,
      errorModel: ProjectErrorModel(),
    );
  }
}
