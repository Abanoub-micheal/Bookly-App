import 'package:dio/dio.dart';

abstract class Failure{
  String errorMessage;
  Failure({required this.errorMessage});
}

class ServerFailure extends Failure{
  ServerFailure({required super.errorMessage});

  factory ServerFailure.fromDioError(DioException dioError){
    switch(dioError.type){
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errorMessage: 'Connection Timeout with Api Server ');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMessage: 'Send Timeout with Api Server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMessage: 'receive Timeout with Api Server');
      case DioExceptionType.cancel:
        return ServerFailure(errorMessage: '');
      case DioExceptionType.badResponse:
        return ServerFailure(errorMessage: dioError.message!);
      case DioExceptionType.connectionError:
        return ServerFailure(errorMessage: 'No internet connection');
      case DioExceptionType.unknown:
        return ServerFailure(errorMessage: 'un expected Error, please try later');

        default:
          return ServerFailure(errorMessage: 'Opps there was an Error, Please try agan !');
    }
    }


}