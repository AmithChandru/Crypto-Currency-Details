import 'package:drt/Components/API_Calls.dart';
import 'package:drt/Components/Crypto_Details.dart';
import 'package:drt/Components/Pending_Area.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class searchBar extends StatefulWidget {
  searchBar({Key? key}) : super(key: key);

  @override
  State<searchBar> createState() => _searchBarState();
}

TextEditingController userInput = TextEditingController();
String crypto = '';
bool flag = false;
bool isValidSearch = false;
Map obj = {};

//This page shows 2 widgets, the first would be the search bar and the second would be the pending area
//or currency details based on user input.

class _searchBarState extends State<searchBar> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
              child: TextFormField(
                key: ValueKey('checkCurrency'),
                controller: userInput,
                onChanged: (value) {
                  //API calls are executed here and not on icon click because there is a latency in getting the values and
                  //it is better to have the functions running in background than having latency in showing the details
                    crypto = value.toString().toLowerCase();
                    getOrderValues();
                    getCryptoValues();
                    name = crypto; //A separate variable is used because if the user edits the text form then the displayed name is changed too
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  fillColor: Colors.grey.shade300,
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'Enter currency pair',
                  suffixIcon: IconButton(
                    key: ValueKey('searchCurrency'),
                    icon: Icon(Icons.search),
                    onPressed: (){
                      setState(() {
                        //Flag is used to find whether the current input is a valid currency name
                        getCryptoValues();
                        if(flag) {
                          isValidSearch = true;
                        }
                        else {
                          isValidSearch = false;
                          Fluttertoast.showToast(msg: 'Invalid search. Please try again!', backgroundColor: Colors.grey.shade400);
                        }
                      });
                    },
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            isValidSearch ? cryptoDetails() : pendingArea()
          ],
        )
      ),
    );
  }
}
