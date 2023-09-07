import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

class NextScreen extends StatefulWidget {
  NextScreen(
      {super.key,
      required this.score,
      required this.u,
      required this.s,
      required this.changeQuestion,
      });

  int score = 0;
  List<Widget> u = [];
  List<String> s = [];
  int changeQuestion = 0;

  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  final _controller=ConfettiController();
  @override
  void initState() {
    // TODO: implement initState
    _controller.play();
     Timer(Duration(seconds: 9), () {
      _controller.stop();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.deepPurple.shade200,
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          ConfettiWidget(
              blastDirection: 1.6,
              gravity: .05,
              emissionFrequency: .1,
              confettiController: _controller),
          SizedBox(height: 150,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset('assets/images/confetti.png',width: 50,),
              Text(
                'Your score is ${widget.score}',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 40, color: Colors.teal),
              ),
              Image.asset('assets/images/confetti (1).png',width: 50,)
            ],
          ),

          SizedBox(
            height: 15,
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 40,bottom: 50),
              child: ListView.builder(
                itemCount: widget.s.length,
                itemBuilder:(context,index){
                return Row(
                  children: [
                    Text('${index+1}.${widget.s[index]}',style: const TextStyle(fontSize: 35),),
                    widget.u[index]
                  ],
                );

                }
              ),
            ),
          ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.tealAccent,
                  minimumSize: Size(50, 70),
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
                  icon: const Icon(Icons.restart_alt),
                  onPressed:(){
                   Navigator.pop(context);
                  },
                  label: const Text('Restart')),
            ),

        ],
      )),
    );
  }
}
