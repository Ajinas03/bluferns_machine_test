part of 'home_bloc.dart';

abstract class HomeEvent {}

class GetFilterItems extends HomeEvent {}

class AddFilter extends HomeEvent {
  final String filterItem;

  AddFilter({required this.filterItem});
}
