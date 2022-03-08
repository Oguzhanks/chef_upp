import '../../../../core/package/network/core_network.dart';

class RecipeInformationModel extends INetworkModel<RecipeInformationModel> {
  RecipeInformationModel({
    this.vegetarian,
    this.vegan,
    this.glutenFree,
    this.dairyFree,
    this.veryHealthy,
    this.cheap,
    this.veryPopular,
    this.sustainable,
    this.weightWatcherSmartPoints,
    this.gaps,
    this.lowFodmap,
    this.preparationMinutes,
    this.cookingMinutes,
    this.aggregateLikes,
    this.spoonacularScore,
    this.healthScore,
    this.creditsText,
    this.sourceName,
    this.pricePerServing,
    this.extendedIngredients,
    this.id,
    this.title,
    this.readyInMinutes,
    this.servings,
    this.sourceUrl,
    this.image,
    this.imageType,
    this.summary,
    this.cuisines,
    this.dishTypes,
    this.diets,
    this.occasions,
    this.instructions,
    this.analyzedInstructions,
    this.originalId,
  });

  bool? vegetarian;
  bool? vegan;
  bool? glutenFree;
  bool? dairyFree;
  bool? veryHealthy;
  bool? cheap;
  bool? veryPopular;
  bool? sustainable;
  num? weightWatcherSmartPoints;
  String? gaps;
  bool? lowFodmap;
  num? preparationMinutes;
  num? cookingMinutes;
  num? aggregateLikes;
  num? spoonacularScore;
  num? healthScore;
  String? creditsText;
  String? sourceName;
  num? pricePerServing;
  List<ExtendedIngredient>? extendedIngredients;
  int? id;
  String? title;
  num? readyInMinutes;
  num? servings;
  String? sourceUrl;
  String? image;
  String? imageType;
  String? summary;
  List<dynamic>? cuisines;
  List<String>? dishTypes;
  List<String>? diets;
  List<dynamic>? occasions;
  String? instructions;
  List<AnalyzedInstruction>? analyzedInstructions;
  dynamic originalId;

