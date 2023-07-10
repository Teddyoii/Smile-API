import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('CORRECT', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),),
              SizedBox(height: 5,),
              Icon(Icons.done, color: Colors.green, size: 120,),
              SizedBox(height: 5,),
              Text('+10 Points ', style: TextStyle(color: Colors.black, fontSize: 20),),
              SizedBox(height: 60,),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/play');
                }, 
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 14),
                  child: Text('Next Level', style: TextStyle(color: Colors.white, fontSize: 20),),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}