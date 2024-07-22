// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tiktok_clone/features/videos/models/video_model.dart';

import 'package:tiktok_clone/main.dart';

void main() {
  group("Video Model Test", () {
    test("Constructor", () {
      final video = VideoModel(
          id: "id",
          description: "description",
          fileUrl: "fileUrl",
          thumbnailUrl: "thumbnailUrl",
          liked: 1,
          comments: 1,
          creator: "creator",
          creatorUid: "creatorUid",
          createdAt: 1,
          title: "title");

      expect(video.id, "id");
    });

    test(".fromJson Construor", () {
      final video = VideoModel.fromJson(json: {
        "id": "id",
        "description": "description",
        "fileUrl": "fileUrl",
        "thumbnailUrl": "thumbnailUrl",
        "liked": 1,
        "comments": 1,
        "creator": "creator",
        "creatorUid": "creatorUid",
        'createdAt': 1,
        "title": "title"
      }, videoId: "videoId");
      expect(video.title, "title");
      expect(video.comments, isInstanceOf<int>());
    });

    test(
      " toJson Method",
      () {
        final video = VideoModel(
          id: "id",
          description: "description",
          fileUrl: "fileUrl",
          thumbnailUrl: "thumbnailUrl",
          liked: 1,
          comments: 1,
          creator: "creator",
          creatorUid: "creatorUid",
          createdAt: 1,
          title: "title",
        );
        final json = video.toJson();
        expect(json["id"], "id");
        expect(json['liked'], isInstanceOf<int>());
      },
    );
  });
}
