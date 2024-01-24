import 'package:bloc/bloc.dart';
import 'package:flutter_task/data/model/reponse_model/cat_model.dart';
import 'package:flutter_task/utils/status.dart';
import 'package:meta/meta.dart';

import '../../../../data/model/hive_model/cat_holder.dart';
import '../../../../data/source/local/hive/hive_helper.dart';
import '../../../../di/di.dart';
import '../../../../domain/repository/app_repository.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final repository = getIt<AppRepository>();

  MainBloc() : super(MainState()) {
    on<MainLoadEvent>((event, emit) async{
      emit(state.copyWith(status: Status.loading));
      try{
        final resultFact = await repository.getFacts();
        if(resultFact.text != ""){
          HiveHelper.saveFact(CatHolder(sId: resultFact.sId, text: resultFact.text, createdAt: resultFact.createdAt));
        }
        emit(state.copyWith(status: Status.success, fact: resultFact, img: 'https://cataas.com/cat?${DateTime.now().millisecondsSinceEpoch}'));
      }catch(e){
        emit(state.copyWith(status: Status.error, message: e.toString()));
      }
    });
  }
}
