import 'package:bookly_app/Features/search/data/repo/search_repo_impl.dart';
import 'package:bookly_app/Features/search/presentation/view_model/search_books_view_model/search_books_view_model_cubit.dart';
import 'package:bookly_app/Features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:bookly_app/core/utils/di_by_get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/font_style.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  String searchWord = 'programming';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBooksViewModelCubit(searchRepoImpl: getIt.get<SearchRepoImpl>()),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SafeArea(child: CustomSearchTextField(
              onPressedButton: () {
                BlocProvider.of<SearchBooksViewModelCubit>(context).fetchSearchBooks(searchWord);
                setState(() {
                });
              },
              onSubmitted: (value) {
              searchWord=value;
            }, onChange: (value) {
               searchWord=value;
            },)),
            const SizedBox(height: 20,),
            const Text(
              'Best Seller',
              style: Styles.textStyle18,
            ),
            const SizedBox(height: 15,),
            Expanded(child: SearchResultListView(searchWord: searchWord,)),
          ],
        ),
      ),
    );
  }
}




