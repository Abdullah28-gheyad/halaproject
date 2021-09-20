import 'package:addproduct/modules/allproducts.dart';
import 'package:addproduct/modules/cubit/cubit.dart';
import 'package:addproduct/modules/cubit/states.dart';
import 'package:addproduct/shared/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  var nameController = TextEditingController();

  var priceController = TextEditingController();

  var descriptionController = TextEditingController();

  var urlImageController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  HomeScreen({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>AppCubit(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){
          if (state is AppGetProductSuccessState)
          {
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const ProductScreen())) ;
          }
        },
        builder: (context,state){
          return Scaffold(
            body: SafeArea(
                child: Form(
                  key: formKey,
                  child: Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            customTextFormField(
                                controller: nameController,
                                function: (String s) {
                                  if (s.isEmpty) {
                                    return 'name cannot be empty';
                                  }
                                  return null;
                                },
                                label: 'name',
                                prefixIcon: Icons.add),
                            const SizedBox(
                              height: 10,
                            ),
                            customTextFormField(
                                controller: priceController,
                                type: TextInputType.number,
                                function: (String s) {
                                  if (s.isEmpty) {
                                    return 'price cannot be empty';
                                  }
                                  return null;
                                },
                                label: 'price',
                                prefixIcon: Icons.money_off),
                            const SizedBox(
                              height: 10,
                            ),
                            customTextFormField(
                                controller: descriptionController,
                                function: (String s) {
                                  if (s.isEmpty) {
                                    return 'description cannot be empty';
                                  }
                                  return null;
                                },
                                label: 'description',
                                prefixIcon: Icons.more),
                            const SizedBox(
                              height: 10,
                            ),
                            customTextFormField(
                                controller: urlImageController,
                                function: (String s) {
                                  if (s.isEmpty) {
                                    return 'image cannot be empty';
                                  }
                                  return null;
                                },
                                label: 'url',
                                prefixIcon: Icons.image),
                            const SizedBox(
                              height: 20,
                            ),
                            //check if state is loading ---
                            //check success
                            //check error
                            Container(
                              color: Colors.blue,
                              width: double.infinity,
                              child: MaterialButton(
                                onPressed: () {
                                  if (formKey.currentState.validate()) {
                                    AppCubit.get(context).addProduct(name: nameController.text, price: priceController.text, description: descriptionController.text, url: urlImageController.text) ;

                                  }
                                },
                                child: const Text('ADD PRODUCT'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
          ) ;
        },
      ),
    );
  }
}
