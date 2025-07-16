import 'dart:convert';
import 'package:flutter/material.dart';

class TaksModel {
  final int id;
  final String title;
  final String desc;
  final DateTime dueTime;
  final DateTime createTime;
  final bool isfinished;

  TaksModel({
    required this.id,
    required this.title,
    required this.desc,
    required this.dueTime,
    required this.createTime,
    required this.isfinished,
  });

  Map<dynamic, dynamic> toJson(){
    return{
      "id": id,
      "title": title,
      "desc": desc,
      "duetime": dueTime.toIso8601String(),
      "createtime": createTime.toIso8601String(),
      "isfinished": isfinished,
    };
  }

  factory TaksModel.fromJson(Map<String, dynamic> json){
    return TaksModel(
      id: json["id"], 
      title: json["title"], 
      desc: json["desc"], 
      dueTime: json["dueTime"], 
      createTime: json["createTime"], 
      isfinished: json["isfinished"],
      );
  }

}