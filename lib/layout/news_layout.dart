// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/business/business_screen.dart';
import 'package:news_app/modules/science/science_screen.dart';
import 'package:news_app/modules/search/search_screen.dart';
import 'package:news_app/modules/sports/sports_screen.dart';
import 'package:news_app/shared/components/components.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class NewsLayout extends StatelessWidget {
    NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {

        return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              actions:  [
                IconButton(onPressed: (){
                  navigateTo(context, SearchScreen());
                }, icon: const Icon(
                    Icons.search
                ),),
              ],
                bottom:  const TabBar(
                    tabs:[
                      Tab(text:'business',icon:  Icon(Icons.business)),
                      Tab(text:'sports',icon:  Icon(Icons.sports)),
                      Tab(text:'science',icon:  Icon(Icons.science)),

                    ]
                ),
            ),
            body:   const TabBarView(
              children:[
                BusinessScreen(),
                SportsScreen(),
                ScienceScreen(),
              ],

            ),


          ),
        );
      },

    );
  }
}
