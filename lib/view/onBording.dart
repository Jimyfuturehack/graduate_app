import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/dataclass/Pagemodel.dart';
import 'package:untitled5/view/signin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:page_view_indicators/page_view_indicators.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
class onBoarding extends StatefulWidget {
  const onBoarding({Key? key}) : super(key: key);

  @override
  _onBoardingState createState() => _onBoardingState();
}

class _onBoardingState extends State<onBoarding> {


  ValueNotifier<int> _pageViewNotifier= ValueNotifier(0);

  late List<Pagemodel> pages=[];
  _addPage(){
    pages=<Pagemodel> [];
    pages.add(Pagemodel("CHOOSE PRODUCT",
      "Choose a product  from our variuse product that you'll have access to from various categories","cards.webp"));
    pages.add(Pagemodel("PURCHASE",
      "Select a payTap as your payment method and pay with either credit,debit or or master card or any other type from our virson types ","savemoney.jpg"));
    pages.add(Pagemodel("DELIVER",
        "Get your order delivered at no time!","tranaction.jpg"));
  }

  @override
  Widget build(BuildContext context) {
    _addPage();
    return Scaffold(
      body: Container(
        child: Stack(
          children:<Widget> [
            PageView.builder(
              itemBuilder: (context,index){
                return Stack(
                  children:<Widget> [
                    Container(color:Colors.white),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:<Widget> [
                          Transform.translate(
                              offset: Offset(0,-120),
                              child: Image.asset("images/${pages[index].image}",height: 200,)),
                          Transform.translate(
                            offset: Offset(0,-30),
                            child: Text(
                              pages[index].title,
                              style: TextStyle(
                                fontSize: 32,
                                color: HexColor('073763'),
                              ),
                            ),
                          ),
                          //SizedBox(height: 2,),
                          Transform.translate(
                            offset: Offset(0,-20),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 24,right: 24,),
                              child: Text(
                                pages[index].text,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: HexColor('5b5b5b'),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
              itemCount: pages.length,
              onPageChanged: (index){
                  _pageViewNotifier.value=index;
              },
            ),
            Transform.translate(
              offset: Offset(0,150),
              child:Align(
                alignment: Alignment.center,
                child: pageviewindicator(),
              ),
            ),
            Transform.translate(
              offset: Offset(10,0),
              child: Align(
                alignment:Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10 ,bottom:100),
                  child: SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: HexColor('073763'),
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),),
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder:(context){
                              _updateSeen();
                              return SignIn();
                            })
                        );
                      },

                      child: Text(
                        "Get Started",
                        style: TextStyle(fontSize: 18,letterSpacing: 2,color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget pageviewindicator(){
    return CirclePageIndicator(
      size: 10.0,
      selectedDotColor:HexColor('073763'),
      dotColor: Colors.grey,
      selectedSize: 12.0,
      itemCount: pages.length,
      currentPageNotifier: _pageViewNotifier,
    );
  }
}

void _updateSeen() async{
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool("seen", true);
}

