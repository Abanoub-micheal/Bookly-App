import 'package:bookly_app/Features/home/data/models/book_model.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/font_style.dart';
import 'book_rating.dart';
import 'custom_image_best_seller.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.bookModel});
final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .9,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageBestSeller(imageUrl: bookModel.volumeInfo!.imageLinks!.thumbnail??'',),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child: Text(
                        bookModel.volumeInfo!.title!,
                        style: Styles.textStyle20
                            .copyWith(fontFamily: 'GT Sectra Fine'),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )),
                   Text(
                    bookModel.volumeInfo!.authors![0],
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Row(
                    children: [
                      Text('Free',
                          style: Styles.textStyle20
                              .copyWith(fontWeight: FontWeight.bold)),
                      const Spacer(),
                    BookRating(
                        countRating: 0 ,
                        averageRating: 0,)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
