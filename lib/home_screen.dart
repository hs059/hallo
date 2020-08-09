import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';

import 'custom_text_fileld.dart';
import 'information_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    InformationProvider pr = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
      ),
      body: ListView(
        children: [
          Form(
              key: _keyForm,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    label: 'Name',
                    validatorFun: pr.validatorName,
                    savedFun: pr.saveUserName,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    label: 'Email',
                    validatorFun: pr.validatorEmail,
                    savedFun: pr.saveEmail,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FlatButton(
                      onPressed: () {
                        DatePicker.showDatePicker(context,
                            showTitleActions: true,
                            minTime: DateTime(2018, 3, 5),
                            maxTime: DateTime(2030, 6, 7),
                            onChanged: (newdate) {}, onConfirm: (newdate) {
                          pr.date = newdate;
                        }, currentTime: DateTime.now(), locale: LocaleType.ar);
                      },
                      child: Text(
                        'Birthday',
                        style: TextStyle(color: Colors.blue),
                      )),
                  CheckboxListTile(
                      value: pr.checkBox,
                      title: Text(
                        'Accept Condition',
                        style: TextStyle(
                            fontSize: 20,
                            color: pr.checkBox ? Colors.green : Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                      onChanged: (check) {
                        pr.checkBox = check;

                        setState(() {});
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  RadioListTile(
                      title: Text('Male'),
                      value: 1,
                      groupValue: pr.groudValueRaido,
                      onChanged: (value) {
                        pr.groudValueRaido = value;

                        pr.savegender();

                        setState(() {});
                      }),
                  RadioListTile(
                      title: Text('Female'),
                      value: 2,
                      groupValue: pr.groudValueRaido,
                      onChanged: (value) {
                        pr.groudValueRaido = value;

                        pr.savegender();

                        setState(() {});
                      }),
                  SizedBox(
                    height: 80,
                  ),
                  GestureDetector(
                    onTap: () => pr.onSubmit(_keyForm, context),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.green),
                      child: Text(
                        'Return',
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
