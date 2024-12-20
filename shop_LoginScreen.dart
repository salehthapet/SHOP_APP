import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'Home_screen.dart';
import 'Shop_cubit.dart';
import 'State_shop_App.dart';

class shopLoginSreen extends StatefulWidget {
  @override
  State<shopLoginSreen> createState() => _shopLoginSreenState();
}

class _shopLoginSreenState extends State<shopLoginSreen> {
var emailController = TextEditingController();

var passwordController = TextEditingController();
 var formkey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
        create: (BuildContext context) => shopAppcubit(),
      child: BlocConsumer<shopAppcubit,shopAppState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body:  Padding(
                padding: const EdgeInsets.all(30.0),

                  child: Form(
                    key: formkey,
                    child: SingleChildScrollView(
                      child: Column(

                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('LOGIN',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 5,),
                          Text('Login to Browse our hot over',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 15,),
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              labelText :'email' ,
                              prefixIcon:Icon(
                                  Icons.email_outlined
                              ) ,
                              border: OutlineInputBorder(),
                            ),
                            validator:(Value){
                              if(Value!.isEmpty){
                                return 'email address must  not be  Empty';
                              }
                              else{
                                return null;
                              }
                            } ,
                          ),
                          SizedBox(height: 15,),
                          TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                                 labelText :'password',
                              prefixIcon:Icon(
                                  Icons.lock
                              ) ,
                              suffixIcon:IconButton(
                                  onPressed: (){
                                    shopAppcubit.get(context).changepassword();

                                  },
                   icon:Icon(
                                    Icons.remove_red_eye_outlined
                                ),
                              ) ,
                              border: OutlineInputBorder(),
                            ),
                            obscureText :shopAppcubit.get(context).  ispassword ,

                            validator:(Value){
                              if(Value!.isEmpty){
                                return 'password address must  not be  Empty';
                              }
                              else{
                                return null;
                              }
                            } ,
                          ),
                          SizedBox(height: 20,),
                      ConditionalBuilder(condition:state is ! shopAppLoadingState ,
                               builder:    (context)=>   Container(
                            height: 50.0,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(
                                    15.0,
                                  ),
                                ),
                                child: TextButton(onPressed: (){
                                  if (formkey.currentState?.validate() ?? false)
                                  {
                                    shopAppcubit.get(context).UserLogin(
                                        email: emailController.text,
                                        password: passwordController.text);
                                    if(state is shopAppSuccessfulState)
                                    {
                                      if(state.loginmodel.status )
                                      {

                                        Fluttertoast.showToast(
                                            msg: state.loginmodel.message,
                                            toastLength: Toast.LENGTH_LONG,
                                            gravity: ToastGravity.CENTER,
                                            timeInSecForIosWeb: 5,
                                            backgroundColor: Colors.green,
                                            textColor: Colors.white,
                                            fontSize: 16.0
                                        );
                                      }
                                      else{
                                        Fluttertoast.showToast(
                                            msg: state.loginmodel.message,
                                            toastLength: Toast.LENGTH_LONG,
                                            gravity: ToastGravity.CENTER,
                                            timeInSecForIosWeb: 5,
                                            backgroundColor: Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 16.0
                                        );
                                      }
                                    }
                                    if(true){
                                      Navigator. pushAndRemoveUntil<void>(
                                        context,
                                        MaterialPageRoute<void>(builder:
                                            (BuildContext context) =>  HomeScreen()),
                                        ModalRoute. withName('/'),
                                      );
                                    }

                                  }

                                },
                                    child:
                                Text(
                                  'Login',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Colors.white
                                  ),
                                )

                                ),


                              ),
                            fallback: (context)=>Center(child: CircularProgressIndicator()),),
                          SizedBox(height: 15
                            ,),
                          Row(
                            children: [
                              Text(
                                'don''t' +' have an account ?',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),

                              TextButton(onPressed: (){
                                Navigator. pushAndRemoveUntil<void>(
                                  context,
                                  MaterialPageRoute<void>(builder:
                           (BuildContext context) =>  HomeScreen()),
                                  ModalRoute. withName('/'),
                                );
                              }, child:
                              Text(
                                'REGISTER',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15
                                ),
                              )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

              ),

          );
      // return widget here based on BlocA's state
    },
        listener: (BuildContext context,  state) {
          if(state is shopAppSuccessfulState)
          {
            if(state.loginmodel.status)
            {
              Fluttertoast.showToast(
                  msg: state.loginmodel.message,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            }
            else{
              Fluttertoast.showToast(
                  msg: state.loginmodel.message,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
              );

            }
          }

        },
    )
    );
  }
}
