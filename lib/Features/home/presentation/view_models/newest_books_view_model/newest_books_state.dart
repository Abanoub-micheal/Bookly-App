part of 'newest_books_view_model.dart';

@immutable
sealed class NewestBooksState {}

final class NewestBooksInitial extends NewestBooksState {}
final class NewestBooksError extends NewestBooksState {
 final String errorMessage;

 NewestBooksError({required this.errorMessage});


}
final class NewestBooksLoading extends NewestBooksState {
 final String loadingMessage;

 NewestBooksLoading({required this.loadingMessage});


}
final class NewestBooksSuccess extends NewestBooksState {

 final List<BookModel> books;

 NewestBooksSuccess({required this.books});
}
