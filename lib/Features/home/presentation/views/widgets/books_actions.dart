import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../data/models/book_model.dart';

class BooksActions extends StatelessWidget {
  const BooksActions({super.key});

  @override
  Widget build(BuildContext context) {
    var  bookModel = ModalRoute.of(context)!.settings.arguments as BookModel ;
    return  Row(
      children: [
        Expanded(
          child: CustomButton(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
            backgroundColor: Colors.white,
            text: 'Free',
            textColor: Colors.black,
          ),
        ),
        Expanded(
          child: CustomButton(
            onPressed: ()async {
              Uri url=Uri.parse(bookModel.volumeInfo!.previewLink!);
              if (!await launchUrl(url)) {
                throw Exception('Could not launch $url');
              }
            },
            fontSize: 18,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(16), bottomRight: Radius.circular(16)),
            backgroundColor: Color(0xffEF8262),
            text: 'Free preview',
            textColor: Colors.white,
          ),
        )
      ],
    );
  }
}