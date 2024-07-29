import 'package:flutter/material.dart';

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
                    colour: Color(0xFF1D1E33),
                  ),
                ),
                Expanded(
                  child: Smallcard(
                    colour: Color(0xFF1D1E33),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Smallcard(
              colour: Color(0xFF1D1E33),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Smallcard(
                    colour: Color(0xFF1D1E33),
                  ),
                ),
                Expanded(
                  child: Smallcard(
                    colour: Color(0xFF1D1E33),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Smallcard extends StatelessWidget {
  Smallcard({required this.colour});

  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: colour,
      ),
    );
  }
}

// child: Container(
//   margin: EdgeInsets.all(15.0),
//   decoration: BoxDecoration(
//     borderRadius: BorderRadius.circular(10.0),
//     color: Color(0xFF1D1E33),
//   ),
// ),
