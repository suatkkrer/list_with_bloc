import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_with_bloc/PeopleCubit.dart';
import 'package:list_with_bloc/PeopleCubitState.dart';
import 'package:list_with_bloc/PeopleDaoRepository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PeopleCubit(PeopleDaoRepository())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
    context.read<PeopleCubit>().showPeople();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
      ),
      body: BlocBuilder<PeopleCubit,PeopleState>(
        builder: (context,peopleState){
          // if(peopleState is PeopleLoading){
          // }
          if(peopleState is PeopleLoaded){
            var peopleList = peopleState.peopleList;

            return ListView.builder(
              itemCount: peopleList.length,
              itemBuilder: (context,index){
                var person = peopleList[index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        children: [
                          Text("${person.name} - ${person.tel}"),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center();
          }
          // if(peopleState is PeopleError){
          //   String errorMessage = peopleState.errorMessage;
          // }
        },
      ),
    );
  }
}
