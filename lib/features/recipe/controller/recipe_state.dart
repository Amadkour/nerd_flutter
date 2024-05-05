sealed class RecipeState {}

final class RecipeStateLoading extends RecipeState {}

final class RecipeStateLoaded extends RecipeState {}

final class RecipeStateError extends RecipeState {
  final String error;

  RecipeStateError({required this.error});
}

final class RecipeStateEmpty extends RecipeState {}
