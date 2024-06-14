// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bird_bloc.dart';

@immutable
sealed class BirdState {}

final class BirdInitial extends BirdState {}

class SuccessToGetBird extends BirdState {
  BirdModel birdModel;
  SuccessToGetBird({
    required this.birdModel,
  });
}


class Error extends BirdState {}

class LoadingBird extends BirdState {}