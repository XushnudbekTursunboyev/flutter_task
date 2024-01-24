

import 'package:dio/dio.dart';
import 'package:flutter_task/data/source/remote/api_service.dart';
import 'package:get_it/get_it.dart';
import '../data/repository/app_repository_impl.dart';
import '../domain/repository/app_repository.dart';

final getIt = GetIt.instance;
final dio = Dio(BaseOptions(
  baseUrl: 'https://cat-fact.herokuapp.com',
  receiveDataWhenStatusError: true,
));

void setup() {
  getIt.registerSingleton<ApiService>(ApiService(dio));
  getIt.registerSingleton<AppRepository>(AppRepositoryImpl());
}
