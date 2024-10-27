import 'package:bookly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/Features/home/presentation/view_models/featured_book_view_model/feature_books_view_model.dart';
import 'package:bookly_app/Features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/Features/home/presentation/views/home_view.dart';
import 'package:bookly_app/Features/search/presentation/views/search_view.dart';
import 'package:bookly_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Features/home/presentation/view_models/newest_books_view_model/newest_books_view_model.dart';
import 'Features/splash/presentation/views/splash_view.dart';
import 'core/utils/di_by_get_it.dart';

void main(){
  setupServiceLocator();
  runApp(const Bookly());

}
class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(

      providers: [
        BlocProvider(create: (context) => FeatureBooksViewModel(getIt.get<HomeRepoImpl>())..fetchFeaturedBooks(),),
        BlocProvider(create: (context) => NewestBooksViewModel(getIt.get<HomeRepoImpl>())..fetchNewestBooks(),),
      ],
      child: MaterialApp(
        routes: {
          SplashView.routeName :(context)=> const SplashView(),
          HomeView.routeName :(context)=> const HomeView(),
          BookDetailsView.routeName :(context)=> const BookDetailsView(),
          SearchView.routeName :(context)=> const SearchView(),

        },
        initialRoute: SplashView.routeName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith( scaffoldBackgroundColor: kPrimaryColor,
        textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)
        ),
        home: const SplashView(),

      ),
    );
  }
}