  factory RecipeInformationModel.fromJson(Map<String, dynamic> json) => RecipeInformationModel(
        vegetarian: json["vegetarian"],
        vegan: json["vegan"],
        glutenFree: json["glutenFree"],
        dairyFree: json["dairyFree"],
        veryHealthy: json["veryHealthy"],
        cheap: json["cheap"],
        veryPopular: json["veryPopular"],
        sustainable: json["sustainable"],
        weightWatcherSmartPoints: json["weightWatcherSmartPoints"],
        gaps: json["gaps"],
        lowFodmap: json["lowFodmap"],
        preparationMinutes: json["preparationMinutes"],
        cookingMinutes: json["cookingMinutes"],
        aggregateLikes: json["aggregateLikes"],
        spoonacularScore: json["spoonacularScore"],
        healthScore: json["healthScore"],
        creditsText: json["creditsText"],
        sourceName: json["sourceName"],
        pricePerServing: json["pricePerServing"],
        extendedIngredients: json["extendedIngredients"] == null
            ? null
            : List<ExtendedIngredient>.from(json["extendedIngredients"].map((x) => ExtendedIngredient.fromJson(x))),
        id: json["id"],
        title: json["title"],
        readyInMinutes: json["readyInMinutes"],
        servings: json["servings"],
        sourceUrl: json["sourceUrl"],
        image: json["image"],
        imageType: json["imageType"],
        summary: json["summary"],
        cuisines: json["cuisines"] == null ? null : List<dynamic>.from(json["cuisines"].map((x) => x)),
        dishTypes: json["dishTypes"] == null ? null : List<String>.from(json["dishTypes"].map((x) => x)),
        diets: json["diets"] == null ? null : List<String>.from(json["diets"].map((x) => x)),
        occasions: json["occasions"] == null ? null : List<dynamic>.from(json["occasions"].map((x) => x)),
        instructions: json["instructions"],
        analyzedInstructions: json["analyzedInstructions"] == null
            ? null
            : List<AnalyzedInstruction>.from(json["analyzedInstructions"].map((x) => AnalyzedInstruction.fromJson(x))),
        originalId: json["originalId"],
      );
  @override
  Map<String, dynamic> toJson() => {
        "vegetarian": vegetarian,
        "vegan": vegan,
        "glutenFree": glutenFree,
        "dairyFree": dairyFree,
        "veryHealthy": veryHealthy,
        "cheap": cheap,
        "veryPopular": veryPopular,
        "sustainable": sustainable,
        "weightWatcherSmartPoints": weightWatcherSmartPoints,
        "gaps": gaps,
        "lowFodmap": lowFodmap,
        "preparationMinutes": preparationMinutes,
        "cookingMinutes": cookingMinutes,
        "aggregateLikes": aggregateLikes,
        "spoonacularScore": spoonacularScore,
        "healthScore": healthScore,
        "creditsText": creditsText,
        "sourceName": sourceName,
        "pricePerServing": pricePerServing,
        "extendedIngredients": extendedIngredients == null ? null : List<dynamic>.from(extendedIngredients!.map((x) => x.toJson())),
        "id": id,
        "title": title,
        "readyInMinutes": readyInMinutes,
        "servings": servings,
        "sourceUrl": sourceUrl,
        "image": image,
        "imageType": imageType,
        "summary": summary,
        "cuisines": cuisines == null ? null : List<dynamic>.from(cuisines!.map((x) => x)),
        "dishTypes": dishTypes == null ? null : List<dynamic>.from(dishTypes!.map((x) => x)),
        "diets": diets == null ? null : List<dynamic>.from(diets!.map((x) => x)),
        "occasions": occasions == null ? null : List<dynamic>.from(occasions!.map((x) => x)),
        "instructions": instructions,
        "analyzedInstructions": analyzedInstructions == null ? null : List<dynamic>.from(analyzedInstructions!.map((x) => x.toJson())),
        "originalId": originalId,
      };

  @override
  RecipeInformationModel fromJson(Map<String, dynamic> json) => RecipeInformationModel.fromJson(json);
  RecipeInformationModel copyWith({
    bool? vegetarian,
    bool? vegan,
    bool? glutenFree,
    bool? dairyFree,
    bool? veryHealthy,
    bool? cheap,
    bool? veryPopular,
    bool? sustainable,
    num? weightWatcherSmartPoints,
    String? gaps,
    bool? lowFodmap,
    num? preparationMinutes,
    num? cookingMinutes,
    num? aggregateLikes,
    num? spoonacularScore,
    num? healthScore,
    String? creditsText,
    String? sourceName,
    num? pricePerServing,
    List<ExtendedIngredient>? extendedIngredients,
    int? id,
    String? title,
    num? readyInMinutes,
    num? servings,
    String? sourceUrl,
    String? image,
    String? imageType,
    String? summary,
    List<dynamic>? cuisines,
    List<String>? dishTypes,
    List<String>? diets,
    List<dynamic>? occasions,
    String? instructions,
    List<AnalyzedInstruction>? analyzedInstructions,
    dynamic originalId,
  }) =>
      RecipeInformationModel(
        vegetarian: vegetarian ?? this.vegetarian,
        vegan: vegan ?? this.vegan,
        glutenFree: glutenFree ?? this.glutenFree,
        dairyFree: dairyFree ?? this.dairyFree,
        veryHealthy: veryHealthy ?? this.veryHealthy,
        cheap: cheap ?? this.cheap,
        veryPopular: veryPopular ?? this.veryPopular,
        sustainable: sustainable ?? this.sustainable,
        weightWatcherSmartPoints: weightWatcherSmartPoints ?? this.weightWatcherSmartPoints,
        gaps: gaps ?? this.gaps,
        lowFodmap: lowFodmap ?? this.lowFodmap,
        preparationMinutes: preparationMinutes ?? this.preparationMinutes,
        cookingMinutes: cookingMinutes ?? this.cookingMinutes,
        aggregateLikes: aggregateLikes ?? this.aggregateLikes,
        spoonacularScore: spoonacularScore ?? this.spoonacularScore,
        healthScore: healthScore ?? this.healthScore,
        creditsText: creditsText ?? this.creditsText,
        sourceName: sourceName ?? this.sourceName,
        pricePerServing: pricePerServing ?? this.pricePerServing,
        extendedIngredients: extendedIngredients ?? this.extendedIngredients,
        id: id ?? this.id,
        title: title ?? this.title,
        readyInMinutes: readyInMinutes ?? this.readyInMinutes,
        servings: servings ?? this.servings,
        sourceUrl: sourceUrl ?? this.sourceUrl,
        image: image ?? this.image,
        imageType: imageType ?? this.imageType,
        summary: summary ?? this.summary,
        cuisines: cuisines ?? this.cuisines,
        dishTypes: dishTypes ?? this.dishTypes,
        diets: diets ?? this.diets,
        occasions: occasions ?? this.occasions,
        instructions: instructions ?? this.instructions,
        analyzedInstructions: analyzedInstructions ?? this.analyzedInstructions,
        originalId: originalId ?? this.originalId,
      );
}

