import 'package:list_with_bloc/PeopleModel.dart';

abstract class PeopleState{
  PeopleState();
}

class PeopleInitialize extends PeopleState{
  PeopleInitialize();
}

class PeopleLoading extends PeopleState{
  PeopleLoading();
}

class PeopleLoaded extends PeopleState{
  List<People> peopleList;
  PeopleLoaded(this.peopleList);
}

class PeopleError extends PeopleState{
  String errorMessage;
  PeopleError(this.errorMessage);
}