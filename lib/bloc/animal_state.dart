// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'animal_bloc.dart';

@immutable
sealed class AnimalState {}

final class AnimalInitial extends AnimalState {}

class SuccessGetAnimal extends AnimalState{
  final List<AnimalModel> result;

  SuccessGetAnimal({required this.result});
 
}

class ErrorFetchingData extends AnimalState {}

class LoadingFetching extends AnimalState {}