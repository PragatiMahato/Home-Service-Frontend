// ignore_for_file: non_constant_identifier_names, unnecessary_null_comparison, library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/service_modal.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});



  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: ReadJsonData(),
        builder: (context,data){
          if(data.hasError){
            return Center(child: Text("${data.error}"));
          }else if(data.hasData){
            var items =data.data as List<ProductDataModel>;
            return ListView.builder(
              itemCount: items == null? 0: items.length,
                itemBuilder: (context,index){
                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: Image(image: NetworkImage(items[index].imageURL.toString()),fit: BoxFit.fill,),
                          ),
                          Expanded(child: Container(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(padding: const EdgeInsets.only(left: 8,right: 8),child: Text(items[index].name.toString(),style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                                ),),),
                                Padding(padding: const EdgeInsets.only(left: 8,right: 8),child: Text(items[index].price.toString()),)
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                  );
                }
            );
          }else{
            return const Center(child: CircularProgressIndicator(),);
          }
        },
      )
    );
  }

  Future<List<ProductDataModel>>ReadJsonData() async{
     final jsondata = await rootBundle.loadString('jsonfile/productlist.json');
     final list = json.decode(jsondata) as List<dynamic>;

     return list.map((e) => ProductDataModel.fromJson(e)).toList();
  }
  }