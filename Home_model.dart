import 'dart:convert';

class homemodel
{
late bool status ;
late  String  message ;
late homeDatamodel data ;
homemodel(

    );

homemodel.formJson(  Map<String,dynamic> json  )
{
status = json['status'];
message = json['message'];
data = (json['data'] != null ? homeDatamodel.fromJson(json['data']) : null)!;
}

}
class homeDatamodel
{
 late String  name ;
 late String  phone ;
 late String  email ;
 late String  image ;
 late String  token ;
late int id;
 homeDatamodel.fromJson(  Map<String,dynamic> json  ){
 this.name=json[name];
 this.phone=json[phone];
 this.email=json[email];
 this.image=json[image];
 this.token=json[token];
 this.id=json[id];


 }

}


