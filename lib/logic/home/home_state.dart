part of 'home_bloc.dart';

class HomeState {
  bool isLoading;
  List<String> filterItems;
  FilterModel? filterModel;
  HomeState(
      {required this.isLoading, this.filterModel, required this.filterItems});
}

final class HomeInitial extends HomeState {
  HomeInitial() : super(isLoading: true, filterItems: []);
}
