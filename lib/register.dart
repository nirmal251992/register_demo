
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}
class _RegisterState extends State<Register> {

  TextEditingController fnamecontroller = TextEditingController();
  TextEditingController lnamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  bool _obscureText = true;
  String dropdownValue = 'Male';
  String _myActivity;
  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Demo'),
        centerTitle: true,
      ),
      body : Container(
         padding: EdgeInsets.all(20),
        child: ListView(
          padding: EdgeInsets.only(top: 10),
         // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: TextFormField(
                    style: CustomTextStyle.display5(context),
                    controller: fnamecontroller,
                    decoration: Decor.decorText.copyWith(labelText: 'First name'),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: TextFormField(
                    style: CustomTextStyle.display5(context),
                    controller: lnamecontroller,
                    decoration: Decor.decorText.copyWith(labelText: "Last name"),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            TextFormField(
              style: CustomTextStyle.display5(context),
              controller: emailcontroller,
              decoration: Decor.decorText.copyWith(labelText: "Email"),
            ),
            SizedBox(height: 20),
            TextFormField(

              style: CustomTextStyle.display5(context),
              controller: passwordcontroller,
              decoration: Decor.decorText.
              copyWith(labelText: "Password",
                       suffixIcon: IconButton(
                         icon: Icon( _obscureText ? Icons.visibility : Icons.visibility_off),
                         onPressed: () {
                _toggle();
              },),),
              obscureText: _obscureText,
            ),
            SizedBox(height: 20),
        DropDownFormField(
          titleText: 'My workout',
          hintText: 'Please choose one',
          value: _myActivity,
          onSaved: (value) {
            setState(() {
              _myActivity = value;
            });
          },
          onChanged: (value) {
            setState(() {
              _myActivity = value;
            });
          },
          dataSource: [
            {
              "display": "Running",
              "value": "Running",
            },
            {
              "display": "Climbing",
              "value": "Climbing",
            },
            {
              "display": "Walking",
              "value": "Walking",
            },
            {
              "display": "Swimming",
              "value": "Swimming",
            },
            {
              "display": "Soccer Practice",
              "value": "Soccer Practice",
            },
            {
              "display": "Baseball Practice",
              "value": "Baseball Practice",
            },
            {
              "display": "Football Practice",
              "value": "Football Practice",
            },
          ],
          textField: 'display',
          valueField: 'value',
        ),

            TextFormField(

              style: CustomTextStyle.display5(context),
              //controller: ,
              decoration: Decor.decorText.copyWith(labelText: "Gender",suffixIcon: IconButton(icon: Icon(Icons.keyboard_arrow_down),),),
              onTap: () {
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>['One', 'Two', 'Free', 'Four']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                );
                FocusScope.of(context).requestFocus(new FocusNode());
                // showModalBottomSheet(
                //     context: context,
                //     builder: (BuildContext builder) {
                //       return Container(
                //           height: 200,
                //          //  width: ,
                //            child: CupertinoPicker(
                //         magnification: 1.5,
                //         backgroundColor: Colors.black87,
                //         children: <Widget>[
                //           Text(
                //             "TextWidget",
                //             style: TextStyle(
                //                 color: Colors.white, fontSize: 20),
                //           ),
                //         ],
                //       ),
                //       );
                //       }
                //     );
                   },
                 ),
            SizedBox(height: 20),
            TextFormField(
              style: CustomTextStyle.display5(context),
            //  controller: lnamecontroller,
              decoration: Decor.decorText.copyWith(labelText: "Race",suffixIcon: IconButton(icon: Icon(Icons.keyboard_arrow_down),),),
            ),
            SizedBox(height: 20),
            TextFormField(
              style: CustomTextStyle.display5(context),
            //  controller: lnamecontroller,
              decoration: Decor.decorText.copyWith(labelText: "First Time Voter?",suffixIcon: IconButton(icon: Icon(Icons.keyboard_arrow_down),),),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: TextFormField(
                    style: CustomTextStyle.display5(context),
                   // controller: fnamecontroller,
                    decoration: Decor.decorText.copyWith(labelText: 'Zip Code'),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: TextFormField(
                    style: CustomTextStyle.display5(context),
                   // controller: lnamecontroller,
                    decoration: Decor.decorText.copyWith(labelText: "Birth Date",suffixIcon: IconButton(icon: Icon(Icons.keyboard_arrow_down),),),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            TextFormField(
              style: CustomTextStyle.display5(context),
             //controller: lnamecontroller,
              decoration: Decor.decorText.copyWith(labelText: "Political Party?",suffixIcon: IconButton(icon: Icon(Icons.keyboard_arrow_down),),),
            ),

            SizedBox(height: 20),
            TextFormField(
              style: CustomTextStyle.display5(context),
             //controller: lnamecontroller,
              decoration: Decor.decorText.copyWith(labelText: "Highest Level of Education",suffixIcon: IconButton(icon: Icon(Icons.keyboard_arrow_down),),),
            ),
            SizedBox(height: 20),
            TextFormField(
              style: CustomTextStyle.display5(context),
            //  controller: lnamecontroller,
              decoration: Decor.decorText.copyWith(labelText: "Income Level",suffixIcon: IconButton(icon: Icon(Icons.keyboard_arrow_down),),),
            ),
          ],
        ),
      ),
    );
  }

  void showModelBottomSheet({BuildContext context, Container Function(BuildContext context) builder}) {}
}
