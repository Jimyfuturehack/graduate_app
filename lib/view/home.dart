import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/view/signin.dart';
import 'data_transections.dart';
import 'package:untitled5/model_view/datatransaction.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Color> colors=[Colors.grey,Colors.grey,Colors.grey];
  List<String> names=["StarBucks","Amazon","Nike","Carrefour","Kentucky","Jumia","name7","name8"];
  var height;
  List<String> amount=["\$3.99","\$20.32","\$120.28","\$250.95","\$15.62","\$4.82","\$40","\$40"];
  ScrollController _scrollController = ScrollController();
  int _maxitem=5;
  @override
  void initState(){
      super.initState();

      _scrollController.addListener(() {
        if (_scrollController.position.pixels ==_scrollController.position.maxScrollExtent){
          _getMoreItems();
        }
    });
  }
  _getMoreItems(){
    print("Get more");
    for(int i=_maxitem;i<_maxitem+2;i++){
      names.add("name ${i+1}");
      amount.add("\$${i+1}");
    }
    _maxitem=_maxitem+2;
    setState(() {

    });
  }

  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height-383;

    return Scaffold(
      appBar: AppBar(
        actions: [
         new IconButton(onPressed: ()async{
            await FirebaseAuth.instance.signOut();
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder:(context){
                  return SignIn();
                })
            );

          }, icon: Icon(Icons.logout,color: Colors.black,)),
       /**   IconButton(onPressed: (){

            Navigator.push(
                context,
                MaterialPageRoute(builder:(context){
                  return profile();
                })
            );

          }, icon: Icon(Icons.person,color: Colors.black,))**/
        ],
        automaticallyImplyLeading: false,

        elevation: 0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text("Home", style: TextStyle(color: Colors.black87)),
        ),
        titleSpacing: 1,
        titleTextStyle: TextStyle(
            letterSpacing: 1,
            fontSize: 20,
            fontWeight: FontWeight.bold
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
       mainAxisAlignment: MainAxisAlignment.start,
       children:<Widget> [
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                    width: double.infinity,
                    height: 150,
                    child: PageView.builder(
                        itemCount: colors.length,
                        itemBuilder: (context,index){

                      return creditcard(index);
                    }),
                  ),
                  SizedBox(height: 20,),
                  Text("Last Transactions",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                SizedBox(height: 10,),
                Container(
                       child:lasttransaction(),
                  ),
       ],
      ),
            );
  }
  Widget creditcard(int index){
                 return Container(
                   width: double.infinity,
                    height: 150,
                 child: Column(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children:<Widget> [
                      Text("Main account",
                            style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
                          ),
                    Text("\$500",
                    style: TextStyle(
                    fontSize: 18,
                    ),
                    ),
              ],
              ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          color: colors[index],
          ),
          );
    }
    Widget lasttransaction(){
    return Container(
      width: double.infinity,
      height: height,

        child: ListView.builder(
            itemExtent: 80,
           controller: _scrollController,
            itemCount: names.length+1,
            itemBuilder: (context,index){
            if (index==names.length){
              return CupertinoActivityIndicator();
            }
              return Container(
               height: 60,
                child: Column(
                  children: [
                    Card(
                      child: ListTile(
                        onTap: (){
                          Navigator.push(
                            context,MaterialPageRoute(builder:(context){
                            return Datatransections();
                                       }
                                  ),
                              );
                        },
                        title: Text(names[index],style: TextStyle(fontWeight: FontWeight.bold),),
                        leading: FlutterLogo(),
                        subtitle: Text(names[index]),
                        trailing: Text(amount[index],style: TextStyle(fontSize: 16),),
                      ),
                    ),
                  ],
                ),
              );
            },

        ),
      );

    }
}

