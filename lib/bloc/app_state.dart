part of 'app_bloc.dart';

@immutable
sealed class AppState {}

final class AppInitial extends AppState {}



class HeLoggedIn extends AppState {}

class SecondTime extends AppState {}

class HeSigendUp extends AppState {}
