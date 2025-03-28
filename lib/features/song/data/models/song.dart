// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify_clone/features/song/domain/entities/song.dart';

class SongModel {
  String? title;
  String? artist;
  num? duration;
  Timestamp? releaseDate;
  bool? isFavorite;
   String? songId;

  SongModel(
      {required this.title,
      required this.artist,
      required this.duration,
      required this.isFavorite,
      required this.songId,
      required this.releaseDate});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'artist': artist,
      'duration': duration,
      'releaseDate': releaseDate,
    };
  }

  // factory SongModel.fromMap(Map<String, dynamic> map) {
  //   return SongModel(
  //     title: map['title'] as String,
  //     artist: map['artist'] as String,
  //     duration: map['duration'] as num,
  //     releaseDate: map['releaseDate'] as Timestamp,
  //   );
  // }

  String toJson() => json.encode(toMap());

  // factory SongModel.fromJson(String source) => SongModel.fromMap(json.decode(source) as Map<String, dynamic>);

  SongModel.fromJson(Map<String, dynamic> data) {
    title = data['title'];
    artist = data['artist'];
    duration = data['duration'];
    releaseDate = data['releaseDate'];
  }
}

extension SongModelX on SongModel {
  SongEntity toEntity() {
    return SongEntity(
      title: title!,
      artist: artist!,
      duration: duration!,
      releaseDate: releaseDate!,
      isFavorite: isFavorite!,
       songId: songId!
    );
  }
}
