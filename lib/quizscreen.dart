import 'package:flutter/material.dart';
import 'package:quizzler/NextScreen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> Qustions = [
    'Dog Is Loyal ?',
    'Birds can swim ?',
    'Man Is mortal ?',
    'Cat Have 5 legs ?',
    'Tomatoes are black ?',
    'Babies are Cute ?',
    'Flutter is easy ?',
  ];
  List<bool> CheckAnswer = [
    true,
    false,
    true,
    false,
    false,
    true,
    true,
  ];

  int ChangeQuestions = 0;
  List<Widget>Iconss=[];
  int score=0;

  @override
  Widget build(BuildContext context) {
    if (ChangeQuestions == Qustions.length && ChangeQuestions>0) {
      return NextScreen(score: score,u: Iconss,s: Qustions,changeQuestion: ChangeQuestions,);
    }
    else {
      return Scaffold(
        backgroundColor: Colors.deepPurple.shade200,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                Qustions[ChangeQuestions],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 50,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 70,),
              Container(
                decoration:const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(9,8),
                          spreadRadius: 2,
                          blurRadius: 3,
                          color: Colors.black45
                      )
                    ]
                ),
                height: 70,
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,

                  ),
                  onPressed: () {
                    setState(() {
                      if(CheckAnswer[ChangeQuestions]==true){
                        Iconss.add(Icon(Icons.check,color: Colors.tealAccent,size: 50,));
                        score++;
                      }
                      else{
                        Iconss.add(Icon(Icons.clear,size: 50,color: Colors.red,));
                      }
                      ChangeQuestions++;
                    });
                  },
                  child: Text('True',style: TextStyle(fontSize: 30),),),
              ),
              SizedBox(height: 30,),
              Container(
                height: 70,
                width: 300,
                decoration: const BoxDecoration(
                    boxShadow: [
                    BoxShadow(
                        offset: Offset(9,8),
                        spreadRadius: 2,
                        blurRadius: 3,
                        color: Colors.black45
                    ),
                  ],
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () {
                    //bool CorrectAnswer=CheckAnswer[ChangeQuestions];
                    setState(() {
                      if(CheckAnswer[ChangeQuestions]==false){
                        Iconss.add(Icon(Icons.check,color: Colors.tealAccent,size: 50,));
                        score++;
                      }
                      else{
                        Iconss.add(Icon(Icons.clear,size: 50,color: Colors.red,));
                      }
                      ChangeQuestions++;
                    });
                  }, child: Text('False',style: TextStyle(fontSize: 30),),),
              ),
              SizedBox(height: 30,),

            ],
          ),
        ),
      );
    }
  }
}