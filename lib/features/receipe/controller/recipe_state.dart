sealed class ReceipeState {}

final class ReceipeStateLoading extends ReceipeState {}

final class ReceipeStateLoaded extends ReceipeState {}

final class ReceipeStateError extends ReceipeState {
  final String error;

  ReceipeStateError({required this.error});
}

final class ReceipeStateEmpty extends ReceipeState {}
