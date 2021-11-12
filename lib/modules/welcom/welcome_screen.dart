// ignore_for_file: avoid_print

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/layout/news_layout.dart';
import 'package:news_app/shared/components/components.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'News App',
        ),
        actions: [
          IconButton(
              onPressed: (){
                AppCubit.get(context).changeAppMode();
              },
              icon: const Icon(
                  Icons.brightness_6_outlined
              )
          ),
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
          Center(
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 30.0,
                fontFamily: 'Bobbers',
                color: Colors.deepOrange
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText('Welcome In News App'),
                  TypewriterAnimatedText('Welcome In News App'),
                  TypewriterAnimatedText('Welcome In News App'),
                  TypewriterAnimatedText('Welcome In News App'),

                ],
                isRepeatingAnimation: true,
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),
          ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: double.infinity,
                height: 50,
                decoration:  BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TextButton(onPressed: (){
                  navigateTo(context,NewsLayout());
                }, child: const Text(''
                    'Continue',
                  style: TextStyle(
                    fontSize: 30,

                  ),
                )),
              ),
            )


          ],
        ),
      ),
    );
  }
}
