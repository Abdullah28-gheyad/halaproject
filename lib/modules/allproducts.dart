import 'package:addproduct/model/product.dart';
import 'package:addproduct/modules/cubit/cubit.dart';
import 'package:addproduct/modules/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>AppCubit(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state){

          return Scaffold(
                body: SafeArea(
                  child: Column(
                    children: [
                      Expanded(child: ListView.separated(
                          itemBuilder: (context,index)=>buildItem(AppCubit.get(context).products[0]),
                          separatorBuilder: (context,index)=>const SizedBox(height: 10,),
                          itemCount: 10
                      ))
                    ],
                  ),
                ),
          ) ;
        },
      ),
    );
  }
  Widget buildItem(ProductModel model) => Card(
    child: Column(
      children: [
        Row(
          children:  [
            const Text('Name:'),
            Text(model.name),
          ],
        ),
        Row(
          children:  [
            const Text('price:'),
            Text(model.price),
          ],
        ),
        Row(
          children:  [
            const Text('desc:'),
            Text(model.description),
          ],
        ),
        Row(
          children:  [
            const Text('url:'),
            Text(model.url),
          ],
        )
      ],
    ),
  );

}


