import 'dart:math';
import 'package:flutter_task/data/model/reponse_model/cat_model.dart';
import 'package:flutter_task/data/source/remote/api_service.dart';
import '../../di/di.dart';
import '../../domain/repository/app_repository.dart';

class AppRepositoryImpl extends AppRepository {
  final api = getIt<ApiService>();

  @override
  Future<CatModel> getFacts() async{
    final result = await api.getFacts();

    if (result.isNotEmpty) {
      final i = Random().nextInt(5);
      return result[i];
    } else {
      throw Exception("Facts is empty");
    }
  }

  @override
  Future<String> getImage() async{
    final result = api.getImage();
    return result;
  }

}