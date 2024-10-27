import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:meta/meta.dart';

import '../../../data/models/book_model.dart';

part 'feature_books_state.dart';

class FeatureBooksViewModel extends Cubit<FeatureBooksState> {
  FeatureBooksViewModel(this.homeRepoImpl) : super(FeatureBooksInitial());
final HomeRepoImpl homeRepoImpl;
  Future<void>fetchFeaturedBooks()async{
    emit(FeatureBooksLoading(loadingMessage: 'Loading...'));
   var result=await homeRepoImpl.fetchFeaturedBooks();
     result.fold((failure) {
          FeatureBooksError(errorMessage: failure.errorMessage);
     }, (books) {
        emit(FeatureBooksSuccess(books: books));
     },);

  }
}
