
// main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      // Remove the debug banner icon
      debugShowCheckedModeBanner: false,
      title:'BMI Calculator',
      home : HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // the controller for the text field associated with "height"
  final _heightController = TextEditingController();

  // the controller for the text field associated with "weight"
  final _weightController = TextEditingController();
  double _heightOfUser = 100.0;
  double _weightOfUser = 40.0;
  double? _bmi;
  // the message at the beginning
  String _message = 'Please enter your height an weight';

  // This function is triggered when the user pressess the "Calculate" button
  void _calculate() {
    final double height = _heightOfUser;
    final double weight = _weightOfUser;

    setState(() {
      _bmi = weight / ((height/100) * (height/100));
      if (_bmi! < 18.5) {
        _message = "You are underweight";
      } else if (_bmi! < 25) {
        _message = 'You body is fine';
      } else if (_bmi! < 30) {
        _message = 'You are overweight';
      } else {
        _message = 'You are obese';
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent[400],
      appBar: AppBar(
        title: Center(
            child: Text(
                "BMI CALCULATOR",
                style: TextStyle(color: Colors.pinkAccent[400]),
            ),
        ),
        backgroundColor: Colors.pink[50],
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Card(
            color: Colors.pink[50],
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Height (cm)", style: TextStyle(color: Colors.pinkAccent[400], fontSize: 30, fontWeight: FontWeight.w400),),

                  Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Slider(
                      min: 80.0,
                      max: 250.0,
                      onChanged: (height){
                        setState(() {
                          _heightOfUser = height;
                        });
                      },
                      value: _heightOfUser,
                      divisions: 170,
                      activeColor: Colors.pinkAccent[400],
                      label: "$_heightOfUser",
                    ),
                  ),

                  Text("$_heightOfUser cm", style: TextStyle(color: Colors.pinkAccent[400], fontSize: 25, fontWeight: FontWeight.w900),),

                  SizedBox(height: 40,),

                  Text("Weight (kg)", style: TextStyle(color: Colors.pinkAccent[400], fontSize: 30, fontWeight: FontWeight.w400),),

                  Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Slider(
                      min: 30.0,
                      max: 120.0,
                      onChanged: (height){
                        setState(() {
                          _weightOfUser = height;
                        });
                      },
                      value: _weightOfUser,
                      divisions: 100,
                      activeColor: Colors.pinkAccent[400],
                      label: "$_weightOfUser",
                    ),
                  ),

                  Text("$_weightOfUser kg", style: TextStyle(color: Colors.pinkAccent[400], fontSize: 25, fontWeight: FontWeight.w900),),

                  const SizedBox(
                    height: 40,
                  ),

                  ElevatedButton(
                    onPressed: _calculate,
                    style: ElevatedButton.styleFrom(
                        primary: Colors.pinkAccent[400],
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    child: const Text('Calculate'),
                  ),

                  const SizedBox(
                    height: 40,
                  ),

                  Text(
                      _bmi == null ? 'No Result' : _bmi!.toStringAsFixed(2),
                    style: const TextStyle(fontSize: 50),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    _message,
                    style: const TextStyle(fontSize: 30),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



