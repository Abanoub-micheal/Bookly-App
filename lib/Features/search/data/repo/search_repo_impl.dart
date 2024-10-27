import 'package:bookly_app/Features/home/data/models/book_model.dart';
import 'package:bookly_app/Features/search/data/repo/search_repo.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/api_service.dart';

class SearchRepoImpl implements SearchRepo{
    ApiService apiService;
    SearchRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchBooks({required String searchWord})async {
    try {
      var data = await apiService.get(
          endpoint:
          'volumes?Filtering=free-ebooks&q=$searchWord&Sorting=relevance');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }





}
