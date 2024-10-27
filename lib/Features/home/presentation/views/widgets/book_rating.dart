import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/font_style.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key, required this.averageRating, required this.countRating});
 final int averageRating;
 final int countRating;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(FontAwesomeIcons.solidStar,color: Color(0xffFFDD4F),size: 16,),
        SizedBox(width: 6.3,),
        Text('$averageRating',style: Styles.textStyle16,),
        SizedBox(width: 5,),
        Text('($countRating)',style: TextStyle(color: Color(0xff707070)),)

      ],
    );
  }
}