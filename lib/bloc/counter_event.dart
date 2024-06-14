part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}


class Increament extends CounterEvent {}

class Decreament extends CounterEvent {}