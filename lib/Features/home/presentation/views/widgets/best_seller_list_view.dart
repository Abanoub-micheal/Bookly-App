import 'package:bookly_app/Features/home/presentation/view_models/newest_books_view_model/newest_books_view_model.dart';
import 'package:bookly_app/Features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksViewModel, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return Padding(
                    padding: const EdgeInsets.only(right: 47, left: 30),
                    child: ListView.builder(
                      itemCount: state.books.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return InkWell(onTap: () {
                          Navigator.pushNamed(context, BookDetailsView.routeName,arguments: state.books[index]);
                        }, child:  BookListViewItem(bookModel: state.books[index]));
                      },),
                  );
        } else if (state is NewestBooksError){
          return Text(state.errorMessage);

        }else{
          return const Center(child: CircularProgressIndicator());

        }
      },
    );
  }
}