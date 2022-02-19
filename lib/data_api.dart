import 'dart:convert';
import 'package:definitly_app/modals/category.dart';
import 'package:definitly_app/modals/collection.dart';
import 'package:definitly_app/modals/concept.dart';
import 'package:definitly_app/modals/criteria.dart';
import 'package:definitly_app/modals/conceptList.dart';
import 'package:definitly_app/modals/criteriaList.dart';
import 'package:definitly_app/modals/collectionList.dart';
import 'package:definitly_app/modals/categoryList.dart';
import 'package:definitly_app/modals/commentList.dart';
import 'package:definitly_app/modals/comment.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'modals/criteria.dart';

@JsonSerializable(explicitToJson: true, nullable: false)
class dataApi {
  static Future<dynamic> getData(Extentions extention) async {
    String url = "https://defintly.knoblich.co/" +
        EnumToString.convertToString(extention);
    final response = await http.get(Uri.parse(url));
    var t = response.body.toString();
    final data = json.decode(t);
    switch (EnumToString.convertToString(extention)) {
      case "concepts":
        return ConceptList.fromJson(data);
      case "collections":
        return CollectionList.fromJson(data);
      case "criteria":
        return CriteriaList.fromJson(data);
      case "categories":
        return CategoryList.fromJson(data);
    }
  }

  static Future<String?> loadAsset(LocalFiles localFiles) async {
    return await rootBundle.loadString(
        'assets/' + EnumToString.convertToString(localFiles) + '.md');
  }

  static late List<Category> categories;
  static late List<Collection> collections;
  static late List<Concept> concepts;
  static late List<Criteria> criteria;

  static late String contact;
  static late String define_it;
  static late String footer;
  static late String overview;

  static Future<List> loadData() async {
    concepts =
        (await dataApi.getData(Extentions.concepts) as ConceptList).concepts;
    collections =
        (await dataApi.getData(Extentions.collections) as CollectionList)
            .collections;
    criteria =
        (await dataApi.getData(Extentions.criteria) as CriteriaList).criteria;
    categories = (await dataApi.getData(Extentions.categories) as CategoryList)
        .categories;
    return [concepts, collections, criteria, categories];
  }

  static Future<List> loadLocalData() async {
    contact = (await dataApi.loadAsset(LocalFiles.contact) as String);
    define_it = (await dataApi.loadAsset(LocalFiles.define_it) as String);
    footer = (await dataApi.loadAsset(LocalFiles.footer) as String);
    overview = (await dataApi.loadAsset(LocalFiles.overview) as String);
    return [contact, define_it, footer, overview];
  }

  static Category getMatchingCategory(Criteria criteria) {
    return categories
        .firstWhere((element) => element.id == criteria.category_id);
  }

  static List<Criteria> getMatchingCriteria(Category category) {
    return criteria
        .where((element) => element.category_id == category.id)
        .toList();
  }

  static List<Concept> getMatchingConcepts(Collection collection) {
    return concepts
        .where((element) => element.collection_id == collection.id)
        .toList();
  }

  static Collection getMatchingCollection(Concept concept) {
    return collections
        .firstWhere((element) => element.id == concept.collection_id);
  }

  static Future<CommentList> getMatchingComments(int conceptID) async {
    String url = "https://defintly.knoblich.co/concepts/" + conceptID.toString() + "/comments";
    final response = await http.get(Uri.parse(url));
    var t = response.body.toString();
    final data = json.decode(t);
    return CommentList.fromJson(data);
  }
}

enum Extentions { concepts, collections, criteria, categories }

enum LocalFiles { contact, define_it, footer, overview }
