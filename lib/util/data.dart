import 'city_response.dart';

/// create by crius on 2021/3/23
/// email:criusker@163.com

List<CityResponse> provinceList1 = [
  CityResponse(id: 0, name: "浙江省"),
  CityResponse(id: 1, name: "上海市"),
  CityResponse(id: 2, name: "陕西省"),
  CityResponse(id: 3, name: "吉林省"),
  CityResponse(id: 4, name: "湖北省"),
  CityResponse(id: 5, name: "四川省"),
  CityResponse(id: 6, name: "江苏省")
];

List<CityResponse> city1 = [
  CityResponse(id: 0, name: "杭州"),
  CityResponse(id: 1, name: "绍兴"),
  CityResponse(id: 2, name: "嘉兴"),
  CityResponse(id: 3, name: "台州"),
  CityResponse(id: 4, name: "宁波")
];
List<CityResponse> city2 = [
  CityResponse(id: 5, name: "浦东"),
  CityResponse(id: 6, name: "普陀"),
  CityResponse(id: 7, name: "松江"),
  CityResponse(id: 8, name: "杨浦"),
  CityResponse(id: 9, name: "静安"),
  CityResponse(id: 10, name: "虹口"),
  CityResponse(id: 11, name: "宝山")
];
List<CityResponse> city3 = [
  CityResponse(id: 12, name: "西安"),
  CityResponse(id: 13, name: "咸阳")
];
List<CityResponse> city4 = [
  CityResponse(id: 14, name: "长春"),
  CityResponse(id: 15, name: "吉林")
];
List<CityResponse> city5 = [
  CityResponse(id: 16, name: "武汉")
];
List<CityResponse> city6 = [
  CityResponse(id: 17, name: "成都")
];
List<CityResponse> city7 = [
  CityResponse(id: 18, name: "南京")
];

List<CityResponse> getCity({int id = 0}){
  if(id == 0){
    return city1;
  }else if(id == 1){
    return city2;
  }else if(id == 2){
    return city3;
  }else if(id == 3){
    return city4;
  }else if(id == 4){
    return city5;
  }else if(id == 5){
    return city6;
  }else if(id == 6){
    return city7;
  }else {
    return [];
  }
}

List<CityResponse> area1 = [
  CityResponse(id: 0, name: "杭州一区"),
  CityResponse(id: 1, name: "杭州二区")
];
List<CityResponse> area2 = [
  CityResponse(id: 2, name: "绍兴一区"),
  CityResponse(id: 3, name: "绍兴二区")
];
List<CityResponse> area3 = [
  CityResponse(id: 4, name: "嘉兴一区"),
  CityResponse(id: 5, name: "嘉兴二区")
];
List<CityResponse> area4 = [
  CityResponse(id: 6, name: "台州一区"),
  CityResponse(id: 7, name: "台州二区")
];
List<CityResponse> area5 = [
  CityResponse(id: 8, name: "宁波一区"),
  CityResponse(id: 9, name: "宁波二区")
];
List<CityResponse> area6 = [
  CityResponse(id: 10, name: "浦东一区"),
  CityResponse(id: 11, name: "浦东二区")
];
List<CityResponse> area7 = [
  CityResponse(id: 12, name: "普陀一区"),
  CityResponse(id: 13, name: "普陀二区")
];
List<CityResponse> area8 = [
  CityResponse(id: 14, name: "松江一区"),
  CityResponse(id: 15, name: "松江二区")
];
List<CityResponse> area9 = [
  CityResponse(id: 16, name: "杨浦一区"),
  CityResponse(id: 17, name: "杨浦二区")
];
List<CityResponse> area10 = [
  CityResponse(id: 18, name: "静安一区"),
  CityResponse(id: 19, name: "静安二区")
];
List<CityResponse> area11 = [
  CityResponse(id: 20, name: "虹口一区"),
  CityResponse(id: 21, name: "虹口二区")
];
List<CityResponse> area12 = [
  CityResponse(id: 22, name: "宝山一区"),
  CityResponse(id: 23, name: "宝山二区")
];
List<CityResponse> area13 = [
  CityResponse(id: 24, name: "西安一区"),
  CityResponse(id: 25, name: "西安二区")
];
List<CityResponse> area14 = [
  CityResponse(id: 26, name: "咸阳一区"),
  CityResponse(id: 27, name: "咸阳二区")
];
List<CityResponse> area15 = [
  CityResponse(id: 28, name: "长春一区"),
  CityResponse(id: 29, name: "长春二区")
];
List<CityResponse> area16 = [
  CityResponse(id: 30, name: "吉林一区"),
  CityResponse(id: 31, name: "吉林二区")
];
List<CityResponse> area17 = [
  CityResponse(id: 32, name: "武汉一区"),
  CityResponse(id: 33, name: "武汉二区")
];
List<CityResponse> area18 = [
  CityResponse(id: 34, name: "成都一区"),
  CityResponse(id: 35, name: "成都二区")
];
List<CityResponse> area19 = [
  CityResponse(id: 36, name: "南京一区"),
  CityResponse(id: 37, name: "南京二区")
];
List<CityResponse> getArea({int id = 0}){
  if(id == 0){
    return area1;
  }else if(id == 1){
    return area2;
  }else if(id == 2){
    return area3;
  }else if(id == 3){
    return area4;
  }else if(id == 4){
    return area5;
  }else if(id == 5){
    return area6;
  }else if(id == 6){
    return area7;
  }else if(id == 7){
    return area8;
  }else if(id == 8){
    return area9;
  }else if(id == 9){
    return area10;
  }else if(id == 10){
    return area11;
  }else if(id == 11){
    return area12;
  }else if(id == 12){
    return area13;
  }else if(id == 13){
    return area14;
  }else if(id == 14){
    return area15;
  }else if(id == 15){
    return area16;
  }else if(id == 16){
    return area17;
  }else if(id == 17){
    return area18;
  }else if(id == 18){
    return area19;
  }else {
    return [];
  }
}
