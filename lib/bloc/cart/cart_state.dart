part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

abstract class CartActionState extends CartState {}

class CartInitial extends CartState {}
class CartLoading extends CartState {}

class CartSuccessLoadedState extends CartState {
  final List<ProductDataModel> productDataModel;

  CartSuccessLoadedState({required this.productDataModel});
}

class cartErrorState extends CartState {}
class cartRemoveActionState extends CartActionState {}
