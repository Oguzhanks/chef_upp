import 'package:chef_upp/features/model/error_model.dart';
import 'package:flutter/foundation.dart';

import '../../../core/base/base_service.dart';
import '../../../core/package/network/core_network.dart';
import '../../model/recipe/recipe_information_model.dart';
import '../../model/recipe/recipe_search_model.dart';
import '../../model/recipe/recipe_search_query_model.dart';

part 'recipe_service_path.dart';

abstract class IRecipeService extends BaseService {
  IRecipeService(INetworkManager networkManager) : super(networkManager);

  Future<RecipeSearchModel?>? recipeSearch({@required RecipeSearchQueryModel? queryModel});
  Future<RecipeInformationModel?> recipeInformation({required int id});
}

class RecipeService extends IRecipeService {
  RecipeService(INetworkManager networkManager) : super(networkManager);

  @override
  Future<RecipeSearchModel> recipeSearch({@required RecipeSearchQueryModel? queryModel}) async {
    final response = await networkManager.sendX<RecipeSearchModel, RecipeSearchModel>(
      _RecipePathEnum.search.toPath(),
      queryParameters: queryModel?.toJson(),
      parseModel: RecipeSearchModel(),
      method: RequestType.get,
    );
    if (response.data != null) {
      return response.data!;
    } else {
      if (response.error!.model != null) throw (response.error!.model as ProjectErrorModel).message.toString();
      throw response.error!.description.toString();
    }
  }

  @override
  Future<RecipeInformationModel> recipeInformation({required int id}) async {
    final response = await networkManager.sendX<RecipeInformationModel, RecipeInformationModel>(
      _RecipePathEnum.information.toPath(val: id.toString()),
      parseModel: RecipeInformationModel(),
      method: RequestType.get,
    );

    if (response.data != null) {
      return response.data!;
    } else {
      if (response.error!.model != null) throw (response.error!.model as ProjectErrorModel).message.toString();
      throw response.error!.description.toString();
    }
  }
}
