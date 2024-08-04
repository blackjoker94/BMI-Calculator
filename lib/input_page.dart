import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'small_cards.dart';
import 'gender_icon.dart';

const bottomContainerH = 60.0;
const cardsColor = Color(0xFF1D1E33);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Smallcard(
                    colour: cardsColor,
                    cardChild: Gendericon(
                      gendericon: FontAwesomeIcons.mars,
                      gendertype: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  child: Smallcard(
                    colour: cardsColor,
                    cardChild: Gendericon(
                      gendericon: FontAwesomeIcons.venus,
                      gendertype: "FEMALE",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Smallcard(
              colour: cardsColor,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Smallcard(
                    colour: cardsColor,
                  ),
                ),
                Expanded(
                  child: Smallcard(
                    colour: cardsColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Color(0xFFEB1555),
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerH,
          ),
        ],
      ),
    );
  }
}
