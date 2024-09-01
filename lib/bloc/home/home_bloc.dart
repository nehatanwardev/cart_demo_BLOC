import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_cart_demo/data/cart_data.dart';
import 'package:bloc_cart_demo/data/grocery_data.dart';
import 'package:meta/meta.dart';

import '../../model/home_product_data.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeCartNavigateEvent>(homeCartNavigateEvent);
    on<HomeProductAddToCart>(homeProductAddToCart);
  }

  FutureOr<void> homeCartNavigateEvent(
      HomeCartNavigateEvent event, Emitter<HomeState> emit) {
    print("home cart navigate -----");
    emit(HomeNavigateToCartState());
  }

  FutureOr<void> homeProductAddToCart(
      HomeProductAddToCart event, Emitter<HomeState> emit) {
    print("add to  cart clicked-----");
    cartList.add(event.productDataModel);
    emit(HomeProductedAddedTocartState());
  }

  Future<FutureOr<void>> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    print("home initial event---");
    emit(LoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
        products: GroceryData()
            .groceryData
            .map((e) => ProductDataModel(
                e['id'],
                e['name'],
                e['price'],
                e['category'],
                e['inStock'],
                e['quanitity'],
                e['imageUrl'],
                e['description']))
            .toList()));
  }
}
