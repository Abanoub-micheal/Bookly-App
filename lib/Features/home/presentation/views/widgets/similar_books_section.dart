import 'package:bookly_app/Features/home/presentation/views/widgets/similar_book_list_view.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/font_style.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 50,),
        Text('You can also like',style: Styles.textStyle16,),
        SizedBox(height: 16,),
        SimilarBooksListView()
      ],
    );
  }
}