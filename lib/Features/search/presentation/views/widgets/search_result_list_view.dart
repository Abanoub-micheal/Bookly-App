import 'package:bookly_app/Features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:bookly_app/Features/search/data/repo/search_repo_impl.dart';
import 'package:bookly_app/Features/search/presentation/view_model/search_books_view_model/search_books_view_model_cubit.dart';
import 'package:bookly_app/core/utils/di_by_get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../home/presentation/views/book_details_view.dart';


class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key, required this.searchWord});
 final String  searchWord;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksViewModelCubit, SearchBooksViewModelState>(
      bloc: SearchBooksViewModelCubit(searchRepoImpl:getIt.get<SearchRepoImpl>())..fetchSearchBooks(searchWord),
      builder: (context, state) {
        if (state is SearchBooksViewModelSuccess) {
          return ListView.builder(
                   shrinkWrap: true,
                   physics:BouncingScrollPhysics(),
                     itemCount:state.books.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      print('List length: ${state.books.length}');
                      return InkWell(onTap: () {
                        Navigator.pushNamed(context, BookDetailsView.routeName,arguments: state.books[index]);
                      }, child: BookListViewItem(
                        bookModel: state.books[index],)
                        // const BookListViewItem(bookModel: )
                      );
                    },);

        } else if(state is SearchBooksViewModelError) {
          return Center(child: Text(state.errorMessage));
        }
        else{
          return const Center(child: CircularProgressIndicator());

        }
      },
    );
  }
}