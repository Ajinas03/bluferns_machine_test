import 'package:bloc/bloc.dart';
import 'package:blueferns_machine_test/models/filter_model.dart';
import 'package:blueferns_machine_test/repo/home_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    List<String> filterList = [];

    on<HomeEvent>((event, emit) async {
      if (event is GetFilterItems) {
        emit(HomeState(
            isLoading: state.isLoading, filterItems: state.filterItems));

        final itemModel = await HomeRepo.fetchFilterData();

        emit(HomeState(
            isLoading: false,
            filterModel: itemModel,
            filterItems: state.filterItems));
      }

      if (event is AddFilter) {
        if (filterList.contains(event.filterItem)) {
          filterList.remove(event.filterItem);

          print(" item length ${filterList.length} item removed");
        } else {
          filterList.add(event.filterItem);
          print(" item length ${filterList.length} item added");
        }
        emit(HomeState(
            isLoading: state.isLoading,
            filterModel: state.filterModel,
            filterItems: filterList));
      }
    });
  }
}
