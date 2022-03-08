import '../package/network/core_network.dart';

abstract class BaseService {
  final INetworkManager networkManager;
  BaseService(this.networkManager);
}
