import 'package:bookly_app/Features/home/presentation/view_models/similar_books_view_model/similar_books_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'featured_list_view_item.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksViewModel, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * .15,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.books.length,
                      itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: FeaturedListViewItem(imageUrl: state.books[index].volumeInfo!.imageLinks!.thumbnail!??'',),
                      );
                    }, scrollDirection: Axis.horizontal,),
                  );
        } else if(state is SimilarBooksError) {
          return  Text(state.errorMessage);
        }else{
          return Center(child: CircularProgressIndicator(),);

        }
      },
    );;
  }
}