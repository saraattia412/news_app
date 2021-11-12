
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/webview/webniew_screen.dart';

Widget builtArticleItem(article , context, ) => InkWell(
  onTap: (){
    navigateTo(context, WebViewScreen(url: article['url']));
  },
  child:   Padding(

    padding: const EdgeInsets.all(20.0),

    child: Row(

      children: [

        Container(

          width: 120,

          height: 120,

      decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(10),

          image: article['urlToImage'] != null ?  DecorationImage(

              image: NetworkImage('${article['urlToImage']}',

              ),

            fit: BoxFit.cover,

          )

              :  const DecorationImage(

            image: NetworkImage('https://media.istockphoto.com/photos/abstract-digital-news-concept-picture-id1290904409?b=1&k=20&m=1290904409&s=170667a&w=0&h=6khncht98kwYG-l7bdeWfBNs_GGcG1pDqzLb6ZXhh7I='),

            fit: BoxFit.cover,

          )



      ),











  ),

        const SizedBox(

          width: 20,

        ),

        Expanded(

          child: SizedBox(

            height: 120,

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              mainAxisAlignment: MainAxisAlignment.start,

              children:  [

                Expanded(

                  child: Text(

                    '${article['title']}',

                    style: Theme.of(context).textTheme.bodyText1,

                    maxLines: 3,

                    overflow: TextOverflow.ellipsis,

                  ),

                ),

                Text(

                  '${article['publishedAt']}',

                  style: const TextStyle(

                      color: Colors.grey



                  ),

                ),

              ],

            ),

          ),

        ),

      ],

    ),

  ),
);

Widget myDivider( ) => Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20,
  ),
  child: Container(
    width: double.infinity,
    height: 1,
    color: Colors.grey[300],
  ),
);

Widget articleBuilder(list, {isSearch =false }) => ConditionalBuilder(
    condition: list.isNotEmpty,
    builder: (context) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder:(context , index) => builtArticleItem(list[index],context),
        separatorBuilder: (context,index) => myDivider(),
        itemCount: 20
    ),
    fallback:(context) => isSearch ? Container() :const Center(child: CircularProgressIndicator())
);

void navigateTo(context, widget) =>
    Navigator.push(context,
    MaterialPageRoute(
    builder: (context) => widget,
    )
    );