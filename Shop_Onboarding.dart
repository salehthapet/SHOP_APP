import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitled6/Shop_App/shop_LoginScreen.dart';
class BoardModel{
  final String image;
  final String title;
  final String body;

  BoardModel({required this.image, required this.title, required this.body});
}
List<BoardModel> list=[
  BoardModel(
    image: 'assets/images/img_1.png',
    title:'Onboarding 1 Title' ,
    body: 'Onboarding 1 Body',
  ),
  BoardModel(
    image: 'assets/images/img_2.png',

    title:'Onboarding 2 Title',
    body: 'Onboarding 2 Body',
  ),
  BoardModel(
    image: 'assets/images/img.png',

    title:'Onboarding 3 Title',
    body: 'Onboarding 3 Body',
  ),


];


class ShopAPP extends StatefulWidget {

  @override
  State<ShopAPP> createState() => _ShopAPPState();
}

class _ShopAPPState extends State<ShopAPP> {
  final boardingcontroller = PageController();
bool islast = false ;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [
          SizedBox(width: 25,),
          TextButton(  onPressed: (){
    if(true){
    Navigator. pushAndRemoveUntil<void>(
    context,
    MaterialPageRoute<void>(builder:
        (BuildContext context) =>  shopLoginSreen()),
    ModalRoute. withName('/'),
    );
    }




    },
         child: Text(
          ' Skip',
           style: TextStyle(
             color: Colors.orangeAccent,
             fontSize: 22,
           ),


         )),
          SizedBox(width: 15,),

        ],
      ),
      body :
         Padding(
           padding: const EdgeInsets.all(20.0),
           child: SingleChildScrollView(
             child: Column(
              children: [
             
              SizedBox(height: 540,
                child: PageView.builder(
                  onPageChanged:(int index){
             
                    if( index==list.length-1){
                      setState(
                          (){
                            islast = true ;
                          }
                      );
                    }
                    else{
                      islast = false ;
             
                    }
             
                  } ,
                  physics :BouncingScrollPhysics() ,
                  controller: boardingcontroller,
                    itemBuilder: (context,index)=>buildBoardingitem(list[index])  ,
                       itemCount: list.length,
                ),
              ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Row(
                      children:
                    [
                      SmoothPageIndicator(
             
                          controller: boardingcontroller,
                          count: list.length,
                        effect: ExpandingDotsEffect(
                          dotWidth: 16,
                          dotHeight: 16,
                          dotColor: Colors.grey,
                          activeDotColor:  Colors.orangeAccent,
                          spacing: 4,
                          expansionFactor: 4,
                          
                        ),
             
                      ),
                       Spacer(),
                      FloatingActionButton(
             
                        backgroundColor: Colors.orangeAccent,
                        onPressed: (){
                          if(islast){
                            Navigator. pushAndRemoveUntil<void>(
                              context,
                              MaterialPageRoute<void>(builder: (BuildContext context) =>  shopLoginSreen()),
                              ModalRoute. withName('/'),
                            );                        }else{
             
                            boardingcontroller.nextPage(
                                duration: Duration(milliseconds: 750),
                                curve: Curves.fastLinearToSlowEaseIn);
             
                          }
             
             
             
             
                      },
                      child :  Icon(
                          Icons.arrow_circle_right
                      ),
                      )
                    ]
                  ),
                ),
              ],
                     ),
           ),
         ),

    );
  }
 Widget buildBoardingitem(BoardModel model) {
    return
         Expanded(
      child: Column(
        mainAxisAlignment:  MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image(

                image:
                AssetImage('${model.image}'),
            ),
          ),

          Text('${model.title}',
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10,),
          Text('${model.body}',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 20,),

        ],
      ),
    )
   ;
  }
}
