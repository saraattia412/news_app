import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/states.dart';

import 'package:news_app/shared/network/remote/dio_helper.dart';
// ignore_for_file: avoid_print


class NewsCubit extends Cubit<NewsStates>{
  NewsCubit() : super(NewsInitialState());

  //OBJECT
static NewsCubit get(context) => BlocProvider.of(context);




List<dynamic> business =[];
void getBusiness(){
  emit(NewsGetBusinessLoadingState());

  DioHelper.getData(
    url: 'v2/top-headlines',
    query: {
      'country':'eg',
      'category':'business',
      'apiKey':'d64e577c111a4a28bd0f71b0e0bcbeca',
    },
  ).then((value) {

    business=value.data['articles'];
    print(business[0]['title']);
    emit(NewsGetBusinessSuccessState());

  }).catchError((error){
    print(error.toString());
    emit(NewsGetBusinessErrorState());
  });

}

  List<dynamic> sports =[];
  void getSports(){
    emit(NewsGetSportsLoadingState());


    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country':'eg',
        'category':'sports',
        'apiKey':'d64e577c111a4a28bd0f71b0e0bcbeca',

      },
    ).then((value) {

      sports=value.data['articles'];
      print(sports[0]['title']);
      emit(NewsGetSportsSuccessState());

    }).catchError((error){
      print(error.toString());
      emit(NewsGetSportsErrorState());
    });

  }

  List<dynamic> science =[];
  void getScience(){
    emit(NewsGetScienceLoadingState());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country':'eg',
        'category':'Science',
        'apiKey':'d64e577c111a4a28bd0f71b0e0bcbeca',

      },
    ).then((value) {

      science=value.data['articles'];
      print(science[0]['title']);
      emit(NewsGetScienceSuccessState());

    }).catchError((error){
      print(error.toString());
      emit(NewsGetScienceErrorState());
    });

  }




  //list to search
  List<dynamic> search =[];
  void getSearch(String value){
    emit(NewsGetSearchLoadingState());

    DioHelper.getData(
      url: 'v2/everything',
      query: {
        // ignore: unnecessary_string_interpolations
        'q': '$value',
        'apiKey':'d64e577c111a4a28bd0f71b0e0bcbeca',

      },
    ).then((value) {

      search=value.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchSuccessState());

    }).catchError((error){
      print(error.toString());
      emit(NewsGetSearchErrorState());
    });

  }


}