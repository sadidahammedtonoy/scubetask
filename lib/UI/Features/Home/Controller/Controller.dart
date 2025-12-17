import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:scubetask/App/assets_path.dart';
import 'package:scubetask/App/routes.dart';

class home_controller extends GetxController{

  var option_list = [
    {
      'icon' : assets_path.chart,
      'title' : 'Analysis Pro'
    },
    {
      'icon' : assets_path.generator,
      'title' : 'G. Generator'
    },
    {
      'icon' : assets_path.charge,
      'title' : 'Plant Summery'
    },
    {
      'icon' : assets_path.fire,
      'title' : 'Natural Gas'
    },
    {
      'icon' : assets_path.generator,
      'title' : 'D. Generator'
    },
    {
      'icon' : assets_path.faucet,
      'title' : 'Water Process'
    }
  ];

  var chart_list = [
    {
      "id" : "001",
      "color_code" : "0xFF78C6FF",
      "title" : "Data View",
      "icon" : assets_path.solar,
      "data" : ["55505.63", "58805.63"],
      "status" : "Active"
    },
    {
      "id" : "002",
      "color_code" : "0xFFFB902E",
      "title" : "Data Type 2",
      "icon" : assets_path.solar,
      "data" : ["55505.63", "58805.63"],
      "status" : "Active"
    },
    {
      "id" : "003",
      "color_code" : "0xFF78C6FF",
      "title" : "Data Type 3",
      "icon" : assets_path.power,
      "data" : ["55505.63", "58805.63"],
      "status" : "Inactive"
    }
  ];

  void route_options(String optionName) {
    debugPrint("Option Name: $optionName");
    Get.toNamed(routes.options_screen);
  }

  void route_data_preview() {
    Get.toNamed(routes.data_preview_screen);
  }

}