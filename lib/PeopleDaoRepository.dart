import 'package:list_with_bloc/PeopleModel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:list_with_bloc/PeopleResponse.dart';

abstract class PeopleRepository{
  Future<List<People>> bringPeople ();
}

class PeopleDaoRepository implements PeopleRepository{
  
  List<People> parsePeopleResponse(String response){
    return PeopleResponse.fromJson(json.decode(response)).peopleList;
  }

  @override
  Future<List<People>> bringPeople() async{
    var url = Uri.parse("http://kasimadalan.pe.hu/kisiler/tum_kisiler.php");
    var response = await http.get(url);
    return parsePeopleResponse(response.body);
  }
}