part of 'search_books_view_model_cubit.dart';

@immutable
sealed class SearchBooksViewModelState {}

final class SearchBooksViewModelInitial extends SearchBooksViewModelState {}
final class SearchBooksViewModelLoading extends SearchBooksViewModelState {
  final String loadingMessage;
  SearchBooksViewModelLoading({required this.loadingMessage});
}
final class SearchBooksViewModelSuccess extends SearchBooksViewModelState {
  final List<BookModel> books;
  SearchBooksViewModelSuccess({required this.books});

}
final class SearchBooksViewModelError extends SearchBooksViewModelState {

  final String errorMessage;

  SearchBooksViewModelError({required this.errorMessage});

}
