import 'package:bmi_calculation/anim/FadeAnimation.dart';
import 'package:flutter/material.dart';

class HealthTips extends StatelessWidget {
  TextStyle textStyle1=new TextStyle(color: Colors.white70,fontSize: 15,fontWeight: FontWeight.bold);
  TextStyle textStyle2=new TextStyle(color: Colors.white70,fontSize: 12);
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: 60,left: 10,right: 10),
      child: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FadeAnimation(1,Text('What is the body mass index (BMI)?',style: textStyle1,),),
              SizedBox(height: 5,),
              FadeAnimation(1.1,Text(
                'The body mass index (BMI) is a measure that uses your height '
                    'and weight to work out if your weight is healthy.'
                    'The BMI calculation divides an adult weight in kilograms by their height in metres squared.',style: textStyle2,),),
              SizedBox(height: 10,),
              FadeAnimation(1.2,Text('BMI ranges',style: textStyle1,),),
              SizedBox(height: 5,),
              FadeAnimation(1.3,Text('For most adults, an ideal BMI is in the 18.5 to 24.9 range.'
                  'For children and young people aged 2 to 18, the BMI calculation takes into account'
                  ' age and gender as well as height and weight.',style: textStyle2,
              ),),
              SizedBox(height: 5,),
              FadeAnimation(1.4,Text('If your BMI is:',style: textStyle2,
              ),),
              SizedBox(height: 10,),
              FadeAnimation(1.4, Row(
                children: <Widget>[
                  Container(
                      width: width/7,
                      height: 30,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 10,
                            width: 10,
                            color: Colors.white70,
                          )
                        ],
                      )
                  ),
                  Container(
                    width:width-width/7-20,
                    child: Text('below 18.5 – you\'re in the underweight range',style: textStyle2,),
                  )
                ],
              ),),
              FadeAnimation(1.5, Row(
                children: <Widget>[
                  Container(
                      width: width/7,
                      height: 30,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 10,
                            width: 10,
                            color: Colors.white70,
                          )
                        ],
                      )
                  ),
                  Container(
                    width:width-width/7-20,
                    child: Text('between 18.5 and 24.9 – you\'re in the healthy weight range ',style: textStyle2,),
                  )
                ],
              ),),
              FadeAnimation(1.6, Row(
                children: <Widget>[
                  Container(
                      width: width/7,
                      height: 30,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 10,
                            width: 10,
                            color: Colors.white70,
                          )
                        ],
                      )
                  ),
                  Container(
                    width:width-width/7-20,
                    child: Text('between 25 and 29.9 – you\'re in the overweight range',style: textStyle2,),
                  )
                ],
              ),),
              FadeAnimation(1.7, Row(
                children: <Widget>[
                  Container(
                      width: width/7,
                      height: 30,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 10,
                            width: 10,
                            color: Colors.white70,
                          )
                        ],
                      )
                  ),
                  Container(
                    width:width-width/7-20,
                    child: Text('between 30 and 39.9 – you\'re in the obese range ',style: textStyle2,),
                  )
                ],
              ),)

            ],
          )
        ],
      )
    );
  }
}
