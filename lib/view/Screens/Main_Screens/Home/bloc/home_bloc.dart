import 'package:bloc/bloc.dart';
import 'package:blog_system_app/controller/data/HomeData/repo.dart';
import 'package:blog_system_app/model/model_home_data.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IRepositoryHomeData repo;
  HomeBloc({required this.repo}) : super(HomeLoading()) {
    on<HomeEvent>((event, emit)async {
      if(event is HomeInit){
        try {
          emit(HomeLoading());
          final homePage = await repo.homePage();
          emit(LoadedState(homePage!));

        } catch (e) {
          emit(ErrorState());
        }


      }else if(event is HomeOfline){
        try {
          emit(HomeLoading());

        } catch (e) {
          emit(ErrorState());
        }
      }
    });
  }
}
