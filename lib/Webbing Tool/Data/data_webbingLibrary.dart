import 'package:flutter/material.dart';

import 'data_webbing.dart';
import 'downloadData.dart';

class WebbingLibrary with ChangeNotifier {
  List<Webbing> lst = [];

  get list => this.lst;

  get length => this.lst.length;

  get listWebbingOnly {
    /// Return list where material type is not rope (null count as not rope)
    List<Webbing> lstWebbing = [];
    for (var webbing in this.lst) {
      if (webbing.materialType == null) {
        lstWebbing.add(webbing);
      } else if (!(webbing.materialType!.contains("rope"))) {
        lstWebbing.add(webbing);
      }
    }
    return lstWebbing;
  }

  get lengthWebbingOnly {
    /// Size of the list where material type is not rope (null count as not rope)
    return listWebbingOnly.length;
  }

  get listRopeOnly {
    /// Return list where material type is  rope (null count as not rope)
    List<Webbing> lstRope = [];
    for (var webbing in this.lst) {
      if (webbing.materialType != null) {
        if ((webbing.materialType!.contains("rope"))) {
          lstRope.add(webbing);
        }
      }
    }
    return lstRope;
  }

  List <Webbing> filteredList(String namePart){
    /// Return list where name contains namePart
    List<Webbing> lstFiltered = [];
    for (var webbing in this.lst) {
      if (webbing.name.contains(namePart)) {
        lstFiltered.add(webbing);
      }
    }
    return lstFiltered;
  }

  void clear() {
    this.lst.clear();
    notifyListeners();
  }

  void add(Webbing webbing) {
    this.lst.add(webbing);
    notifyListeners();
  }

  void init() {
    getWebbingDataFromGithub().then((webbing) {
      this.lst = webbing ?? [];
      notifyListeners();
    });
  }
}
