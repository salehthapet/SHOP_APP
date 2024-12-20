import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled6/Shop_App/SEARCH_SCREEAN.dart';
import 'Shop_cubit.dart';
import 'State_shop_App.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
    BlocProvider(
      create: (BuildContext context) => shopAppcubit()..getData(),
      child: BlocConsumer<shopAppcubit,shopAppState>(
        builder: (BuildContext context, state) {
        var cubit = shopAppcubit.get(context);
        return
          Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(onPressed: (){
                Navigator. push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => SearchScreean(),
                  ),
                );
              },
                  icon:Icon(Icons.search)
              )
            ],

          ),
          body: cubit.Bottomscreen[cubit.currentindex],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.blueAccent,
           unselectedItemColor: Colors.grey,
            currentIndex: cubit.currentindex,
            onTap: ( index) {
              cubit.changecurrentindex(index);
            },
            items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home,), label:' Home',



            ),
              BottomNavigationBarItem(
                icon: Icon(Icons.apps,), label:' categorises',



              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite,), label:' favorite',



              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings,), label:' settings',



              ),

            ],

          ),
        );
      },
     listener: (BuildContext context, Object? state) {  },),
    );

  }
}
