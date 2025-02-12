import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:highline_tools/Webbing%20Tool/page_webbingLibrary.dart';
import 'package:provider/provider.dart';

import 'Drawer/mainDrawer.dart';
import 'LeashFallCalculatorTool/page_leashFallCalculator.dart';
import 'Theme.dart';
import 'UI Widgets/card.dart';
import 'Webbing Tool/Data/data_webbing.dart';
import 'Webbing Tool/Data/data_webbingLibrary.dart';
import 'Webbing Tool/Data/downloadData.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(context) =>WebbingLibrary()),
      ],
      child: MaterialApp(
      
        title: 'Highline tools',
        theme: CustomTheme.lightTheme,
        routes: {
          '/home':(context) =>  MyHomePage(title: 'Highline Tools Home Page'),
          '/webbingLibrary':(context) => WebbingLibraryPage(),
          '/leashfallCalculator':(context) => LeashFallCalculatorPage()
        },
        initialRoute: '/home',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    Provider.of<WebbingLibrary>(context, listen: false).init();
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.inversePrimary),
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title, style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Welcome to highline Tools !',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            CustomCard(title: 'Webbing library', icon: Icons.list, subtitle: 'A webbing list with their characteristics', onTap:(){Navigator.pushReplacementNamed(context, '/webbingLibrary');} ,),
            CustomCard(title: 'Leash Fall Calculator', icon: FontAwesomeIcons.personFalling , subtitle: 'A tool to see if your line is safe !', onTap:(){Navigator.pushReplacementNamed(context, '/leashfallCalculator');} ,),

          ],
        ),
      ),  // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
