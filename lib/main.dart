import 'package:flutter/material.dart';
import 'package:highline_tools/Webbing%20Tool/page_webbingLibrary.dart';
import 'package:provider/provider.dart';

import 'Drawer/mainDrawer.dart';
import 'Theme.dart';
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
          '/home':(context) => const MyHomePage(title: 'Highline Tools Home Page'),
          '/webbingLibrary':(context) => WebbingLibraryPage(),
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
    Provider.of<WebbingLibrary>(context).init();
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to highline Tools !',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),  // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