class AnalyzedInstruction {
  AnalyzedInstruction({
    this.name,
    this.steps,
  });

  String? name;
  List<Step>? steps;

  factory AnalyzedInstruction.fromJson(Map<String, dynamic> json) => AnalyzedInstruction(
        name: json["name"],
        steps: json["steps"] == null ? null : List<Step>.from(json["steps"].map((x) => Step.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "steps": steps == null ? null : List<dynamic>.from(steps!.map((x) => x.toJson())),
      };

  AnalyzedInstruction copyWith({
    String? name,
    List<Step>? steps,
  }) =>
      AnalyzedInstruction(
        name: name ?? this.name,
        steps: steps ?? this.steps,
      );
}

class Step {
  Step({
    this.number,
    this.step,
    this.ingredients,
    this.equipment,
    this.length,
  });

  num? number;
  String? step;
  List<Ent>? ingredients;
  List<Ent>? equipment;
  Length? length;

  factory Step.fromJson(Map<String, dynamic> json) => Step(
        number: json["number"],
        step: json["step"],
        ingredients: json["ingredients"] == null ? null : List<Ent>.from(json["ingredients"].map((x) => Ent.fromJson(x))),
        equipment: json["equipment"] == null ? null : List<Ent>.from(json["equipment"].map((x) => Ent.fromJson(x))),
        length: json["length"] == null ? null : Length.fromJson(json["length"]),
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "step": step,
        "ingredients": ingredients == null ? null : List<dynamic>.from(ingredients!.map((x) => x.toJson())),
        "equipment": equipment == null ? null : List<dynamic>.from(equipment!.map((x) => x.toJson())),
        "length": length == null ? null : length!.toJson(),
      };
  Step copyWith({
    num? number,
    String? step,
    List<Ent>? ingredients,
    List<Ent>? equipment,
    Length? length,
  }) =>
      Step(
        number: number ?? this.number,
        step: step ?? this.step,
        ingredients: ingredients ?? this.ingredients,
        equipment: equipment ?? this.equipment,
        length: length ?? this.length,
      );
}

class Ent {
  Ent({
    this.id,
    this.name,
    this.localizedName,
    this.image,
  });

  int? id;
  String? name;
  String? localizedName;
  String? image;

  factory Ent.fromJson(Map<String, dynamic> json) => Ent(
        id: json["id"],
        name: json["name"],
        localizedName: json["localizedName"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "localizedName": localizedName,
        "image": image,
      };
  Ent copyWith({
    int? id,
    String? name,
    String? localizedName,
    String? image,
  }) =>
      Ent(
        id: id ?? this.id,
        name: name ?? this.name,
        localizedName: localizedName ?? this.localizedName,
        image: image ?? this.image,
      );
}

class Length {
  Length({
    this.number,
    this.unit,
  });

  num? number;
  String? unit;

  factory Length.fromJson(Map<String, dynamic> json) => Length(
        number: json["number"],
        unit: json["unit"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "unit": unit,
      };
  Length copyWith({
    num? number,
    String? unit,
  }) =>
      Length(
        number: number ?? this.number,
        unit: unit ?? this.unit,
      );
}

class ExtendedIngredient {
  ExtendedIngredient({
    this.id,
    this.aisle,
    this.image,
    this.consistency,
    this.name,
    this.nameClean,
    this.original,
    this.originalName,
    this.amount,
    this.unit,
    this.meta,
    this.measures,
  });

  int? id;
  String? aisle;
  String? image;
  String? consistency;
  String? name;
  String? nameClean;
  String? original;
  String? originalName;
  num? amount;
  String? unit;
  List<String>? meta;
  Measures? measures;

  factory ExtendedIngredient.fromJson(Map<String, dynamic> json) => ExtendedIngredient(
        id: json["id"],
        aisle: json["aisle"],
        image: json["image"],
        consistency: json["consistency"],
        name: json["name"],
        nameClean: json["nameClean"],
        original: json["original"],
        originalName: json["originalName"],
        amount: json["amount"],
        unit: json["unit"],
        meta: json["meta"] == null ? null : List<String>.from(json["meta"].map((x) => x)),
        measures: json["measures"] == null ? null : Measures.fromJson(json["measures"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "aisle": aisle,
        "image": image,
        "consistency": consistency,
        "name": name,
        "nameClean": nameClean,
        "original": original,
        "originalName": originalName,
        "amount": amount,
        "unit": unit,
        "meta": meta == null ? null : List<dynamic>.from(meta!.map((x) => x)),
        "measures": measures == null ? null : measures!.toJson(),
      };
  ExtendedIngredient copyWith({
    int? id,
    String? aisle,
    String? image,
    String? consistency,
    String? name,
    String? nameClean,
    String? original,
    String? originalName,
    num? amount,
    String? unit,
    List<String>? meta,
    Measures? measures,
  }) =>
      ExtendedIngredient(
        id: id ?? this.id,
        aisle: aisle ?? this.aisle,
        image: image ?? this.image,
        consistency: consistency ?? this.consistency,
        name: name ?? this.name,
        nameClean: nameClean ?? this.nameClean,
        original: original ?? this.original,
        originalName: originalName ?? this.originalName,
        amount: amount ?? this.amount,
        unit: unit ?? this.unit,
        meta: meta ?? this.meta,
        measures: measures ?? this.measures,
      );
}

class Measures {
  Measures({
    this.us,
    this.metric,
  });

  Metric? us;
  Metric? metric;

  factory Measures.fromJson(Map<String, dynamic> json) => Measures(
        us: json["us"] == null ? null : Metric.fromJson(json["us"]),
        metric: json["metric"] == null ? null : Metric.fromJson(json["metric"]),
      );

  Map<String, dynamic> toJson() => {
        "us": us == null ? null : us!.toJson(),
        "metric": metric == null ? null : metric!.toJson(),
      };
  Measures copyWith({
    Metric? us,
    Metric? metric,
  }) =>
      Measures(
        us: us ?? this.us,
        metric: metric ?? this.metric,
      );
}

class Metric {
  Metric({
    this.amount,
    this.unitShort,
    this.unitLong,
  });

  num? amount;
  String? unitShort;
  String? unitLong;

  Metric copyWith({
    num? amount,
    String? unitShort,
    String? unitLong,
  }) =>
      Metric(
        amount: amount ?? this.amount,
        unitShort: unitShort ?? this.unitShort,
        unitLong: unitLong ?? this.unitLong,
      );

  factory Metric.fromJson(Map<String, dynamic> json) => Metric(
        amount: json["amount"],
        unitShort: json["unitShort"],
        unitLong: json["unitLong"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "unitShort": unitShort,
        "unitLong": unitLong,
      };
}
