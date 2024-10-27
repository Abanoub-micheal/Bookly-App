import 'package:flutter/material.dart';
import '../../../../../core/utils/font_style.dart';
import '../../../data/models/book_model.dart';
import 'book_rating.dart';
import 'books_actions.dart';
import 'custom_image_book_details.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    var  bookModel = ModalRoute.of(context)!.settings.arguments as BookModel ;
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding:
            EdgeInsets.only(left: width * 0.3, right: width * 0.3, top: 10),
            child:  CustomImageBookDetails(imageUrl: bookModel.volumeInfo!.imageLinks!.thumbnail??'',),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              bookModel.volumeInfo!.title??'',
              style: Styles.textStyle30,
                overflow: TextOverflow.ellipsis,maxLines: 1,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
           Opacity(opacity: .7, child: Text(bookModel.volumeInfo!.authors![0])),
          const SizedBox(
            height: 17,
          ),
           const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BookRating(averageRating: 0,countRating: 0,),
            ],
          ),
          const SizedBox(height: 30,),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 38),
      
            child: BooksActions(),
          ),
      
        ],
      ),
    );
  }
}