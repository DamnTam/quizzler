
import 'package:flutter/material.dart';
import 'quizscreen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade200,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               const Text('Hello welcome to the Quizzler!',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color:Colors.black),),
               Image.asset('assets/images/quiz (1).png',width: 50,),
             ],
           ),
            Image.asset('assets/images/vote.png',width: 199,),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.tealAccent,
                    minimumSize: const Size(200,70),
                    shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),
                icon: const Icon(Icons.arrow_forward_ios_outlined),
                onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));

                },
                label: const Text('Start_Quiz',style: TextStyle(fontSize: 30),)),
          ],
        ),
      ),
    );
  }
}
