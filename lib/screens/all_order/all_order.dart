import 'dart:ui';
import 'package:beinglearners/api/data/rest_ds.dart';
import 'package:beinglearners/common/colors.dart';
import 'package:beinglearners/model/get_all_order.dart';
import 'package:beinglearners/screens/all_order/all_order_screen_presenter.dart';
import 'package:beinglearners/screens/all_order_details/all_order_details.dart';
import 'package:beinglearners/screens/login_screen/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<AllOrderDataList> all_order_List ;
List<CartOrdersList> cart_data_List ;
int list_size=0;
class AllOrderScreen extends StatefulWidget {
  @override
  _AllOrderScreenState createState() => _AllOrderScreenState();
}

class _AllOrderScreenState extends State<AllOrderScreen> implements AllOrderScreenContract {

  AllOrderScreenPresenter _presenter;
  String token='';

  _AllOrderScreenState() {
    _presenter = new AllOrderScreenPresenter(this);
  }

  sharepref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token= prefs.getString('token');
      _onLoading(true);
      _presenter.getAllOrder(token, 'd09fc00f-d3e3-4c6e-bb2c-3b3bd7e20adc');
    });
  }

  void _onLoading(bool status) {
    if(status) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: new EdgeInsets.only(top: MediaQuery.of(context).size.height/3.5,bottom: MediaQuery.of(context).size.height/3.5),
            child: AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
              content:  new Container(
                  child: new Center(
                      child: new Column(
                        children: <Widget>[
                          Container(
                            height: 120,
                            child: new Image.asset('images/logo.jpeg',),
                          ),
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Container(
                                  padding: EdgeInsets.only(top: 10),
                                  width:200,
                                  child: new Center(
                                    child: new Text('Please wait loading...',
                                      style: new TextStyle(color: new ColorStyle().color_royal_blue,fontSize: 17,fontWeight: FontWeight.bold),),
                                  )
                              )
                            ],
                          ),
                          new Padding(padding: EdgeInsets.only(top: 10)),
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Image(image: new AssetImage('images/loader.gif',),width: 100,height: 40,)

                            ],
                          )
                        ],
                      )
                  )
              ),
            ),
          );
        },
      );
    }
    else
      Navigator.pop(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sharepref();
    all_order_List =new List();
    cart_data_List =new List();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Order'),

      ),
      body: all_order_List==0?
          new Container(
            child: new Center(
              child: new Text('Order Data not found',
              style: new TextStyle(color: ColorStyle().color_dark_gray,fontSize: 18,fontWeight: FontWeight.bold),),
            ),
          )
          :new Container(
        height: MediaQuery.of(context).size.height,
        child: new ListView.builder(
          itemCount: all_order_List.length,
            itemBuilder: (context,index){
              return new GestureDetector(
                onTap: (){
                  String id= all_order_List[index].id;
                  Navigator.push(context, PageTransition(type:PageTransitionType.custom, duration: Duration(seconds: 0), child: AllOrderDetailsScreen(id)));
                },
                child: new Container(
                  margin: EdgeInsets.only(left: 10,right: 10,top: 4),
                  height: 130,
                  child: new Card(
                    child: new Row(
                      children: <Widget>[
                        new Container(
                          height: 80,
                          width: MediaQuery.of(context).size.width/3,
                          child: new Image.network(RestDataSource.BASE_URL+all_order_List[index].cartOrdersList[0].productImage,fit: BoxFit.fill,),
                        ),
                        new Expanded(
                            child: new Container(
                                child: new Column(
                                  children: <Widget>[
                                    new Row(
                                      children: <Widget>[
                                        new Container(
                                          width: MediaQuery.of(context).size.width/1.8,
                                          padding: EdgeInsets.only(top: 12,left: 8),
                                          child: new Text(all_order_List[index].cartOrdersList[0].productTitle,
                                            style: new TextStyle(color: ColorStyle().color_dark_gray,fontSize: 13,fontWeight: FontWeight.bold),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,),
                                        )
                                      ],
                                    ),
                                    new Row(
                                      children: <Widget>[
                                        new Container(
                                          padding: EdgeInsets.only(top: 8,left: 8),
                                          child: new Text('Quantity -',
                                            style: new TextStyle(color: ColorStyle().color_dark_gray,fontSize: 14),),
                                        ),
                                        new Container(
                                          padding: EdgeInsets.only(top: 8,left: 8),
                                          child: new Text(all_order_List[index].cartOrdersList[0].productQuantity,
                                            style: new TextStyle(color: ColorStyle().color_dark_gray,fontSize: 14,fontWeight: FontWeight.bold),),
                                        )
                                      ],
                                    ),
                                    new Row(
                                      children: <Widget>[
                                        new Expanded(
                                            child: new Container(
                                                child: new Row(
                                                  children: <Widget>[
                                                    new Container(
                                                      padding: EdgeInsets.only(top: 8,left: 8),
                                                      child: new Text('TotalAmount -',
                                                        style: new TextStyle(color: ColorStyle().color_dark_gray,fontSize: 14),),
                                                    ),
                                                    new Container(
                                                      padding: EdgeInsets.only(top: 8,left: 8),
                                                      child: new Text(all_order_List[index].cartOrdersList[0].totalAmount.toString(),
                                                        style: new TextStyle(color: ColorStyle().color_dark_gray,fontSize: 14,fontWeight: FontWeight.bold),),
                                                    )
                                                  ],
                                                )
                                            )),
                                      ],
                                    ),
                                    new Row(
                                      children: <Widget>[
                                        new Expanded(
                                            child: new Container(
                                                child: new Row(
                                                  children: <Widget>[
                                                    new Container(
                                                      padding: EdgeInsets.only(top: 4,left: 8),
                                                      child: new Text('Status -',
                                                        style: new TextStyle(color: ColorStyle().color_dark_gray,fontSize: 14),),
                                                    ),
                                                    new Container(
                                                      padding: EdgeInsets.only(top: 8,left: 8),
                                                      child: new Text(all_order_List[index].orderStatus,
                                                        style: new TextStyle(color:Colors.green[800],fontSize: 12,fontWeight: FontWeight.bold),),
                                                    )
                                                  ],
                                                )
                                            )),
                                      ],
                                    )
                                  ],
                                )
                            ))

                      ],
                    ),

                  ),
                )
              );
            }),
      )
    );
  }

  @override
  void onAllOrderError(String errorTxt) {
    // TODO: implement onAllOrderError
    _onLoading(false);
    if(errorTxt=="Exception: 401"){
      Fluttertoast.showToast(
          msg: "Session has been expire Please login again..",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red[800],
          textColor: Colors.white,
          fontSize: 16.0
      );
      Navigator.pushReplacement(context, PageTransition(type:PageTransitionType.custom, duration: Duration(seconds: 0), child: LoginPage()));
    }
  }

  @override
  void onAllOrderSuccess(AllOrderData response) {
    // TODO: implement onAllOrderSuccess
    _onLoading(false);
  setState(() {
    if(response.allOrderDataList!=0){
      all_order_List= response.allOrderDataList;
      list_size=all_order_List.length;
      cart_data_List =response.allOrderDataList[0].cartOrdersList;
    }else{
      list_size=0;
    }

  });
  }
}
