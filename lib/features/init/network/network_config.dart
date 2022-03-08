import 'package:dio/dio.dart';

abstract class NetworkConfig {
  late BaseOptions options;

  NetworkConfig(this.options);
}

class DevNetworkConfig extends NetworkConfig {
  DevNetworkConfig()
      : super(BaseOptions(
          baseUrl: 'https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com',
          headers: {
            'x-rapidapi-host': 'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com',
            'x-rapidapi-key': '9cea18a1d9mshf53b2e7a2e7fe08p15a2c4jsnfa60051aac8d',
          },
        ));
}

class ProdNetworkConfig extends NetworkConfig {
  ProdNetworkConfig()
      : super(BaseOptions(
          baseUrl: 'https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com',
          headers: {
            'x-rapidapi-host': 'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com',
            'x-rapidapi-key': '9cea18a1d9mshf53b2e7a2e7fe08p15a2c4jsnfa60051aac8d',
          },
        ));
}

class TestNetworkConfig extends NetworkConfig {
  TestNetworkConfig()
      : super(BaseOptions(
          baseUrl: 'https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com',
          headers: {
            'x-rapidapi-host': 'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com',
            'x-rapidapi-key': '9cea18a1d9mshf53b2e7a2e7fe08p15a2c4jsnfa60051aac8d',
          },
        ));
}
