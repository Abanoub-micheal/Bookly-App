import 'package:bookly_app/Features/home/data/models/book_model.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/Features/home/presentation/view_models/similar_books_view_model/similar_books_view_model.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/book_details_body.dart';
import 'package:bookly_app/core/utils/di_by_get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatelessWidget {
  static const String routeName = 'book-details';

  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    var bookModel = ModalRoute.of(context)!.settings.arguments as BookModel;
    return BlocProvider(
      create: (context) => SimilarBooksViewModel(getIt.get<HomeRepoImpl>())
        ..fetchSimilarBooks(category: bookModel.volumeInfo!.categories![0]),
      child: Scaffold(
        body: BookDetailsBody(),
      ),
    );
  }
}
