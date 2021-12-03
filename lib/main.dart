import 'package:city_picker_demo/city_picker_dialog.dart';
import 'package:city_picker_demo/city_picker_params.dart';
import 'package:city_picker_demo/custom_picker.dart';
import 'package:flutter/material.dart';
import 'util/custom_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String city = "";

  List<dynamic> dialogIndexs = [];

  List<dynamic> paramsIndexs = [];

  List<dynamic> paramsNames = [];

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("城市选择器Demo"),
     ),
     body: Center(
       child: GestureDetector(
         onTap: (){

         },
         child: Column(
             crossAxisAlignment: CrossAxisAlignment.stretch,
             mainAxisSize: MainAxisSize.max,
             children: [
               RaisedButton(
                 padding: EdgeInsets.all(0),
                 onPressed: () {
                   cityPickerDialog(context,{"indexs":dialogIndexs}, (area){
                     print("选择的城市：$area");
                     setState(() {
                       city = area.name;
                     });
                   });
                 },
                 child: Row(
                   children: [
                     Text('城市选择'),

                   ],
                 ),
               ),
               RaisedButton(
                 padding: EdgeInsets.all(0),
                 onPressed: () {
                   cityPickerParams(context,{"indexs":paramsIndexs}, (area){
                     print(area['indexs']);
                     setState(() {
                       paramsIndexs = area['indexs'];
                     });
                   });
                 },
                 child: Row(
                   children: [
                     Text('params城市选择'),
                   ],
                 ),
               ),
               RaisedButton(
                 padding: EdgeInsets.all(0),
                 onPressed: () {
                   customPicker(context,{"indexs":paramsIndexs, "initData": industriesData, "colNum":2}, (opt){
                     print(opt['indexs']);
                     print(opt['names']);
                     setState(() {
                       paramsIndexs = opt['indexs'];
                       paramsNames = opt['names'];
                     });
                   });
                 },
                 child: Row(
                   children: [
                     Text('自定义城市选择'),

                   ],
                 ),
               ),
             ]
         ),
       ),
     ),
   );
  }
}
