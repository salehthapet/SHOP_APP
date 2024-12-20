import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled6/Shop_App/settingScreen.dart';
import 'package:untitled6/shared/network/remote/DIOhelper.dart';




import '../model/Home_Model2.dart';
import '../model/Home_model.dart';
import '../shared/network/local/shared_preference.dart';
import 'CateogiresScreen.dart';
import 'FavirotScreen.dart';
import 'Home_screen.dart';
import 'State_shop_App.dart';
import 'productScreen.dart';

class shopAppcubit extends Cubit <shopAppState>{

  shopAppcubit() : super(shopAppIntialState()) ;
  static shopAppcubit get(context) => BlocProvider.of(context) ;
   bool ispassword=false;
    late homemodel loginmodel ;
  UserLogin({required String email,  required String password,})
  {
    emit(shopAppLoadingState());
    cacheHelper.Postdata(url: 'login',
        Data: {
      'email': email,
      'password': password,
    }

    ).then((value){
      print(value.data);
        homeDatamodel.fromJson( value.data );
      String token = value.data.token;

      cachehelper1.putstring('token', token)   ;

      loginmodel=   homemodel.formJson( value.data );
      print(loginmodel.data.name );

      emit(shopAppSuccessfulState(loginmodel));
    }).catchError((error){
      print(error.toString());
      emit(shopAppErrorState(error.toString())) ;
    });
  }
 void changepassword(){
   ispassword =! ispassword;
   emit(Ispassword());
 }
  int currentindex = 0 ;
  List<Widget> Bottomscreen= [
    productScreen(),
    Favirotscreen(),
    CateogiresScreen(),
    settingScreen(),
  ] ;
  void changecurrentindex(int index)
  {
    currentindex= index;
    emit(currentIndex());
  }
  //
 // String token = cacheHelper.getdata(url: home,) ;
   home_model2  ? Home_model2  ;

  void getData(
      ){
    emit(homemodelLoadingState());
    cacheHelper.getdata(url: 'home',
    ).then((valu){
      print(' Data 1${valu.data}');


      Home_model2 = home_model2.fromjson(valu.data);

      print('Response Data 1${Home_model2!.Data!.banners[0].image}');
      print('Response Data 2${Home_model2!.Data!.banners[1].image}');
      print('Response Data3${Home_model2!.Data}');

      emit(homemodelSuccesfulState());

    }).catchError((error){
      print('.catch error = ${ error.toString()}');
      emit(homemodelerrorState());
    });
  }
}
