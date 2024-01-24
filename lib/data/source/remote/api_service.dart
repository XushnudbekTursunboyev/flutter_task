import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:flutter_task/data/model/reponse_model/cat_model.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('/facts')
  Future<List<CatModel>> getFacts();

  @GET('https://cataas.com/cat')
  Future<String> getImage();
}
