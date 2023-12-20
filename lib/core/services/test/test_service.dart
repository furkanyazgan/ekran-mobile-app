import 'package:ekran/constants/asset_paths.dart';

class TestService{
  static List<ConnectionModel> TestModelList=[
    ConnectionModel(imagePath: AssetPath.melis,name: "Melis",age: 20,gender: "Female"),
    ConnectionModel(imagePath: AssetPath.ege,name: "Ege",age: 21,gender: "Male"),
    ConnectionModel(imagePath: AssetPath.buse,name: "Buse",age: 23,gender: "Female"),
    ConnectionModel(imagePath: AssetPath.tolgahan,name: "Tolgahan",age: 19,gender: "Male"),


  ];


}


class ConnectionModel{
  ConnectionModel ({
    required this.imagePath,
    required this.name,
    required this.gender,
    required this.age
});
  String imagePath ="";
  String name ="" ;
  int age =19;
  String gender = "Male";
}