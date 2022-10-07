import 'package:flutter_application/model/item.dart';
import 'package:flutter_application/model/block.dart';
import 'package:flutter_application/model/query.dart';
import 'package:flutter_application/model/question.dart';

class Service {
  List<Item> items = [];
  List<Query> queries = [];
  List<Question> questions = [];
  List<Block> blocks = [];
  Service() {
    _init();
  }
  _init() {
    _initItems();
    _initQueries();
    _initQuestions();
    _initBlocks();
  }

  _initItems() {
    items.add(Item(1, 'アイテム1', 1));
    items.add(Item(2, 'アイテム2', 1));
    items.add(Item(3, 'アイテム3', 1));
    items.add(Item(4, 'アイテム4', 1));
    items.add(Item(5, 'アイテム5', 2));
    items.add(Item(6, 'アイテム6', 2));
    items.add(Item(7, 'アイテム7', 2));
    items.add(Item(8, 'アイテム8', 3));
    items.add(Item(9, 'アイテム9', 3));
  }

  _initQueries() {
    queries.add(Query(1, 'クエリ1尊敬される尊敬される尊敬される尊敬される尊敬される尊敬される尊敬される', 1, 1));
    queries.add(Query(2, 'クエリ2', 1, 1));
    queries.add(Query(3, 'クエリ3', 0, 1));
    queries.add(Query(4, 'クエリ4', 0, 2));
    queries.add(Query(5, 'クエリ5', 0, 1));
    queries.add(Query(6, 'クエリ6', 0, 1));
  }

  _initQuestions() {
    questions.add(Question(1, '尊敬される。'));
    questions.add(Question(2, '質問2'));
    questions.add(Question(3, '質問3'));
  }

  _initBlocks() {
    blocks.add(Block(1, 'ページ1', questions));
    blocks.add(Block(2, 'ページ2', questions));
  }

  List<Item> getItemsByQid(int qid) {
    List<Item> itemsByQId = items.where((item) => item.qid == qid).toList();
    return itemsByQId;
  }

  List<Query> getQueriesByQid(int qid) {
    List<Query> queriesByQId =
        queries.where((query) => query.qid == qid).toList();
    return queriesByQId;
  }
}
