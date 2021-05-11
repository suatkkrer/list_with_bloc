import 'package:list_with_bloc/PeopleModel.dart';

abstract class PeopleRepository{
  Future<List<People>> bringPeople ();
}

class PeopleDaoRepository implements PeopleRepository{

  @override
  Future<List<People>> bringPeople() async{
    var peopleList = List<People>();

    var k1 = People("1","asdfasf","1111");
    var k2 = People("1","sadfasf","231321");

    peopleList.add(k1);
    peopleList.add(k2);

    return peopleList;
  }
}