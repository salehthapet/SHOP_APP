import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:untitled6/Shop_App/Shop_cubit.dart';
import 'package:untitled6/Shop_App/State_shop_App.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:untitled6/model/Home_model.dart';
import '../model/Home_Model2.dart';
import 'SEARCH_SCREEAN.dart';

class productScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      BlocProvider(
        create: (BuildContext context) => shopAppcubit()..getData(),

        child: BlocConsumer<shopAppcubit, shopAppState>(
          builder: (BuildContext context, state) {
            var homeMODEL2 = shopAppcubit.get(context).Home_model2 ;

            return ConditionalBuilder(
              condition:  shopAppcubit.get(context).Home_model2 != null  ,
              builder: (BuildContext context) =>
              Buildproduct(shopAppcubit.get(context).Home_model2?.Data?.banners),
              fallback: (BuildContext context) =>
                  Center(
                    child: CircularProgressIndicator(

                    ),
                  ),
            );
          },
          listener: (BuildContext context, state) {},),

      );

  }

}
Widget Buildproduct(    model) {
  if( model==null){
   return  Center(child: Text(' THEREEEE IS NO DATA  TO DISBLAY')) ;

  }

  return
  Column(children: [
      CarouselSlider(
        items:model.map((e)=>  Image(image: NetworkImage
          (e.image??'https://imgcdn.stablediffusionweb.com/2024/5/10/e0f31618-5515-4dfa-8279-926f65cff229.jpg',
        ),
          width: double.infinity,
          fit: BoxFit.cover,
        )
        ).toList(),
        options:CarouselOptions(
          height: 250,
          initialPage: 0 ,
          autoPlay: true,
          autoPlayAnimationDuration: Duration(seconds: 3),
          autoPlayCurve:Curves. fastOutSlowIn ,
          autoPlayInterval: Duration(
            seconds: 1,
          ),
          scrollDirection: Axis.horizontal,
          viewportFraction : 1,
          reverse : false ,
        ) ,
      ),
    /* SizedBox(height: 30,),
    Expanded(
      child: GridView.count(crossAxisCount: 2,
        children:
        List.generate(model.Data.products.length??6,
                (index){
          return buildGird ( model.data.products[index] ) ;
                }


        )
        ,
      ),
    ) */

  ],);

}

/*Widget buildGird ( model ){
  return  Column(
    children: [
      Image(image:
      NetworkImage(model.image??
          'https://imgcdn.stablediffusionweb.com/2024/5/10/e0f31618-5515-4dfa-8279-926f65cff229.jpg'),
      fit: BoxFit.cover,
        width: double.infinity,
      )
    ],
  );
} */


