import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/shared/components/components.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
   SearchScreen({Key? key}) : super(key: key);

  var searchController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  validator: (value){
                    if(value!.isEmpty){
                      return ' search must not be empty';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Search',
                    prefixIcon: Icon(
                      Icons.search,
                    ),

                    border: OutlineInputBorder(),
                  ),
                  onFieldSubmitted: (value){
                    TextInputAction.done;
                  },
                  onChanged: (value){
                    NewsCubit.get(context).getSearch(value);
                  },


                ),
              ),

              Expanded(child: articleBuilder(NewsCubit.get(context).search,isSearch : true),),
            ],
          ),
        );
      },

    );
  }
}
