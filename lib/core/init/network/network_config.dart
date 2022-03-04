import 'package:dio/dio.dart';

class NetworkConfig {
  late String baseUrl;

  late BaseOptions options;

  NetworkConfig() {
    baseUrl = 'https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/';
    options = BaseOptions(baseUrl: baseUrl);
  }
}
