import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  var bgColor = Colors.indigo.shade200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("your BMI")),
      ),
      body: SafeArea(
        child: Container(
          color: bgColor,
          child: Center(
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "BMI",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: wtController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      label: Text("Enter your Weight (in Kgs)"),
                      prefixIcon: Icon(Icons.line_weight),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: ftController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      label: Text("Enter your Height(in Feet)"),
                      prefixIcon: Icon(Icons.height),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: inController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      label: Text("Enter your Height(in Inch)"),
                      prefixIcon: Icon(Icons.height),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        var wt = wtController.text.toString();
                        var inch = inController.text.toString();
                        var ft = ftController.text.toString();

                        if (wt != "" && ft != "" && inch != "") {
                          var iWt = int.parse(wt);
                          var iFt = int.parse(ft);
                          var iInch = int.parse(inch);

                          var tInch = (iFt * 12) + iInch;

                          var tCm = tInch * 2.54;

                          var tM = tCm / 100;

                          var bmi = iWt / (tM * tM);

                          var msg = "";

                          if (bmi > 25) {
                            msg = " You are OverWeight !";
                            bgColor = Colors.orange.shade200;
                          } else if (bmi < 18) {
                            msg = " You are UnderWeight !";
                            bgColor = Colors.red.shade200;
                          } else {
                            msg = "You are Healthy!";
                            bgColor = Colors.green.shade200;
                          }

                          setState(() {
                            result =
                                "$msg \n Your BMI is: ${bmi.toStringAsFixed(4)}";
                          });
                        } else {
                          setState(() {
                            result = "Please fill all required blanks !!";
                          });
                        }
                      },
                      child: Text("Calculate")),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    result,
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
