import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';

import 'util/params_response.dart';
import 'util/params_data.dart';

YYDialog cityPickerParams(BuildContext context, params, Function onConfirm) {
  return YYDialog().build(context)
    ..gravity = Gravity.bottom
    ..gravityAnimationEnable = true
    ..backgroundColor = Colors.transparent
    ..widget(ChooseList(params: params, onConfirm: onConfirm,))
    ..show();
}

class ChooseList extends StatefulWidget {
  final Function onConfirm;

  final params;

  const ChooseList({Key key, this.params, this.onConfirm,}) : super(key: key);

  @override
  _ChooseListState createState() => _ChooseListState();
}

class _ChooseListState extends State<ChooseList> {
  List<CityResponse> provinceList = [];
  List<CityResponse> cityList = [];
  List<CityResponse> areaList = [];

  int provinceIndex = 0;
  int cityIndex = 0;
  int areaIndex = 0;

  final List<FixedExtentScrollController> scrollController = [];

  @override
  void initState() {
    super.initState();
    print("initState");
    final indexs = widget.params['indexs'];
    print(indexs);
    if (scrollController.length == 0) {
      if(indexs.length == 0) { //没选择数据的时候是这个逻辑
        for (int i = 0; i < 3; i++) { // 这里的三 是总共3个列
          scrollController.add(FixedExtentScrollController(initialItem: 0));
        }
      } else { // 选择完数据的时候
        for (int i = 0; i < 3; i++) {
          scrollController.add(FixedExtentScrollController(initialItem: indexs[i]));
        }
      }
    }
    initIndexs(indexs);
    initData(indexs);
  }

  //初始化下标
  void initIndexs(indexs) {
    if(indexs.length ==0){
      provinceIndex = 0;
      cityIndex = 0;
      areaIndex = 0;
    } else { // 选中之后再次进来
      provinceIndex = indexs[0];
      cityIndex = indexs[1];
      areaIndex = indexs[2];
    }
  }

  void initData(indexs){
    provinceList = provinceList1;
    if(indexs.length == 0){
      cityList = getCity(id: 0);
      areaList = getArea(id: 0);
    } else {
      var selectCityIndex = indexs[0];
      var selectAreaIndex =0;
      for(var i =0;i<indexs[0]; i++){
        selectAreaIndex += getCity(id: i).length;
        // for(var j=0;j< indexs[1]; j++) {
        //   selectAreaIndex += getCity(id: j).length;
        // }
      }
      selectAreaIndex += indexs[1];
      // selectAreaIndex += indexs[2]; //加上
      print(selectAreaIndex);
      cityList = getCity(id: selectCityIndex);
      areaList = getArea(id: selectAreaIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(16)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          vGap(10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center, //横轴居中对齐(默认)
              children: [
                GestureDetector( //手势
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "取消",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14),
                    )),
                Text(
                  "选择城市",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      // widget.onConfirm(areaList[areaIndex]);
                      widget.onConfirm({'indexs':[provinceIndex, cityIndex, areaIndex]});
                      print([provinceIndex, cityIndex, areaIndex]);
                    },
                    child: Text("确定",
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 14))),
              ],
            ),
          ),
          vGap(10),
          Row(
            children: [
              buildCity(
                  list: provinceList, scroll: scrollController[0],columnNum: 1),
              buildCity(
                  list: cityList, scroll: scrollController[1],columnNum: 2),
              buildCity(
                  list: areaList, scroll: scrollController[2],columnNum: 3),
            ],
          )
        ],
      ),
    );
  }

  Widget buildCity(
      {List<CityResponse> list,
        FixedExtentScrollController scroll,
        int columnNum,
        Function onSelected}) {
    return Expanded(
      flex: 1,
      child: Container(
          height: 230,
          child: list.length != 0
              ? CupertinoPicker.builder(
            scrollController: scroll,
            itemExtent: 30,
            diameterRatio: 3,
            squeeze: 0.8,
            onSelectedItemChanged: (int _index) {
              // print("第$columnNum列");
              if(columnNum == 1){
                setState(() {
                  provinceIndex = _index;
                  cityIndex = 0;
                  areaIndex = 0;
                  cityList = getCity(id: _index);
                  areaList = getArea(id: getCity(id: _index)[0].id);
                });
                if (scrollController[1].hasClients) {
                  scrollController[1].jumpTo(0.0);
                }
              }else if(columnNum == 2){
                setState(() {
                  cityIndex = _index;
                  areaIndex = 0;
                  areaList = getArea(id: cityList[_index].id);
                });
                if (scrollController[2].hasClients) {
                  scrollController[2].jumpTo(0.0);
                }
              }else if(columnNum == 3){
                setState(() {
                  areaIndex = _index;
                });
              }
              print([provinceIndex, cityIndex, areaIndex]);
            },
            itemBuilder: (context, index) {
              return Center(
                  child: Text(
                    "${list[index].name}",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ));
            },
            childCount: list.length,
          )
              : Container()),
    );
  }

  // 纵向间距
  static SizedBox vGap(double height){
    return SizedBox(
      height: height,
    );
  }
}