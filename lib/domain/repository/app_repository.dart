

import 'package:flutter_task/data/model/reponse_model/cat_model.dart';

abstract class AppRepository{
  Future<CatModel> getFacts();
  Future<String> getImage();
}