import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:highline_tools/Webbing%20Tool/Data/data_webbing.dart';
import 'package:provider/provider.dart';

import '../Drawer/mainDrawer.dart';
import 'Data/data_webbingLibrary.dart';
import 'Data/downloadData.dart';

class WebbingLibraryPage extends StatefulWidget {
  WebbingLibraryPage({super.key});

  @override
  State<WebbingLibraryPage> createState() => _WebbingLibraryPageState();
}

class _WebbingLibraryPageState extends State<WebbingLibraryPage> {
  bool displayRope = false;
  bool displayWebbing = true;
  List<Webbing> webbingListDisplayed = [];
  TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    webbingListDisplayed = Provider.of<WebbingLibrary>(context, listen: false).listWebbingOnly;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text("Webbing Library"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).colorScheme.surfaceContainer,
                hintText: "Search",
                hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
                prefixIcon: Icon(Icons.search,  color: Theme.of(context).colorScheme.primary ,),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide.none),
              ),
                onChanged: (value) {
                setState(() {
                  webbingListDisplayed = updatedList(displayRope, displayWebbing, textEditingController.text);
                });

              }
            ),
          ),
          Divider(indent: 10, endIndent: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.resolveWith(
                            (states) => displayWebbing
                                ? Theme.of(context).colorScheme.inversePrimary
                                : Theme.of(context).colorScheme.surfaceContainer)),
                    onPressed: () {
                      setState(() {
                        displayWebbing = !displayWebbing;
                        webbingListDisplayed = updatedList(displayRope, displayWebbing, textEditingController.text);
                      });
                    },
                    child: Text(
                      "Webbing",
                      style: TextStyle(
                          color: displayWebbing
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.primary),
                    )),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.resolveWith(
                                (states) => displayRope
                                ? Theme.of(context).colorScheme.inversePrimary
                                : Theme.of(context).colorScheme.surfaceContainer)),
                    onPressed: () {
                      setState(() {
                        displayRope = !displayRope;
                        webbingListDisplayed = updatedList(displayRope, displayWebbing, textEditingController.text);
                      });
                    },
                    child: Text("Rope", style: TextStyle(
                        color: displayRope
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.primary),))
              ],
            ),
          ),


          WebbingList(webbingListDisplayed),
        ],
      )),
    );
  }

  updatedList(bool displayRope, bool displayWebbing, String searchText) {
    ///Compute a list of webbing with corresponding to the different filters.
  print("Search text : $searchText");
    List<Webbing> list = [];
    switch (displayRope) {
      case true:
        switch (displayWebbing) {
          case true:
            list = Provider.of<WebbingLibrary>(context, listen: false).list;
            break;
          case false:
            list = Provider.of<WebbingLibrary>(context, listen: false)
                .listRopeOnly;
            break;
        }
        break;
      case false:
        switch (displayWebbing) {
          case true:
            list = Provider.of<WebbingLibrary>(context, listen: false)
                .listWebbingOnly;
            break;
          case false:
            list = List<Webbing>.empty();
            break;
        }
        break;
    }
    if(searchText.isNotEmpty){
      list = list.where((webbing)=> webbing.name.toLowerCase().contains(searchText.toLowerCase())).toList();
    }
    return list;
  }

}

class WebbingList extends StatelessWidget {
  final List<Webbing> listWebbing;

  const WebbingList(this.listWebbing, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: listWebbing.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ExpansionTile(
                  title: Row(
                    children: [
                      Icon(Icons.line_axis),
                      Text(listWebbing[index].name,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(
                        " - ${listWebbing[index].brand}",
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(FontAwesomeIcons.weightHanging),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${listWebbing[index].weight?.toString() ?? "--"} g/m"),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(FontAwesomeIcons.sliders),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        listWebbing[index].materialType ??
                                            "--"),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(FontAwesomeIcons.scissors),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${listWebbing[index].breakingStrength?.toString() ?? "--"} kN"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(FontAwesomeIcons.arrowsLeftRight),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                    "${listWebbing[index].stretch?.toString() ?? "--"}"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ]),
            );
          }),
    );
  }
}
