class RecipeModel {
  final String? id;
  final String? fats;
  final String? name;
  final String? time;
  final String? image;
  final List<String>? weeks;
  final String? carbos;
  final String? fibers;
  final dynamic rating;
  final String? country;
  int? ratings;
  final String? calories;
  final String? headline;
  final List<String>? keywords;
  final List<String>? products;
  final String? proteins;
  int? favorites;
  final int? difficulty;
  final String? description;
  final bool? highlighted;
  final List<String>? ingredients;
  final dynamic incompatibilities;
  final List<String>? deliverableIngredients;
  final List<dynamic>? undeliverableIngredients;

  bool isFavorite = false;
  bool get toggelFavorite {
    isFavorite = !isFavorite;
    if (isFavorite) {
      favorites = (favorites ?? 0) + 1;
    } else {
      favorites = (favorites ?? 0) - 1;
    }
    return isFavorite;
  }

  bool isRate = false;
  bool get toggelRate {
    isRate = !isRate;
    if (isRate) {
      ratings = (ratings ?? 0) + 1;
    } else {
      ratings = (ratings ?? 0) - 1;
    }
    return isRate;
  }

  RecipeModel({
    this.id,
    this.fats,
    this.name,
    this.time,
    this.image,
    this.weeks,
    this.carbos,
    this.fibers,
    this.rating,
    this.country,
    this.ratings,
    this.calories,
    this.headline,
    this.keywords,
    this.products,
    this.proteins,
    this.favorites,
    this.difficulty,
    this.description,
    this.highlighted,
    this.ingredients,
    this.incompatibilities,
    this.deliverableIngredients,
    this.undeliverableIngredients,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) => RecipeModel(
        id: json["id"],
        fats: json["fats"],
        name: json["name"],
        time: json["time"],
        image: json["image"],
        weeks: json["weeks"] == null
            ? []
            : List<String>.from(json["weeks"]!.map((x) => x)),
        carbos: json["carbos"],
        fibers: json["fibers"],
        rating: json["rating"],
        country: json["country"],
        ratings: json["ratings"],
        calories: json["calories"],
        headline: json["headline"],
        keywords: json["keywords"] == null
            ? []
            : List<String>.from(json["keywords"]!.map((x) => x))
                .where((element) => element.isNotEmpty)
                .toList(),
        products: json["products"] == null
            ? []
            : List<String>.from(json["products"]!.map((x) => x)),
        proteins: json["proteins"],
        favorites: json["favorites"],
        difficulty: json["difficulty"],
        description: json["description"],
        highlighted: json["highlighted"],
        ingredients: json["ingredients"] == null
            ? []
            : List<String>.from(json["ingredients"]!.map((x) => x)),
        incompatibilities: json["incompatibilities"],
        deliverableIngredients: json["deliverable_ingredients"] == null
            ? []
            : List<String>.from(json["deliverable_ingredients"]!.map((x) => x)),
        undeliverableIngredients: json["undeliverable_ingredients"] == null
            ? []
            : List<dynamic>.from(
                json["undeliverable_ingredients"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fats": fats,
        "name": name,
        "time": time,
        "image": image,
        "weeks": weeks == null ? [] : List<dynamic>.from(weeks!.map((x) => x)),
        "carbos": carbos,
        "fibers": fibers,
        "rating": rating,
        "country": country,
        "ratings": ratings,
        "calories": calories,
        "headline": headline,
        "keywords":
            keywords == null ? [] : List<dynamic>.from(keywords!.map((x) => x)),
        "products":
            products == null ? [] : List<dynamic>.from(products!.map((x) => x)),
        "proteins": proteins,
        "favorites": favorites,
        "difficulty": difficulty,
        "description": description,
        "highlighted": highlighted,
        "ingredients": ingredients == null
            ? []
            : List<dynamic>.from(ingredients!.map((x) => x)),
        "incompatibilities": incompatibilities,
        "deliverable_ingredients": deliverableIngredients == null
            ? []
            : List<dynamic>.from(deliverableIngredients!.map((x) => x)),
        "undeliverable_ingredients": undeliverableIngredients == null
            ? []
            : List<dynamic>.from(undeliverableIngredients!.map((x) => x)),
      };
}
