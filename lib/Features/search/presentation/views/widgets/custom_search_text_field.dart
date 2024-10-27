import 'package:bookly_app/Features/search/presentation/view_model/search_books_view_model/search_books_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearchTextField extends StatelessWidget {
 CustomSearchTextField({super.key, this.onChange, this.onSubmitted, this.onPressedButton});
  final void Function(String)? onChange;
  final void Function(String)? onSubmitted;
   final   void Function()?onPressedButton;
   String searchWord='music';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60
      ,
      child: TextField(
        onChanged: (value) {
         searchWord=value;
        },
        onSubmitted:(value) {
          searchWord=value;
        },
        cursorColor: Colors.white,
        decoration: InputDecoration(
          suffixIcon:IconButton(onPressed:onPressedButton
            , icon: const Opacity(opacity: .7,child: Icon(Icons.search_sharp,size: 26,)),),
          suffixIconColor: Colors.white,
          hintText: 'Search',
          focusedBorder:  buildOutlineInputBorder(),
          enabledBorder: buildOutlineInputBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.white),
    );
  }
}