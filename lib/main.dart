import 'package:bmi_calculation/anim/FadeAnimation.dart';
import 'package:bmi_calculation/helthTips.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import './appHexColor.dart';

void main() => runApp(BmiApp());

class BmiApp extends StatefulWidget {
  @override
  _BmiAppState createState() => _BmiAppState();
}

class _BmiAppState extends State<BmiApp> {
  int _selectedIndex = 0;

  //https://www.nhs.uk/common-health-questions/lifestyle/what-is-the-body-mass-index-bmi/

  void onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;

      /* Fluttertoast.showToast(
          msg: "This is Center Short Toast" + _selectedIndex.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);*/

      /* Navigator.of(context)
          .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
        return new NewPage();
      }));*/
    });
  }

  final _widgetOptions = [Home(), HealthTips()];
  static const TextStyle navTextColor = TextStyle(color: Colors.white70);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Color(0xFF3D3D3E),
          body: Container(child: _widgetOptions.elementAt(_selectedIndex)),
          bottomNavigationBar: new BottomNavigationBar(
            backgroundColor: Colors.black26,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('BMI'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                title: Text(
                  'Tips',
                ),
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: onTabTapped,
          )),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void showErrorMsg(var msg) {
    Fluttertoast.showToast(
        msg: msg.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.white,
        textColor: Colors.redAccent,
        fontSize: 16.0);
  }

  var bmiStatus = [
    "You're in the underweight range",
    "You're in the healthy weight range",
    "You're in the overweight range ",
    "you're in the obese range"
  ];
  var colorCodeStr = [0xFFF20BF2, 0xFF16A085, 0xFFF2CF0B, 0xFFF20B0B];
  bool _validation = false;

  TextEditingController _weight_controller = TextEditingController();
  TextEditingController _height_in_feet_controller = TextEditingController();
  TextEditingController _height_in_inche_controller = TextEditingController();

  var weightVal, heightValInFeet, heightValInInche;
  var bmiFinalVal;
  var returnMsg = "";
  var statusCode = "";
  var statusColorCode = 0xFFF20BF2;

  void _pressProcessBtn() {
    setState(() {
      weightVal = _weight_controller.text;
      heightValInFeet = _height_in_feet_controller.text;
      heightValInInche = _height_in_inche_controller.text;

      weightVal.isEmpty ? _validation = true : _validation = false;

      checkedValidation(weightVal, heightValInFeet, heightValInInche);

      if (true) {
        BMICalcuation();
      }
    });
  }

  bool checkedValidation(
      var weightVal, var heightValInFeet, var heightValInInche) {
    if (weightVal.isEmpty) {
      setErrorMsg("Enter your weight");
      return false;
    }
    if (heightValInFeet.isEmpty) {
      setErrorMsg("Enter your height in feet");
      return false;
    }
    if (heightValInInche.isEmpty) {
      setErrorMsg("Enter your height in inche");
      return false;
    }

    return true;
  }

  void setErrorMsg(var msg) {
    Fluttertoast.showToast(
        msg: msg.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.white,
        textColor: Colors.redAccent,
        fontSize: 16.0);
  }

  void BMICalcuation() {
    setState(() {
      var weightInKg = int.parse(weightVal);
      var heightFeet = int.parse(heightValInFeet);
      var height_inche = int.parse(heightValInInche);

      var totalHeightInInche = (12 * heightFeet) + height_inche;
      var heightInMeter = (totalHeightInInche * 0.0254);

      bmiFinalVal = weightInKg / (heightInMeter * heightInMeter);
      setStatusMsg(bmiFinalVal);
    });
  }

  void setStatusMsg(var bmiFinalValues) {
    setState(() {
      if (bmiFinalValues < 18.5) {
        returnMsg = bmiStatus[0];
        statusCode = "Underweight";
        statusColorCode = colorCodeStr[0];
      } else if (bmiFinalValues >= 18.5 && bmiFinalValues < 24.9) {
        returnMsg = bmiStatus[1];
        statusCode = "Normal";
        statusColorCode = colorCodeStr[1];
      } else if (bmiFinalValues >= 25 && bmiFinalValues < 29.9) {
        returnMsg = bmiStatus[2];
        statusCode = "Overweight";
        statusColorCode = colorCodeStr[2];
      } else if (bmiFinalValues >= 30 && bmiFinalValues < 39.9) {
        returnMsg = bmiStatus[3];
        statusCode = "Obese";
        statusColorCode = colorCodeStr[3];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 68;
    return ListView(
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(top: 150, left: 15, right: 15),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(bottom: 30),
                      child: FadeAnimation(
                        1.3,
                        Text(
                          'Body Mass Index(BMI)',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                      )),
                  FadeAnimation(
                    1.7,
                    Card(
                        color: Colors.black26,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Weight',
                                    style: TextStyle(color: Colors.white70),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Weight',
                                      hintStyle:
                                          TextStyle(color: Colors.white12),
                                      errorText: _validation
                                          ? 'Value Can\'t Be Empty'
                                          : null,
                                    ),
                                    keyboardType: TextInputType.number,
                                    controller: _weight_controller,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    'Height',
                                    style: TextStyle(color: Colors.white70),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(right: 5),
                                        width: width / 2,
                                        child: TextField(
                                          decoration: InputDecoration(
                                              hintText: 'Feet',
                                              hintStyle: TextStyle(
                                                  color: Colors.white12)),
                                          keyboardType: TextInputType.number,
                                          controller:
                                              _height_in_feet_controller,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 5),
                                        width: width / 2,
                                        child: TextField(
                                          decoration: InputDecoration(
                                              hintText: 'Inche',
                                              hintStyle: TextStyle(
                                                  color: Colors.white12)),
                                          keyboardType: TextInputType.number,
                                          controller:
                                              _height_in_inche_controller,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    child: RaisedButton(
                                      onPressed: _pressProcessBtn,
                                      child: Text('Process'),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        )),
                  ),
                  FadeAnimation(
                    1.5,
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        statusCode,
                        style: TextStyle(color: Color(statusColorCode)),
                      ),
                    ),
                  ),
                  FadeAnimation(
                    1.5,
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        '$returnMsg',
                        style: TextStyle(color: Color(statusColorCode)),
                      ),
                    ),
                  ),
                ],
              ),
            ))
      ],
    );
  }
}
