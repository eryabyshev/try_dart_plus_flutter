import 'dart:collection';

import 'dart:core';

collections() {

    //list
    List <String> logTypes = new List <String>();
    logTypes.add("WARNING");
    logTypes.add("ERROR");
    logTypes.add("INFO");

    for (String type in logTypes) {
      print(type);
    }


    var lst = new List<int>(3);
    lst[0] = 12;
    lst[1] = 13;
    lst[2] = 11;
    print(lst);


    var list_name = [1,1,2];

    //set
    Set <int>numberSet = new  Set<int>();
    numberSet.add(100);
    numberSet.add(20);
    numberSet.add(5);
    numberSet.add(60);
    numberSet.add(70);

    numberSet.remove(70);
    numberSet.contains(60);


    //map
    Map <String,String>map={'name':'Tom','Id':'E1001'};

    var identifier = new Map<String, int>();
    identifier['key'] = 23;
    
    map.forEach((k, v) => print('${k}: ${v}'));


    //collection fraimorck like in java

    Map<String, String> hashmap = new HashMap<String, String>();














}