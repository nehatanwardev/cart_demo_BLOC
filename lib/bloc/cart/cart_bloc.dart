import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_cart_demo/bloc/home/home_bloc.dart';
import 'package:bloc_cart_demo/data/cart_data.dart';
import 'package:bloc_cart_demo/model/home_product_data.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<RemoveFromCartEvent>(removeFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    print("cart initial ----------");
    emit(CartLoading());
    Future.delayed(Duration(seconds: 3));
    emit(CartSuccessLoadedState(productDataModel: cartList));
  }

  FutureOr<void> removeFromCartEvent(
      RemoveFromCartEvent event, Emitter<CartState> emit) {
    //get your cart items
    // check is your productmodel their in cart item
    // run a function to remove product model from that cart item and emit a state cartitemRemove state

    cartList.remove(event.productDataModel);
    emit(CartSuccessLoadedState(productDataModel: cartList));
    emit(cartRemoveActionState());

    print("remove data--------");
  }
}
