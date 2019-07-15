import 'package:flutter/material.dart';
import 'package:week_3/models/post.dart';
import 'package:week_3/models/chat.dart';
import 'package:week_3/utils/utils.dart';

//   purchases: [{ type: Schema.Types.ObjectId, ref: "post" }], //구매내역
//   sales: [{ type: Schema.Types.ObjectId, ref: "post" }], //판매내역
//   chats: [{ type: Schema.Types.ObjectId, ref: "chat" }],
//   wish: [{ type: Schema.Types.ObjectId, ref: "post" }],
//   keywords: [String]

class User {
  String id;
  String name;
  String email;
  List<Post> purchases;
  List<Post> sales;
  List<Post> wish;
  List<String> keywords;
  List<Chat> chats;
  int salesCount = 0;

  User.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        name = json['name'],
        email = json['email'] {
    try {
      purchases = json['purchases'].length > 0
          ? json['purchases']
              .where((p) {
                return p is! String;
              })
              .map((p) {
                return Post.fromJson(p);
              })
              .toList()
              .cast<Post>()
          : <Post>[];

      sales = json['sales'].length > 0
          ? json['sales']
              .where((p) {
                return p is! String;
              })
              .map((p) {
                return Post.fromJson(p);
              })
              .toList()
              .cast<Post>()
          : <Post>[];

      salesCount = json['salesCount'];

      wish = json['wish'].length > 0
          ? json['wish']
              .where((p) {
                return p is! String;
              })
              .map((p) {
                return Post.fromJson(p);
              })
              .toList()
              .cast<Post>()
          : <Post>[];

      chats = json['chats'].length > 0
          ? json['chats']
              .where((p) {
                return p is! String;
              })
              .map((p) {
                return Chat.fromJson(p);
              })
              .toList()
              .cast<Chat>()
          : <Chat>[];

      keywords = json['keywords'].length > 0
          ? json['keywords'].cast<String>()
          : <String>[];
    } catch (e) {
      log.e(e);
    }
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
    };
  }
}