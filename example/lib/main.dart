/*
Name: Akshath Jain
Date: 3/15/19
Purpose: define the RadioButtonGroup object
Copyright: © 2019, Akshath Jain. All rights reserved.
Licensing: More information can be found here: https://github.com/akshathjain/grouped_buttons/blob/master/LICENSE
*/

/*
Edited by Abdurrahman Anas to add a GRID orientation
Linkedin: https://www.linkedin.com/in/abdurrahman-anas-mohammad/
Date: 27/11/19
*/

import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

void main() => runApp(GroupedButtonExample());

class GroupedButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grouped Buttons Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _checked = ["A", "B"];
  String _picked = "Two";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grouped Buttons Example"),
      ),
      body: _body(),
    );
    //
  }

  Widget _body() {
    return ListView(children: <Widget>[
      //--------------------
      //SIMPLE USAGE EXAMPLE
      //--------------------

      //VERTICAL CHECKBOXGROUP
      Container(
        padding: const EdgeInsets.only(left: 14.0, top: 14.0),
        child: Text(
          "Vertical CheckboxGroup",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
      ),

      CheckboxGroup(
        orientation: GroupedButtonsOrientation.VERTICAL,
        labels: <String>[
          "Sunday",
          "Monday",
          "Tuesday",
          "Wednesday",
          "Thursday",
          "Friday",
          "Saturday",
        ],
        disabled: ["Wednesday", "Friday"],
        onChange: (bool isChecked, String label, int index) =>
            print("isChecked: $isChecked   label: $label  index: $index"),
        onSelected: (List<String> checked) =>
            print("checked: ${checked.toString()}"),
      ),

      //HORIZONTAL RADIOBUTTONGROUP
      Container(
        padding: const EdgeInsets.only(left: 14.0, top: 14.0),
        child: Text(
          "Horizontal RadioButtonGroup",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
      ),

      RadioButtonGroup(
        orientation: GroupedButtonsOrientation.HORIZONTAL,
        labels: [
          "Option 1",
          "Option 2",
        ],
        disabled: ["Option 1"],
        onChange: (String label, int index) =>
            print("label: $label index: $index"),
        onSelected: (String label) => print(label),
      ),

      //BASIC CHECKBOXGROUP with GRID VIEW
      Container(
        padding: const EdgeInsets.only(left: 14.0, top: 14.0),
        child: Text(
          "Grid CheckboxGroup",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
      ),

      CheckboxGroup(
        orientation: GroupedButtonsOrientation.GRID,
        labels: <String>[
          "Football",
          "Basketball",
          "Swimming",
          "Karate",
          "Jumping",
        ],
        disabled: ["Wednesday", "Friday"],
        onChange: (bool isChecked, String label, int index) =>
            print("isChecked: $isChecked   label: $label  index: $index"),
        onSelected: (List<String> checked) =>
            print("checked: ${checked.toString()}"),
      ),

      //--------------------
      //CUSTOM USAGE EXAMPLE
      //--------------------

      ///CUSTOM CHECKBOX GROUP
      Container(
        padding: const EdgeInsets.only(left: 14.0, top: 14.0, bottom: 14.0),
        child: Text(
          "Custom Horizontal CheckboxGroup",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
      ),

      CheckboxGroup(
        orientation: GroupedButtonsOrientation.HORIZONTAL,
        margin: const EdgeInsets.only(left: 12.0),
        onSelected: (List selected) => setState(() {
          _checked = selected;
        }),
        labels: <String>[
          "A",
          "B",
        ],
        checked: _checked,
        itemBuilder: (Checkbox cb, Text txt, int i) {
          return Column(
            children: <Widget>[
              Icon(Icons.polymer),
              cb,
              txt,
            ],
          );
        },
      ),

      ///CUSTOM RADIOBUTTON GROUP
      Container(
        padding: const EdgeInsets.only(left: 14.0, top: 14.0, bottom: 14.0),
        child: Text(
          "Custom Vertival RadioButtonGroup",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
      ),

      RadioButtonGroup(
        orientation: GroupedButtonsOrientation.VERTICAL,
        margin: const EdgeInsets.only(left: 12.0),
        onSelected: (String selected) => setState(() {
          _picked = selected;
        }),
        labels: <String>[
          "One",
          "Two",
        ],
        picked: _picked,
        itemBuilder: (Radio rb, Text txt, int i) {
          return Column(
            children: <Widget>[
              Icon(Icons.public),
              rb,
              txt,
            ],
          );
        },
      ),

      ///CUSTOM GRID RADIOBUTTON GROUP
      Container(
        padding: const EdgeInsets.only(left: 14.0, top: 14.0, bottom: 14.0),
        child: Text(
          "Custom Grid RadioButtonGroup",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
      ),

      RadioButtonGroup(
        orientation: GroupedButtonsOrientation.GRID,
        margin: const EdgeInsets.only(left: 12.0),
        onSelected: (String selected) => setState(() {
          _picked = selected;
        }),
        labels: <String>[
          "Waffles or Crepes  ",
          "Pesto Pasta  ",
          "Rice  ",
          "Spaghetti  ",
          "Vegetable Lasagna  ",
          "Beef & Broccoli  ",
          "Meatball Subs  ",
          "Salmon  ",
          "Tomato-Bacon Pasta  ",
          "Tortellini  ",
          "Eggplant Parmesan  ",
          "White Chicken Chili  ",
          "Jambalaya  ",
          "Tortellini Soup  ",
          "Tostadas  ",
          "Kabobs  ",
        ],
        picked: _picked,
        itemBuilder: (Radio rb, Text txt, int i) {
          return Column(
            children: <Widget>[
              Icon(Icons.fastfood),
              rb,
              txt,
            ],
          );
        },
      ),
    ]);
  }
}
