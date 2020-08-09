import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:yazji_form_sp/shaerd_helper.dart';

import 'details_screen.dart';
import 'home_screen.dart';
import 'information_provider.dart';


main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool seen = await SharedHelper.sHelper.getValue();
  print(seen);
  Widget _screen;

  if (seen == null || seen == false) {
    _screen = HomeScreen();
  } else {
    _screen = DetailsScreen();
  }
  print(_screen);

  runApp(MyApp(
    screen: _screen,
  ));
}

class MyApp extends StatelessWidget {
  final Widget screen;
  MyApp({this.screen});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<InformationProvider>(
      create: (context) => InformationProvider(),
      child: MaterialApp(
        home: screen,
        // builder: ExtendedNavigator<Router>(router: Router()),
      ),
    );
  }
}
