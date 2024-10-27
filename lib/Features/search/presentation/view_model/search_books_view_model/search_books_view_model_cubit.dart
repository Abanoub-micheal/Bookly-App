import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/Features/search/data/repo/search_repo_impl.dart';
import 'package:meta/meta.dart';
import '../../../../home/data/models/book_model.dart';
part 'search_books_view_model_state.dart';

class SearchBooksViewModelCubit extends Cubit<SearchBooksViewModelState> {
  SearchBooksViewModelCubit({required this.searchRepoImpl}) : super(SearchBooksViewModelInitial());
 final SearchRepoImpl searchRepoImpl;

  Future<void> fetchSearchBooks(String searchWord)async{
    emit(SearchBooksViewModelLoading(loadingMessage: 'Loading...'));
    var result=await searchRepoImpl.fetchSearchBooks(searchWord: searchWord);
    result.fold((failure) {
      SearchBooksViewModelError(errorMessage: failure.errorMessage);
    }, (books) {
      emit(SearchBooksViewModelSuccess(books: books));
    },);

  }








}
