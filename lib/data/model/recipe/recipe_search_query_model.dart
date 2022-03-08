class RecipeSearchQueryModel {
  String? query;
  String? diet;
  String? excludeIngredients;
  String? intolerances;
  int? number;
  int? offset;
  String? type;
  RecipeSearchQueryModel({
    this.query,
    this.diet,
    this.excludeIngredients,
    this.intolerances,
    this.number = 10,
    this.offset = 0,
    this.type,
  });

  RecipeSearchQueryModel copyWith({
    String? query,
    String? diet,
    String? excludeIngredients,
    String? intolerances,
    int? number,
    int? offset,
    String? type,
  }) {
    return RecipeSearchQueryModel(
      query: query ?? this.query,
      diet: diet ?? this.diet,
      excludeIngredients: excludeIngredients ?? this.excludeIngredients,
      intolerances: intolerances ?? this.intolerances,
      number: number ?? this.number,
      offset: offset ?? this.offset,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toJson() => {
        'query': query,
        'diet': diet,
        'excludeIngredients': excludeIngredients,
        'intolerances': intolerances,
        'number': number,
        'offset': offset,
        'type': type,
      };
}
