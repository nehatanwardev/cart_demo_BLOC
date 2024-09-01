import 'package:bloc_cart_demo/ui/cart.dart';
import 'package:bloc_cart_demo/ui/widget/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    super.initState();
    homeBloc.add(HomeInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CartScreen()));
        }
        if (state is HomeProductedAddedTocartState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("item added to cart")));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case LoadingState:
            return Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));

          case HomeErrorState:
            return Scaffold(
              body: Center(
                child: Text("Error"),
              ),
            );
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: Text("Home Screen"),
                actions: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeCartNavigateEvent());
                      },
                      icon: Icon(Icons.shopping_cart))
                ],
              ),
              body: ListView.builder(
                  itemCount: successState.products.length,
                  itemBuilder: (context, index) {
                    return ProductTile(
                      productDataModel: successState.products[index],
                      homeBloc: homeBloc,
                    );
                  }),
            );

          default:
            return Scaffold(
              body: SizedBox(),
            );
        }
      },
    );
  }
}
