import 'package:addproduct/model/product.dart';
import 'package:addproduct/modules/cubit/states.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit():super(AppInitialState()) ; //initial state = init state

  static AppCubit get(context)=>BlocProvider.of(context) ; // instance from bloc
  ProductModel productModel ;
  void addProduct(
  {
    @required String name ,
    @required String price ,
    @required String description ,
    @required String url ,
}
      )

  {
    emit(AddProductLoadingState()) ;  //= set state
    productModel = ProductModel(name: name,price: price ,description: description ,url: url) ;
    FirebaseFirestore.instance
    .collection('products')
    .add(productModel.toMap())
    .then((value){
      getProduct() ;
      emit(AddProductSuccessState()) ; //set state
    })
    .catchError((error){
      print (error.toString()) ;
      emit(AddProductErrorState()) ; //set state
    }) ;
  }

  //
  // void getCategories() {
  //   emit(GetCategoriesLoadingState());
  //   FirebaseFirestore.instance
  //       .collection('categories')
  //       .get()
  //       .then((value) {
  //     value.docs.forEach((element) {
  //       categories.add(CategoryModel.FromJson(element.data()));
  //     });
  //     emit(GetCategoriesSuccessState());
  //   })
  //       .catchError((error) {
  //     print(error.toString());
  //     emit(GetCategoriesErrorState());
  //   });
  // }

  List<ProductModel> products =[];
  void getProduct()
  {
      emit(AppGetProductLoadingState()) ;
      FirebaseFirestore.instance
      .collection('products')
      .get()
      .then((value){

        value.docs.forEach((element) {
          print (element.data()) ;
          products.add(ProductModel.fromJson(element.data())) ;
          print (products.length.toString()+'here iam lenght') ;
        }) ;
        emit(AppGetProductSuccessState()) ;
      })
      .catchError((error){
        emit(AddProductErrorState()) ;
      }) ;
  }

  //decode    id :id

}