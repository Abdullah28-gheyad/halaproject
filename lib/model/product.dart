class ProductModel
{
  String id  ;
  String name  ;
  String description  ;
  String price  ;
  String url  ;
  ProductModel({this.name,this.id,this.price,this.description,this.url}) ;
  ProductModel.fromJson(Map<String,dynamic> json ) //decode
  {
    id= json['id'] ;
    name= json['name'] ;
    description= json['description'] ;
    price= json['price'] ;
    url= json['url'] ;
  }
  Map <String, dynamic> toMap()
  {
    return {
      'id':id ,
      'name':name ,
      'description':description ,
      'price':price ,
      'url':url ,
    };
  }
}