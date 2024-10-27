import 'package:flutter/material.dart';
import '../../../../../core/utils/font_style.dart';
import 'best_seller_list_view.dart';
import 'custom_app_bar.dart';
import 'featured_books_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomAppBar(),
              FeaturedBooksListView(),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child:  Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Best Seller',
              style: Styles.textStyle18,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: BestSellerListView() ,
        )


      ],
    );
  }
}






