
import 'package:flutter/material.dart';
import 'constants.dart';
class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}
class _RegisterState extends State<Register> {

  TextEditingController fnamecontroller = TextEditingController();
  TextEditingController lnamecontroller = TextEditingController();

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
              controller: lnamecontroller,
              decoration: Decor.decorText.copyWith(labelText: "Email"),
            ),
            SizedBox(height: 20),
            TextFormField(
              style: CustomTextStyle.display5(context),
              controller: lnamecontroller,
              decoration: Decor.decorText.copyWith(labelText: "Password"),
            ),
            SizedBox(height: 20),
            TextFormField(
              style: CustomTextStyle.display5(context),
              controller: lnamecontroller,
              decoration: Decor.decorText.copyWith(labelText: "Gender"),
            ),
            SizedBox(height: 20),
            TextFormField(
              style: CustomTextStyle.display5(context),
              controller: lnamecontroller,
              decoration: Decor.decorText.copyWith(labelText: "Race"),
            ),
            SizedBox(height: 20),
            TextFormField(
              style: CustomTextStyle.display5(context),
              controller: lnamecontroller,
              decoration: Decor.decorText.copyWith(labelText: "First Time Voter?"),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: TextFormField(
                    style: CustomTextStyle.display5(context),
                    controller: fnamecontroller,
                    decoration: Decor.decorText.copyWith(labelText: 'Zip Code'),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: TextFormField(
                    style: CustomTextStyle.display5(context),
                    controller: lnamecontroller,
                    decoration: Decor.decorText.copyWith(labelText: "Birth Date"),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            TextFormField(
              style: CustomTextStyle.display5(context),
              controller: lnamecontroller,
              decoration: Decor.decorText.copyWith(labelText: "Political Party?"),
            ),
            SizedBox(height: 20),
            TextFormField(
              style: CustomTextStyle.display5(context),
              controller: lnamecontroller,
              decoration: Decor.decorText.copyWith(labelText: "Highest Level of Education"),
            ),
            SizedBox(height: 20),
            TextFormField(
              style: CustomTextStyle.display5(context),
              controller: lnamecontroller,
              decoration: Decor.decorText.copyWith(labelText: "Income Level"),
            ),
          ],
        ),
      ),
    );
  }
}
