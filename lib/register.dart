



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

  DateTime selectedDate = DateTime.now();
  bool _obscureText = true;
  String dropdownValue = 'Male';
  String _myActivity;
  int selected_item = 0;
  String _selectedText;
  List<String> items = ['Male','Female'];
  Gender _selectedItem;
  FirstVoter _selectedType;

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
   // _selectedItem = _dropdownMenuItems[0].value;
    super.initState();
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

 // void showModelBottomSheet({BuildContext context, Container Function(BuildContext context) builder}) {}
}
