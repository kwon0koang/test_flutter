import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_flutter/src/model/photo_model.dart';
import 'package:test_flutter/src/network/dio.dart';

part 'photo_repository.g.dart';

@riverpod
PhotoRepository photoRepository(PhotoRepositoryRef ref) => PhotoRepository(ref);

@RestApi()
abstract class PhotoRepository {
  factory PhotoRepository(Ref ref) => _PhotoRepository(
        ref.read(dioProvider),
      );

  @GET("/photos")
  Future<List<PhotoModel>> getPhotos({
    @Query("albumId") int? albumId,
  });
}
