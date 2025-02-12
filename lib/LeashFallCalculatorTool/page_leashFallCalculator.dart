import 'package:flutter/material.dart';

import '../Drawer/mainDrawer.dart';

class LeashFallCalculatorPage extends StatefulWidget {
  const LeashFallCalculatorPage({super.key});

  @override
  State<LeashFallCalculatorPage> createState() => _LeashFallCalculatorPageState();
}

class _LeashFallCalculatorPageState extends State<LeashFallCalculatorPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text("Leash Fall Calculator", style: Theme.of(context).textTheme.headlineSmall,),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
    );
  }
}
