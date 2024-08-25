import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'small_cards.dart';
import 'gender_icon.dart';
import 'result.dart';
import 'calculator.dart';

const bottomContainerH = 60.0;
const cardsColor = Color(0xFF1D1E33);
const inactiveCardsColor = Color(0xFF111328);
const textstyleNUM = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

Color MaleColor = inactiveCardsColor;
Color FemaleColor = inactiveCardsColor;
bool isMaleActive = true;

void updateColor(String gender) {
  if (gender == "male" && isMaleActive) {
    if (MaleColor == inactiveCardsColor) {
      MaleColor = cardsColor;
    } else {
      MaleColor = inactiveCardsColor;
      isMaleActive = false;
    }
  }
  if (gender == "female" && !isMaleActive) {
    if (FemaleColor == inactiveCardsColor) {
      FemaleColor = cardsColor;
      isMaleActive = false;
    } else {
      FemaleColor = inactiveCardsColor;
      isMaleActive = true;
    }
  }
}

class _InputPageState extends State<InputPage> {
  int height = 160;
  int weight = 60;
  int age = 25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor("male");
                      });
                    },
                    child: Smallcard(
                      colour: MaleColor,
                      cardChild: Gendericon(
                        gendericon: FontAwesomeIcons.mars,
                        gendertype: "MALE",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor("female");
                      });
                    },
                    child: Smallcard(
                      colour: FemaleColor,
                      cardChild: Gendericon(
                        gendericon: FontAwesomeIcons.venus,
                        gendertype: "FEMALE",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Smallcard(
              colour: cardsColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Color(0xFF8D8E98),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: textstyleNUM,
                      ),
                      Text(
                        "cm",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Color(0xFF8D8E98),
                        ),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape:
                      RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                      RoundSliderOverlayShape(overlayRadius: 30.0),
                      thumbColor: Color(0xFFEB1555),
                      activeTrackColor: Colors.white,
                      overlayColor: Color(0x29EB1555),
                      inactiveTrackColor: Color(0xFF8D8E98),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      onChanged: (double newvalue) {
                        setState(() {
                          height = newvalue.round();
                        });
                      },
                      min: 110.0,
                      max: 220.0,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Smallcard(
                    colour: cardsColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xFF8D8E98),
                          ),
                        ),
                        Text(
                          weight.toString(),
                          style: textstyleNUM,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  }),
                              SizedBox(width: 10.0),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  }),
                            ]),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Smallcard(
                    colour: cardsColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xFF8D8E98),
                          ),
                        ),
                        Text(
                          age.toString(),
                          style: textstyleNUM,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  }),
                              SizedBox(width: 10.0),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  }),
                            ]),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Calcbuttom(
            text: "CALCULATE",
            func: () {
              calculator calc = calculator(height: height, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => result(
                        bmiResult: calc.CAlCbmi(),
                        textResult: calc.getresult(),
                        interResult: calc.getInterpretation(),
                      )));
            },
          ),
        ],
      ),
    );
  }
}

class Calcbuttom extends StatelessWidget {
  const Calcbuttom({required this.text, required this.func});
  final String text;
  final VoidCallback func;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            )),
        color: Color(0xFFEB1555),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: bottomContainerH,
        padding: EdgeInsets.only(bottom: 15.0),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onPressed});
  final IconData? icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
      elevation: 6.0,
      disabledElevation: 6.0,
    );
  }
}