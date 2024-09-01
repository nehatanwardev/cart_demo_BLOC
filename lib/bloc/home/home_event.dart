part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeProductAddToCart extends HomeEvent {
  final ProductDataModel productDataModel;

  HomeProductAddToCart({required this.productDataModel});
}

class HomeCartNavigateEvent extends HomeEvent {}

class HomeInitialEvent extends HomeEvent {}
