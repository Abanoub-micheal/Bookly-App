import 'package:bookly_app/Features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';
import 'book_detials_section.dart';
import 'custom_book_details_app_bar.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {

    return const Column(
      children: [
        SafeArea(child: CustomBookDetailsAppBar()),

         BookDetailsSection(),
       Padding(
         padding: EdgeInsets.only(left: 35),
         child: SimilarBooksSection(),
       )
      ],
    );
  }
}









