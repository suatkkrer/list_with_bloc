import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_with_bloc/PeopleCubitState.dart';
import 'package:list_with_bloc/PeopleDaoRepository.dart';

class PeopleCubit extends Cubit<PeopleState>{
  PeopleRepository peopleRepository;
  PeopleCubit(this.peopleRepository):super(PeopleInitialize());

  Future<void> showPeople() async {
    try{
      emit(PeopleLoading());

      var peopleListResponse = await peopleRepository.bringPeople();

      emit(PeopleLoaded(peopleListResponse));
    }catch(e){
      emit(PeopleError("Error Occurred"));
    }
  }
}