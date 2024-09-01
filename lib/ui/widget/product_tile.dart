import 'package:bloc_cart_demo/model/home_product_data.dart';
import 'package:flutter/material.dart';

import '../../bloc/home/home_bloc.dart';

class ProductTile extends StatelessWidget {
  ProductDataModel productDataModel;
  final HomeBloc homeBloc;
  ProductTile(
      {super.key, required this.productDataModel, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: double.maxFinite,
              height: 100,
              child: Image.network(
                productDataModel.imageUrl ?? "",
                fit: BoxFit.cover,
              )),
          SizedBox(
            height: 12,
          ),
          Text(productDataModel.name ?? ""),
          Text(productDataModel.description ?? ""),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Rs: ${productDataModel.price ?? ""}",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              IconButton(
                  onPressed: () {
                    homeBloc.add(HomeProductAddToCart(
                        productDataModel: productDataModel));
                  },
                  icon: Icon(Icons.shopping_bag_outlined))
            ],
          ),
        ],
      ),
    );
  }
}
