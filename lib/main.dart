import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(
      MaterialApp(
        home: billsplitter(),
      ),
    );

class billsplitter extends StatefulWidget {
  const billsplitter({Key? key}) : super(key: key);

  @override
  State<billsplitter> createState() => _billsplitterState();
}

class _billsplitterState extends State<billsplitter> {
  int _tipPercentage = 0;
  int _personCounter = 1;
  double _billAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(10),
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Total per person"),
                  Text("\$ ${ CalculateTotalPerPerson(_billAmount,_personCounter,_tipPercentage)}"),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blueGrey.shade100,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(children: [
                TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(color: Colors.grey),
                    decoration: InputDecoration(
                      prefixText: "Bill Amount",
                      prefixIcon: Icon(Icons.attach_money),
                    ),
                    onChanged: (String value) {
                      try {
                        _billAmount = double.parse(value);
                      } catch (e) {
                        _billAmount = 0.0;
                      }
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "split",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (_personCounter > 1) {
                                _personCounter--;
                              }
                              {}
                            });
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.0),
                              color: Colors.blueAccent.shade100,
                            ),
                            child: Center(
                                child: Text(
                              "-",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                        Text("$_personCounter",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),
                        InkWell(
                            onTap: () {
                              setState(() {
                                _personCounter++;
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.0),
                                color: Colors.blueAccent.shade100,
                              ),
                              child: Center(
                                  child: Text(
                                "+",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              )),
                            )),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tip",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "\$ ${calculateTotalTip(_billAmount, _personCounter, _tipPercentage)}",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text("$_tipPercentage%",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold)),
                    Slider(
                        min: 0,
                        max: 100,
                        activeColor: Colors.blueAccent,
                        inactiveColor: Colors.grey,
                        divisions: 4,
                        value: _tipPercentage.toDouble(),
                        onChanged: (double newvalue) {
                          setState(() {
                            _tipPercentage = newvalue.round();
                          });
                        })
                  ],
                )
              ]),
            )
          ],
        ),
      ),
    ));
  }

  CalculateTotalPerPerson(double billAmount, int  splitBy, int tipPercentage) {
    var totalperPerson =
        (calculateTotalTip(billAmount, splitBy, tipPercentage) + billAmount) /
            splitBy;

    return totalperPerson;
  }

  calculateTotalTip(double billAmount, int splitBy, int tipPercentage) {
    double totalTip = 0.0;

    if (billAmount < 0 || billAmount.toString().isEmpty || billAmount == null) {
    } else
      totalTip = (billAmount * tipPercentage) / 100;

    return totalTip;
  }
}
