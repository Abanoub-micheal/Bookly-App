import 'package:bookly_app/Features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:28 ,right: 28,top: 50,bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(AssetsData.logo,height: 18,),

          IconButton(onPressed: () {
           Navigator.pushNamed(context, SearchView.routeName);
          }, icon: const Icon(Icons.search_sharp,size: 26,))

        ],
      ),
    );
  }
}