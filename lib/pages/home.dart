import 'package:flutter/material.dart';
import 'package:ninjia_id/domain/workout.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: Text(
            'MaxFit',
            style: TextStyle(color: Colors.white),),
          leading: Icon(Icons.fitness_center),
        ),
        body: WorkoutsList(),
      ),
    );
  }
}
class WorkoutsList extends StatelessWidget {
  final workouts= <Workout>[
    Workout(title: 'Azamat',author: 'Yelubay',description: 'Good',level: '100'),
    Workout(title: 'Tyson',author: 'Mike',description: 'normal',level: '90'),
    Workout(title: 'Hollowey',author: 'Max',description: 'norm',level: '80'),
    Workout(title: 'Khabib',author: 'Nurmogamed',description: 'Good',level: '90'),
    Workout(title: 'Ali',author: 'Mohammed',description: 'Good',level: '100'),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(


        itemBuilder: (context,i){
          return Card(

            elevation: 1.0,
            margin: EdgeInsets.symmetric(horizontal: 8.0,vertical: 4.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.amber),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 10,),
                leading: Container(
                  padding: EdgeInsets.only(right: 12.0),
                  child: Icon(Icons.anchor_sharp,color: Colors.white,),
                  decoration: BoxDecoration(
                      border: Border(
                          right: BorderSide(width: 1,color: Colors.white)
                      )
                  ),
                ),


                title: Text(workouts[i].title,

                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                trailing: Icon(Icons.keyboard_arrow_right,color: Colors.white,),
                subtitle: getSubtitle(context,workouts[i]),
              ),
            ),
          );
        },
        itemCount: workouts.length,
      ),

    );
  }
}
Widget getSubtitle (BuildContext context,Workout workout){
  var color = Colors.grey;
  double indicatorlevel = 0;

  switch(workout.level){
    case '80':
      color=Colors.green;
      indicatorlevel=0.60;
      break;
    case '90':
      color=Colors.deepOrange;
      indicatorlevel=0.80;
      break;
    case '100':
      color=Colors.red;
      indicatorlevel=1.0;
      break;


  }
  return Row(

    children: <Widget>[
      Expanded(
          flex: 1,
          child: LinearProgressIndicator(
            backgroundColor: Colors.grey,
            value: indicatorlevel,
            valueColor: AlwaysStoppedAnimation(color),
          )
      ),
      SizedBox(
        width: 10.0,
      ),
      Expanded(
          flex: 3,
          child: Text(workout.level,style: TextStyle(color: Colors.white),))

    ],
  );

}
