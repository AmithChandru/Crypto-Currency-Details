import 'package:drt/Components/API_Calls.dart';
import 'package:drt/Components/Order_Book.dart';
import 'package:drt/Components/Search_Bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class cryptoDetails extends StatefulWidget {
  const cryptoDetails({Key? key}) : super(key: key);

  @override
  _cryptoDetailsState createState() => _cryptoDetailsState();
}

DateTime now = DateTime.now();
String formattedDate = DateFormat('dd MMM yyyy, kk:mm:ss').format(now);
bool viewOrderBook = false;
String name = crypto;
String textHolder = 'VIEW ORDER BOOK';

class _cryptoDetailsState extends State<cryptoDetails> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ //Each line of details and also the single components(Ex: 'High', 'Low') are container widgets which makes them easier to edit
        Container(
          padding: EdgeInsets.only(top: 20),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  name.toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.black
                  ),
                ),
              ),
              Spacer(), //Spacer is used to have a definite space between the widgets
              Container(
                padding: EdgeInsets.only(right: 20),
                child: Text(
                  formattedDate,
                  style: TextStyle(
                    fontSize: 10
                  ),
                ),
              )
            ],
          ),
        ),

        Container(
          padding: EdgeInsets.only(top: 20),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'OPEN',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      obj['open'].toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                      ),
                    )
                  ],
                ),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.only(right: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'HIGH',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      obj['high'].toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),

        Container(
          padding: EdgeInsets.only(top: 40),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'LOW',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      obj['low'].toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25
                      ),
                    )
                  ],
                ),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.only(right: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'LAST',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      obj['last'].toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),

        Container(
          padding: EdgeInsets.only(top: 40),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'VOLUME',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      obj['volume'].toString(),
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),

        Container(
          padding: EdgeInsets.only(top: 20),
          child: Row(
            children: [
              Spacer(),
              Container(
                padding: EdgeInsets.only(right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: textHolder,
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = (){ //Sets the value to show or hide order book
                            setState(() {
                              viewOrderBook = !viewOrderBook;
                              viewOrderBook ? textHolder = 'HIDE ORDER BOOK' : textHolder = 'VIEW ORDER BOOK';
                              getOrderValues();
                            });
                          }
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        if(viewOrderBook)
          orderBook()
      ],
    );
  }
}