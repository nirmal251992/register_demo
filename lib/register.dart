

import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'Models.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  TextEditingController fnamecontroller = TextEditingController();
  TextEditingController lnamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController genderController =  TextEditingController();
  TextEditingController birthController =  TextEditingController();
  List<Gender> _genders = Gender.getCompanies();
  List<DropdownMenuItem<Gender>> _dropdownMenuItems;
  List<FirstVoter> _firstvoters = FirstVoter.getCompanies();
  List<DropdownMenuItem<FirstVoter>> _dropdownMenuVoters;
  List<Political> _names = Political.getCompanies();
  List<DropdownMenuItem<Political>> _dropdownMenuParties;
  List<Education> _degrees = Education.getCompanies();
  List<DropdownMenuItem<Education>> _dropdownMenuDegrees;
  List<Income> _slots = Income.getCompanies();
  List<DropdownMenuItem<Income>> _dropdownMenuSlots;
  DateTime selectedDate = DateTime.now();
  bool _obscureText = true;
  String dropdownValue = 'Male';
  String _myActivity;
  int selected_item = 0;
  String _selectedText;
  List<String> items = ['Male','Female'];
  Gender _selectedItem;
  FirstVoter _selectedType;
  Political _selectedname;
  Education _selectedDegree;
  Income _selectedslot;
  bool _agreedToTOS = true;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1950),
        lastDate: DateTime.now()
    );

    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        String date = new DateFormat('dd-MM-yyyy').format(selectedDate);
        birthController.text = date;
        //selectedDate.toString();
      });
  }
  void _setAgreedToTOS(bool newValue) {
    setState(() {
      _agreedToTOS = newValue;
    });
  }
  Widget _showModalBottomSheet(context){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context){
          return Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            child: _showCupertinoDatePicker(),
          );
        }
    );
  }

  Widget _showCupertinoDatePicker() {
    return CupertinoDatePicker(

      initialDateTime: selectedDate,
      onDateTimeChanged: (DateTime newDate) {
        selectedDate = newDate;
        birthController.text = selectedDate.toString();
        print('2. onDateTimeChanged : $selectedDate' );
      },
      // minimumYear: 2020,
      // maximumYear: 2050,
      mode: CupertinoDatePickerMode.date,
    );
  }
  Widget _buildItemPicker() {
    return CupertinoPicker(
      itemExtent: 60.0,
     // backgroundColor: CupertinoColors.white,
      onSelectedItemChanged: (index) {
        setState(() {
          selected_item = index;
        });
        print(index);
      },
      children: new List<Widget>.generate(items.length, (index) {
        return new Center(child:
        Text(items[index]),
        );
      }),
    );
  }
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_genders);
    _dropdownMenuVoters = buildDropdownMenuVoters(_firstvoters);
    _dropdownMenuParties = buildDropdownMenuParties(_names);
    _dropdownMenuDegrees = buildDropdownMenuDegrees(_degrees);
    _dropdownMenuSlots = buildDropdownMenuSlots(_slots);
    //_selectedItem.gender = '';
   // _selectedItem = _dropdownMenuItems[0].value;
    super.initState();
  }
  List<DropdownMenuItem<Income>> buildDropdownMenuSlots(List companies) {
    List<DropdownMenuItem<Income>> items = List();
    for (Income name in companies) {
      items.add(
        DropdownMenuItem(
          value: name,
          child: Text(name.slot),
        ),
      );
    }
    return items;
  }
  List<DropdownMenuItem<Education>> buildDropdownMenuDegrees(List companies) {
    List<DropdownMenuItem<Education>> items = List();
    for (Education name in companies) {
      items.add(
        DropdownMenuItem(
          value: name,
          child: Text(name.name),
        ),
      );
    }
    return items;
  }
  List<DropdownMenuItem<Political>> buildDropdownMenuParties(List companies) {
    List<DropdownMenuItem<Political>> items = List();
    for (Political name in companies) {
      items.add(
        DropdownMenuItem(
          value: name,
          child: Text(name.name),
        ),
      );
    }
    return items;
  }
  List<DropdownMenuItem<FirstVoter>> buildDropdownMenuVoters(List companies) {
    List<DropdownMenuItem<FirstVoter>> items = List();
    for (FirstVoter vote in companies) {
      items.add(
        DropdownMenuItem(
          value: vote,
          child: Text(vote.type),
        ),
      );
    }
    return items;
  }
  List<DropdownMenuItem<Gender>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<Gender>> items = List();
    for (Gender gender in companies) {
      items.add(
        DropdownMenuItem(
          value: gender,
          child: Text(gender.gender),
        ),
      );
    }
    return items;
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
            Container(
              height: 60,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.0),
                  color: Colors.transparent,
                  border: Border.all(color: Colors.grey),
                 ),
              child:
                  DropdownButtonHideUnderline(
                    child: DropdownButton(
                      hint: Text('Gender'),
                      icon: Icon(Icons.keyboard_arrow_down),
                      isExpanded: true,
                        value: _selectedItem,
                        items: _dropdownMenuItems,
                        onChanged: (value) {
                          setState(() {
                            _selectedItem = value;
                            print(_selectedItem.gender);
                           // print(value.toString());
                            //genderController.text = _selectedItem.gender;
                          });
                        }),
                  ),
            ),
            SizedBox(height:20),
            // TextFormField(
            //   style: CustomTextStyle.display5(context),
            //  // controller: genderController,
            //     showCursor: false,
            //   decoration:
            //     Decor.decorText.copyWith(labelText: "Gender",suffixIcon: IconButton(icon: Icon(Icons.keyboard_arrow_down),),),
            //   onTap: () async {
            //     FocusScope.of(context).requestFocus(new FocusNode());
            //     }
            //   ),
            TextFormField(
              style: CustomTextStyle.display5(context),
            //  controller: lnamecontroller,
              decoration: Decor.decorText.copyWith(labelText: "Race",suffixIcon: IconButton(icon: Icon(Icons.keyboard_arrow_down),),),
            ),
            SizedBox(height: 20),
            Container(
              height: 60,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.0),
                color: Colors.transparent,
                border: Border.all(color: Colors.grey),
              ),
              child:
              DropdownButtonHideUnderline(
                child: DropdownButton(
                  hint: Text('First Time Voters?'),
                    icon: Icon(Icons.keyboard_arrow_down),
                    isExpanded: true,
                    value: _selectedType,
                    items: _dropdownMenuVoters,
                    onChanged: (value) {
                      setState(() {
                        _selectedType = value;
                        print(_selectedType.type);
                        // print(value.toString());
                        //genderController.text = _selectedItem.gender;
                      });
                    }),
              ),
            ),
            // TextFormField(
            //   style: CustomTextStyle.display5(context),
            // //  controller: lnamecontroller,
            //   decoration: Decor.decorText.copyWith(labelText: "First Time Voter?",suffixIcon: IconButton(icon: Icon(Icons.keyboard_arrow_down),),),
            // ),
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
                   controller: birthController,
                    decoration: Decor.decorText.copyWith(labelText: "Birth Date",suffixIcon: IconButton(icon: Icon(Icons.keyboard_arrow_down),),),
                    onTap: () {
                      if (Platform.isIOS) {
                        _showModalBottomSheet(context);
                      }
                      if (Platform.isAndroid) {
                        _selectDate(context);
                      }
                      FocusScope.of(context).requestFocus(new FocusNode());
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              height: 60,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.0),
                color: Colors.transparent,
                border: Border.all(color: Colors.grey),
              ),
              child:
              DropdownButtonHideUnderline(
                child: DropdownButton(
                    hint: Text('Political Party'),
                    icon: Icon(Icons.keyboard_arrow_down),
                    isExpanded: true,
                    value: _selectedname,
                    items: _dropdownMenuParties,
                    onChanged: (value) {
                      setState(() {
                        _selectedname = value;
                        print(_selectedname.name);
                        // print(value.toString());
                        //genderController.text = _selectedItem.gender;
                      });
                    }),
              ),
            ),
            // TextFormField(
            //   style: CustomTextStyle.display5(context),
            //  //controller: lnamecontroller,
            //   decoration: Decor.decorText.copyWith(labelText: "Political Party?",suffixIcon: IconButton(icon: Icon(Icons.keyboard_arrow_down),),),
            // ),

            SizedBox(height: 20),
            Container(
              height: 60,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.0),
                color: Colors.transparent,
                border: Border.all(color: Colors.grey),
              ),
              child:
              DropdownButtonHideUnderline(
                child: DropdownButton(
                    hint: Text('Education'),
                    icon: Icon(Icons.keyboard_arrow_down),
                    isExpanded: true,
                    value: _selectedDegree,
                    items: _dropdownMenuDegrees,
                    onChanged: (value) {
                      setState(() {
                        _selectedDegree = value;
                        print(_selectedDegree.name);
                        // print(value.toString());
                        //genderController.text = _selectedItem.gender;
                      });
                    }),
              ),
            ),
            // TextFormField(
            //   style: CustomTextStyle.display5(context),
            //  //controller: lnamecontroller,
            //   decoration: Decor.decorText.copyWith(labelText: "Highest Level of Education",suffixIcon: IconButton(icon: Icon(Icons.keyboard_arrow_down),),),
            // ),
            SizedBox(height: 20),
            Container(
              height: 60,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.0),
                color: Colors.transparent,
                border: Border.all(color: Colors.grey),
              ),
              child:
              DropdownButtonHideUnderline(
                child: DropdownButton(
                     hint:Text('Income Level'),
                    icon: Icon(Icons.keyboard_arrow_down),
                    isExpanded: true,
                    value: _selectedslot,
                    items: _dropdownMenuSlots,
                    onChanged: (value) {
                      setState(() {
                        _selectedslot = value;
                        print(_selectedslot.slot);
                        // print(value.toString());
                        //genderController.text = _selectedItem.gender;
                      });
                    }),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children:<Widget> [
                Checkbox(
                  value: _agreedToTOS,
                  onChanged: _setAgreedToTOS,
                ),
                GestureDetector(
                  onTap: () => _setAgreedToTOS(!_agreedToTOS),
                  child: const Text('I agree to the'),
                ),
                Text('Terms of Service and ',style: TextStyle(decoration: TextDecoration.underline,),)
              ],
            ),
            Text('Disclousures ',style: TextStyle(decoration: TextDecoration.underline,),),

            // TextFormField(
            //   style: CustomTextStyle.display5(context),
            // //  controller: lnamecontroller,
            //   decoration: Decor.decorText.copyWith(labelText: "Income Level",suffixIcon: IconButton(icon: Icon(Icons.keyboard_arrow_down),),),
            // ),
            SizedBox(height: 20),
            FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              //disabledColor: Colors.grey,
             // disabledTextColor: Colors.black,
              padding: EdgeInsets.all(20.0),
              splashColor: Colors.blueAccent,
              onPressed: () {
                print('create account tapped');
                /*...*/
              },
              child: Text(
                "Create Account",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ],

        ),
      ),
    );
  }

 // void showModelBottomSheet({BuildContext context, Container Function(BuildContext context) builder}) {}
}
