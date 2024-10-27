part of 'feature_books_view_model.dart';

@immutable
sealed class FeatureBooksState {}

final class FeatureBooksInitial extends FeatureBooksState {}
final class FeatureBooksError extends FeatureBooksState {
 final String errorMessage;

  FeatureBooksError({required this.errorMessage});


}
final class FeatureBooksLoading extends FeatureBooksState {
 final String loadingMessage;

  FeatureBooksLoading({required this.loadingMessage});


}
final class FeatureBooksSuccess extends FeatureBooksState {

 final List<BookModel> books;

  FeatureBooksSuccess({required this.books});
}
