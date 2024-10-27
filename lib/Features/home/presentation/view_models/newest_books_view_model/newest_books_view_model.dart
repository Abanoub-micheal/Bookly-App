import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:meta/meta.dart';
import '../../../data/models/book_model.dart';
part 'newest_books_state.dart';

class NewestBooksViewModel extends Cubit<NewestBooksState> {
  NewestBooksViewModel(this.homeRepoImpl) : super(NewestBooksInitial());
final HomeRepoImpl homeRepoImpl;
  Future<void>fetchNewestBooks()async{
    emit(NewestBooksLoading(loadingMessage: 'Loading...'));
   var result=await homeRepoImpl.fetchNewestBooks();
     result.fold((failure) {
       NewestBooksError(errorMessage: failure.errorMessage);
     }, (books) {
        emit(NewestBooksSuccess(books: books));
     },);

  }
}
