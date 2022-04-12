import 'dart:convert';

import 'package:drt/Components/Crypto_Details.dart';
import 'package:drt/Components/Order_Book.dart';
import 'package:drt/Components/Search_Bar.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

void getOrderValues() async{
  //API call for values of order book
  String url = 'https://www.bitstamp.net/api/v2/order_book/'+crypto;
  var uri = Uri.parse(url);
  var response = await http.get(uri);
  if(response.statusCode == 200){
    Map data = json.decode(response.body);
    List bidsTemp = data['bids'];
    List asksTemp = data['asks'];
    for(int i = 0; i<5; i++) {
      /*The logic behind this is to parse the json value of bids and asks as List of List and then each List is considered to
      get the values of quantity, bids and asks values for the first 5 values as the API calls are already sorted.*/
      List temp1 = bidsTemp.elementAt(i);
      bids.insert(i, temp1.elementAt(0));
      bidsQty.insert(i, temp1.elementAt(1)); //Old order book values are replaced with new values
      List temp2 = asksTemp.elementAt(i);
      asks.insert(i, temp2.elementAt(0));
      asksQty.insert(i, temp2.elementAt(1));
    }
  }
  else
    print('Error');
}

void getCryptoValues() async{
  String url = 'https://www.bitstamp.net/api/v2/ticker/'+crypto;
  var uri = Uri.parse(url);
  var response = await http.get(uri);
  now = DateTime.now();
  formattedDate = DateFormat('dd MMM yyyy, kk:mm:ss').format(now);
  if(response.statusCode == 200){
    print('Success');
    obj = json.decode(response.body); //This simple json file is parsed as a map and then the values are shown wrt the key names
    flag = true;
  }
  else {
    print('Fail');
    flag = false;
  }
}