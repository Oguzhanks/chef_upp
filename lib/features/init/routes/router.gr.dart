// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../../../view/recipe/recipe_information/view/recipe_information_screen.dart'
    as _i2;
import '../../../view/recipe/recipe_search/view/recipe_search_screen.dart'
    as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    RecipeSearchRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.RecipeSearchScreen());
    },
    RecipeInformationRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<RecipeInformationRouteArgs>(
          orElse: () =>
              RecipeInformationRouteArgs(id: pathParams.getInt('id')));
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.RecipeInformationScreen(key: args.key, id: args.id));
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(RecipeSearchRoute.name, path: '/'),
        _i3.RouteConfig(RecipeInformationRoute.name, path: ':id')
      ];
}

/// generated route for
/// [_i1.RecipeSearchScreen]
class RecipeSearchRoute extends _i3.PageRouteInfo<void> {
  const RecipeSearchRoute() : super(RecipeSearchRoute.name, path: '/');

  static const String name = 'RecipeSearchRoute';
}

/// generated route for
/// [_i2.RecipeInformationScreen]
class RecipeInformationRoute
    extends _i3.PageRouteInfo<RecipeInformationRouteArgs> {
  RecipeInformationRoute({_i4.Key? key, required int id})
      : super(RecipeInformationRoute.name,
            path: ':id',
            args: RecipeInformationRouteArgs(key: key, id: id),
            rawPathParams: {'id': id});

  static const String name = 'RecipeInformationRoute';
}

class RecipeInformationRouteArgs {
  const RecipeInformationRouteArgs({this.key, required this.id});

  final _i4.Key? key;

  final int id;

  @override
  String toString() {
    return 'RecipeInformationRouteArgs{key: $key, id: $id}';
  }
}
