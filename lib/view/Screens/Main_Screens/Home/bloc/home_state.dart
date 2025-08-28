part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();
  
  @override
  List<Object> get props => [];
}

final class HomeLoading extends HomeState {}
final class ErrorState extends HomeState {}
final class LoadedState extends HomeState {
  final ModelHomeData repo;
  const LoadedState(this.repo);
}
// final class OfflineState extends HomeState {} // این بعدا در تکمیل دیتا بیس USERS انجام میشود
