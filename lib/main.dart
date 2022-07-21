import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

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
  double billAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: ListView(
        scrollDirection: Axis.vertical, 
        padding:EdgeInsets.all(20) ,
          children: [
            Container(height: 150,
            width: 150, 
            decoration: BoxDecoration(
              color:Colors.purpleAccent.shade200,
            ),


            ),

          ], 
          )
          
            
              
              
              
              

            
          ),
        ),
      );
    
  }
}
