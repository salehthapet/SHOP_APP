

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:untitled6/NEWSapp/states.dart';

import '../NEWSapp/cubitnews.dart';

  Widget buildarticleitem( context) =>ConditionalBuilder(
   condition: newscubit.get(context).search.length >0&& State is getsearchesuccesfulstate ,
   builder: (BuildContext context){
    return
     ListView.separated(
         physics:BouncingScrollPhysics() ,
         itemBuilder: (BuildContext context, int index ){
          var list = newscubit.get(context).search[index] ;
          return

           Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
             children: [
              Container(
               height: 120,
               width: 120,
               decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                 image: NetworkImage('${list['urlToImage']}'
                 ),
                 fit: BoxFit.cover,

                ),
               ),
              ),
              SizedBox(width: 20,),
              Expanded(
               child: Container(
                height: 120,
                child: Column(
                 mainAxisSize: MainAxisSize.min,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                  Text('${list['title']}',
                   style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Colors.blueAccent ,

                   ),
                   maxLines: 3,
                  ),
                  SizedBox(height: 30,),
                  Text('${list['publishedAt']}',
                   style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.grey ,

                   ),
                   maxLines: 2,
                   overflow: TextOverflow.ellipsis,
                  ),
                 ],
                ),
               ),
              ),
             ],
            ),
           ); },
         separatorBuilder: (BuildContext context, int index) =>
             Divider(
              thickness: 3,
              color: Colors.grey,
             ),
         itemCount:40);
   },
   fallback: (BuildContext context) {
    return
     Center(child: CircularProgressIndicator());
   },
  );
 Future<void> Navigatto (context,Widget) =>    Navigator. push<void>(
  context,
  MaterialPageRoute<void>(
   builder: (BuildContext context) =>Widget ,
  ),
 );


