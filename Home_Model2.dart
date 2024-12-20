class home_model2 {
 late bool status = false ;
   homeData_model2 ?  Data;




   home_model2();
   home_model2.fromjson(  Map<String,dynamic>json     ){
status =json['status']  ;
Data =   (json['data'] != null ? homeData_model2.fromjson( json['data'] ): null)!;

}
}
 class  homeData_model2 {
  List<Banners> banners=[];
  List<Products> products=[];
  late String ad;

  homeData_model2 ();

  homeData_model2.fromjson( Map<String,dynamic>json )

  {
   if (json['banners']!= null) {
    banners =[];
    json['banners'] .forEach((element) {
     banners.add(Banners.fromJson((element)));
    },
    ).toList();
   }

   if ( json['products']!= null) {
    json['products'].forEach((element) {
     products.add(Products.fromJson(element));
    }
    ).toList();
   }
  }

/*Map<String, dynamic> toJson() {
   final Map<String, dynamic> data = Map<String, dynamic>();
   if (this.banners != null) {
    data['banners'] = this.banners.map((v) => v.toJson()).toList();
   }
   if (this.products != null) {
    data['products'] = this.products.map((v) => v.toJson()).toList();
   }
   data['ad'] = this.ad;
   return data;*/
  }


class Banners {
 late int id;
 late  String image;


 Banners.fromJson(Map<String, dynamic> json) {
  id = json['id'];
  image = json['image'];
 }

/*Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = Map<String, dynamic>();
  data['id'] = this.id;
  data['image'] = this.image;
  data['category'] = this.category;
  data['product'] = this.product;
  return data;*/
 }

class Products {
 late int id;
 late dynamic price;
 late dynamic oldPrice;
 late
 int discount;
 late String image;
 late String name;
 late String description;
 late List<String> images;
 late bool inFavorites;
 late  bool inCart;

 Products.fromJson(Map<String, dynamic> json) {
  id = json['id'];
  price = json['price'];
  oldPrice = json['old_price'];
  discount = json['discount'];
 List<String>.from( image = json['image']);
  name = json['name'];
  description = json['description'];

  images =  json['images'];
  inFavorites = json['in_favorites'];
  inCart = json['in_cart'];
 }

 /*Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = Map<String, dynamic>();
  data['id'] = this.id;
  data['price'] = this.price;
  data['old_price'] = this.oldPrice;
  data['discount'] = this.discount;
  data['image'] = this.image;
  data['name'] = this.name;
  data['description'] = this.description;
  data['images'] = this.images;
  data['in_favorites'] = this.inFavorites;
  data['in_cart'] = this.inCart;
  return data;
 }*/
}