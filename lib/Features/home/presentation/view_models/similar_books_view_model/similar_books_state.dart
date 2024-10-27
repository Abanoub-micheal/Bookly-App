part of 'similar_books_view_model.dart';

@immutable
sealed class SimilarBooksState {}

final class SimilarBooksViewModelInitial extends SimilarBooksState {}
final class SimilarBooksError extends SimilarBooksState {
  final String errorMessage;

  SimilarBooksError({required this.errorMessage});


}
final class SimilarBooksLoading extends SimilarBooksState {
  final String loadingMessage;

  SimilarBooksLoading({required this.loadingMessage});


}
final class SimilarBooksSuccess extends SimilarBooksState {

  final List<BookModel> books;

  SimilarBooksSuccess({required this.books});
}