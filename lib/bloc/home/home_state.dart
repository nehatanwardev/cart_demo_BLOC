part of 'home_bloc.dart';

@immutable
abstract class HomeState {} // build state

class HomeActionState extends HomeState {} // action state

class HomeInitial extends HomeState {}

class LoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  List<ProductDataModel> products;
  HomeLoadedSuccessState({required this.products});
}

class HomeErrorState extends HomeState {}

class HomeNavigateToCartState extends HomeActionState {}
class HomeProductedAddedTocartState extends HomeActionState {}
