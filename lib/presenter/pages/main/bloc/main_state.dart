part of 'main_bloc.dart';

class MainState {
  final Status? status;
  final CatModel? fact;
  final String? img;
  final String? message;

  MainState({this.status, this.fact, this.message, this.img});

  MainState copyWith({Status? status, CatModel? fact, String? message, String? img}) => MainState(status: status ?? this.status, fact: fact ?? this.fact, message: message ?? this.message, img: img ?? this.img);
}

class MainInitial extends MainState {}

