import 'package:flutter/material.dart';

class orderBook extends StatefulWidget {
  const orderBook({Key? key}) : super(key: key);

  @override
  _orderBookState createState() => _orderBookState();
}

List bids = [];
List bidsQty = [];
List asks = [];
List asksQty = [];

class _orderBookState extends State<orderBook> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 10, top: 20),
          child: Text(
            'ORDER BOOK',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: FittedBox( //FittedBox is used for the DataTable to occupy the entire space available to it
            child: Card(
              child: DataTable( //DataTable is used here to show the values already aligned in a proper way
                border: TableBorder.all(color: Colors.transparent),
                dataRowHeight: 70,
                columns: [
                  DataColumn(
                    label: Text(
                      'BID PRICE',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ),
                  DataColumn(
                    label: Text(
                      'QTY',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ),
                  DataColumn(
                    label: Text(
                      'QTY',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ),
                  DataColumn(
                      label: Text(
                        'ASK PRICE',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      )
                  ),
                ],
                rows: [ //There is also an alternate approach for this by returning a List of type DataRow for the 5 values
                  DataRow(
                    cells: [
                      DataCell(
                        Text(
                          bids.elementAt(0),
                          style: TextStyle(
                            fontSize: 20
                          ),
                        ),
                      ),
                      DataCell(
                        Text(
                          bidsQty.elementAt(0),
                          style: TextStyle(
                            fontSize: 20
                          ),
                        )
                      ),
                      DataCell(
                        Text(
                          asksQty.elementAt(0),
                          style: TextStyle(
                            fontSize: 20
                          ),
                        )
                      ),
                      DataCell(
                        Text(
                          asks.elementAt(0),
                          style: TextStyle(
                            fontSize: 20
                          ),
                        )
                      )
                    ]
                  ),
                  DataRow(
                      cells: [
                        DataCell(
                          Text(
                            bids.elementAt(1),
                            style: TextStyle(
                                fontSize: 20
                            ),
                          ),
                        ),
                        DataCell(
                            Text(
                              bidsQty.elementAt(1),
                              style: TextStyle(
                                  fontSize: 20
                              ),
                            )
                        ),
                        DataCell(
                            Text(
                              asksQty.elementAt(1),
                              style: TextStyle(
                                  fontSize: 20
                              ),
                            )
                        ),
                        DataCell(
                            Text(
                              asks.elementAt(1),
                              style: TextStyle(
                                  fontSize: 20
                              ),
                            )
                        )
                      ]
                  ),
                  DataRow(
                      cells: [
                        DataCell(
                          Text(
                            bids.elementAt(2),
                            style: TextStyle(
                                fontSize: 20
                            ),
                          ),
                        ),
                        DataCell(
                            Text(
                              bidsQty.elementAt(2),
                              style: TextStyle(
                                  fontSize: 20
                              ),
                            )
                        ),
                        DataCell(
                            Text(
                              asksQty.elementAt(2),
                              style: TextStyle(
                                  fontSize: 20
                              ),
                            )
                        ),
                        DataCell(
                            Text(
                              asks.elementAt(2),
                              style: TextStyle(
                                  fontSize: 20
                              ),
                            )
                        )
                      ]
                  ),
                  DataRow(
                      cells: [
                        DataCell(
                          Text(
                            bids.elementAt(3),
                            style: TextStyle(
                                fontSize: 20
                            ),
                          ),
                        ),
                        DataCell(
                            Text(
                              bidsQty.elementAt(3),
                              style: TextStyle(
                                  fontSize: 20
                              ),
                            )
                        ),
                        DataCell(
                            Text(
                              asksQty.elementAt(3),
                              style: TextStyle(
                                  fontSize: 20
                              ),
                            )
                        ),
                        DataCell(
                            Text(
                              asks.elementAt(3),
                              style: TextStyle(
                                  fontSize: 20
                              ),
                            )
                        )
                      ]
                  ),
                  DataRow(
                      cells: [
                        DataCell(
                          Text(
                            bids.elementAt(4),
                            style: TextStyle(
                                fontSize: 20
                            ),
                          ),
                        ),
                        DataCell(
                            Text(
                              bidsQty.elementAt(4),
                              style: TextStyle(
                                  fontSize: 20
                              ),
                            )
                        ),
                        DataCell(
                            Text(
                              asksQty.elementAt(4),
                              style: TextStyle(
                                  fontSize: 20
                              ),
                            )
                        ),
                        DataCell(
                            Text(
                              asks.elementAt(4),
                              style: TextStyle(
                                  fontSize: 20
                              ),
                            )
                        )
                      ]
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}