import 'package:flutter/material.dart';
import 'story_brain.dart';
import 'dart:io';


void main() => runApp(Destini());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}



StoryBrain story= new StoryBrain();

class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/background.png"), fit: BoxFit.cover),
          ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    story.getStory(),
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: FlatButton(
                  onPressed: () {
                    //Choice 1 made by user.
                    setState(() {
                      /*if (story.getChoice2() == 'Exit'){
                        exit(0);
                      }*/
                      story.nextStory(1);
                    });
                  },
                  color: Colors.red,
                  child: Text(

                    story.getChoice1(),
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,

                child: Visibility(
                  visible: story.ShouldBeVisible(),
                  child: FlatButton(
                    onPressed: () {
                      //Choice 2 made by user.
                     /* if (story.getChoice2() == 'Exit'){
                        exit(0);
                      }*/
                      setState(() {
                        story.nextStory(2);
                      });

                    },
                    color: Colors.blue,
                    child: Text(
                      story.getChoice2(),
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

