import 'package:list_with_bloc/PeopleModel.dart';

class PeopleResponse {
  int success;
  List<People> peopleList;

  PeopleResponse(this.success, this.peopleList);

  factory PeopleResponse.fromJson(Map<String,dynamic> json){

    var jsonArray = json["kisiler"] as List;

    List<People> peopleList = jsonArray.map((jsonArrayObject) => People.fromJson(jsonArrayObject)).toList();
    print(peopleList.length);
    return PeopleResponse(json["success"] as int,peopleList);
  }
}