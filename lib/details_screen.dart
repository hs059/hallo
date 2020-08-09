import 'package:flutter/material.dart';
import 'package:yazji_form_sp/shaerd_helper.dart';

class DetailsScreen extends StatefulWidget {
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  List<String> informationUser = [];

  @override
  void initState() {
    super.initState();
    // getInformation();
    // SharedHelper.sHelper
    //     .getInformationUser()
    //     .then((value) => informationUser = value);
  }

  getInformation() async {
    // informationUser = [];
    informationUser = await SharedHelper.sHelper.getInformationUser();
    setState(() {});
  }

  final TextStyle style = TextStyle(fontSize: 20, color: Colors.green);

  @override
  Widget build(BuildContext context) {
    // InformationProvider pr = Provider.of(context);
    getInformation();
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Form'),
      ),
      body: Center(
        child: informationUser.length > 0
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    // 'My Name is ${pr.username}',
                    'My Name is ${informationUser[0]}',
                    style: style,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    // 'My email is ${pr.email}',
                    'My email is ${informationUser[1]}',
                    style: style,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    // 'And Iam ${pr.gender}',
                    'And Iam ${informationUser[2]}',

                    style: style,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Text(
                  //   'Birthday is ${informationUser[3]}',
                  //   // 'Birthday is ${informationUser[3]}',
                  //   style: style,
                  // ),
                ],
              )
            : Text('Wating'),
      ),
    );
  }
}
