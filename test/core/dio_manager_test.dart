import 'dart:io';

import 'package:chef_upp/core/package/network/core_network.dart';
import 'package:chef_upp/data/model/recipe/recipe_search_model.dart';
import 'package:chef_upp/features/init/network/network_config.dart';
import 'package:chef_upp/features/model/error_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Network Manager Test', () {
    late INetworkManager networkManager;
    BaseOptions options = TestNetworkConfig().options;

    test('Success Test', () async {
      networkManager = NetworkManager(
        isEnableLogger: false,
        errorModel: ProjectErrorModel(),
        options: options,
      );

      final response = await networkManager.sendX<RecipeSearchModel, RecipeSearchModel>(
        '/recipes/search',
        parseModel: RecipeSearchModel(),
        method: RequestType.get,
      );

      expect(response.data!.baseUri, isNotNull);
      expect(response.error, isNull);
    });
    test('Error Test', () async {
      options.headers = null;
      networkManager = NetworkManager(
        isEnableLogger: false,
        errorModel: ProjectErrorModel(),
        options: options,
      );

      final response = await networkManager.sendX<RecipeSearchModel, RecipeSearchModel>(
        '/recipes/search',
        parseModel: RecipeSearchModel(),
        method: RequestType.get,
      );

      expect(response.data, isNull);
      expect(response.error!.model, isNotNull);
      expect(response.error!.statusCode, HttpStatus.unauthorized);
    });
  });
}
