import 'package:bookly_app/Features/home/presentation/view_models/featured_book_view_model/feature_books_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../book_details_view.dart';
import 'featured_list_view_item.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeatureBooksViewModel, FeatureBooksState>(
      builder: (context, state) {
       if(state is FeatureBooksSuccess){
         return SizedBox(
           height: MediaQuery
               .of(context)
               .size
               .height * .3,
           child: ListView.builder(
             physics: const BouncingScrollPhysics(),
             itemCount: state.books.length,itemBuilder: (context, index) {
             return Padding(
               padding:  const EdgeInsets.only(right: 20),
               child: GestureDetector(
                 onTap: () {
                   Navigator.pushNamed(context, BookDetailsView.routeName,arguments: state.books[index]);
                 },
                 child: FeaturedListViewItem(imageUrl: state.books[index].volumeInfo!.imageLinks!.thumbnail!,
                              ),
               ));
           }, scrollDirection: Axis.horizontal,),
         );
       } else if(state is FeatureBooksError){

         return Text(state.errorMessage);

       }else{
         return const Center(child: CircularProgressIndicator());

       }

      },
    );
  }
}