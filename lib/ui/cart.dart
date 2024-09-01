import 'package:bloc_cart_demo/ui/widget/cart_tile.dart';
import 'package:bloc_cart_demo/ui/widget/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart/cart_bloc.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final cartBloc = CartBloc();
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("cart Screen"),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listener: (context, state) {
          if (state is cartRemoveActionState) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("item removed from cart")));
          }
        },
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartLoading:
              return Center(child: CircularProgressIndicator());
            case cartErrorState:
              return Center(child: Text("Error.."));
            case CartSuccessLoadedState:
              var successdata = state as CartSuccessLoadedState;

              return successdata.productDataModel.length == 0
                  ? Center(child: Text("cart is Empty"))
                  : ListView.builder(
                      itemCount: successdata.productDataModel.length,
                      itemBuilder: (context, index) {
                        return CartTile(
                            productDataModel:
                                successdata.productDataModel[index],
                            cartBloc: cartBloc);
                      });

            default:
              SizedBox();
          }
          return Container();
        },
      ),
    );
  }
}
