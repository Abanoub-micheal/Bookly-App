import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/models/book_model.dart';
import '../../../data/repos/home_repo_impl.dart';
part 'similar_books_state.dart';

class SimilarBooksViewModel extends Cubit<SimilarBooksState> {
  SimilarBooksViewModel(this.homeRepoImpl) : super(SimilarBooksViewModelInitial());
  final HomeRepoImpl homeRepoImpl;
  Future<void>fetchSimilarBooks({required String category})async{
    emit(SimilarBooksLoading(loadingMessage: 'Loading...'));
    var result=await homeRepoImpl.fetchSimilarBooks(category: category);
    result.fold((failure) {
      SimilarBooksError(errorMessage: failure.errorMessage);
    }, (books) {
      emit(SimilarBooksSuccess(books: books));
    },);

  }

}
