 
// test/word/synonyms/word_synonyms_word_test.dart 
 
import "package:unittest/unittest.dart"; 
import "package:dartling/dartling.dart"; 
import "package:word_synonyms/word_synonyms.dart"; 
 
testWordSynonymsWords( 
    WordDomain wordDomain, SynonymsModel synonymsModel, Words words) { 
  DomainSession session; 
  group("Testing Word.Synonyms.Word", () { 
    session = wordDomain.newSession();  
    expect(synonymsModel.isEmpty, isTrue); 
    setUp(() { 
      synonymsModel.init(); 
    }); 
    tearDown(() { 
      synonymsModel.clear(); 
    }); 
 
    test("Not empty model", () { 
      expect(synonymsModel.isEmpty, isFalse); 
      expect(words.isEmpty, isFalse); 
    }); 
 
    test("Empty model", () { 
      synonymsModel.clear(); 
      expect(synonymsModel.isEmpty, isTrue); 
      expect(words.isEmpty, isTrue); 
      expect(words.errors.isEmpty, isTrue); 
    }); 
 
    test("From model to JSON", () { 
      var json = synonymsModel.toJson(); 
      expect(json, isNotNull); 
 
      print(json); 
      //synonymsModel.displayJson(); 
      //synonymsModel.display(); 
    }); 
 
    test("From JSON to model", () { 
      var json = synonymsModel.toJson(); 
      synonymsModel.clear(); 
      expect(synonymsModel.isEmpty, isTrue); 
      synonymsModel.fromJson(json); 
      expect(synonymsModel.isEmpty, isFalse); 
 
      synonymsModel.display(); 
    }); 
 
    test("From model entry to JSON", () { 
      var json = synonymsModel.fromEntryToJson("Word"); 
      expect(json, isNotNull); 
 
      print(json); 
      //synonymsModel.displayEntryJson("Word"); 
      //synonymsModel.displayJson(); 
      //synonymsModel.display(); 
    }); 
 
    test("From JSON to model entry", () { 
      var json = synonymsModel.fromEntryToJson("Word"); 
      words.clear(); 
      expect(words.isEmpty, isTrue); 
      synonymsModel.fromJsonToEntry(json); 
      expect(words.isEmpty, isFalse); 
 
      words.display(title: "From JSON to model entry"); 
    }); 
 
    test("Add word required error", () { 
      // no required attribute that is not id 
    }); 
 
    test("Add word unique error", () { 
      var wordConcept = words.concept; 
      var wordCount = words.length; 
      var word = new Word(wordConcept); 
      var randomWord = words.random(); 
      word.name = randomWord.name; 
      var added = words.add(word); 
      expect(added, isFalse); 
      expect(words.length, equals(wordCount)); 
      expect(words.errors.length, greaterThan(0)); 
 
      words.errors.display(title: "Add word unique error"); 
    }); 
 
    test("Not found word by new oid", () { 
      var dartlingOid = new Oid.ts(1345648254063); 
      var word = words.singleWhereOid(dartlingOid); 
      expect(word, isNull); 
    }); 
 
    test("Find word by oid", () { 
      var randomWord = words.random(); 
      var word = words.singleWhereOid(randomWord.oid); 
      expect(word, isNotNull); 
      expect(word, equals(randomWord)); 
    }); 
 
    test("Find word by attribute id", () { 
      var randomWord = words.random(); 
      var word = 
          words.singleWhereAttributeId("name", randomWord.name); 
      expect(word, isNotNull); 
      expect(word.name, equals(randomWord.name)); 
    }); 
 
    test("Find word by required attribute", () { 
      // no required attribute that is not id 
    }); 
 
    test("Find word by attribute", () { 
      // no attribute that is not required 
    }); 
 
    test("Select words by attribute", () { 
      // no attribute that is not required 
    }); 
 
    test("Select words by required attribute", () { 
      // no required attribute that is not id 
    }); 
 
    test("Select words by attribute, then add", () { 
      // no attribute that is not id 
    }); 
 
    test("Select words by attribute, then remove", () { 
      // no attribute that is not id 
    }); 
 
    test("Sort words", () { 
      words.sort(); 
 
      //words.display(title: "Sort words"); 
    }); 
 
    test("Order words", () { 
      var orderedWords = words.order(); 
      expect(orderedWords.isEmpty, isFalse); 
      expect(orderedWords.length, equals(words.length)); 
      expect(orderedWords.source.isEmpty, isFalse); 
      expect(orderedWords.source.length, equals(words.length)); 
      expect(orderedWords, isNot(same(words))); 
 
      //orderedWords.display(title: "Order words"); 
    }); 
 
    test("Copy words", () { 
      var copiedWords = words.copy(); 
      expect(copiedWords.isEmpty, isFalse); 
      expect(copiedWords.length, equals(words.length)); 
      expect(copiedWords, isNot(same(words))); 
      copiedWords.forEach((e) => 
        expect(e, equals(words.singleWhereOid(e.oid)))); 
      copiedWords.forEach((e) => 
        expect(e, isNot(same(words.singleWhereId(e.id))))); 
 
      //copiedWords.display(title: "Copy words"); 
    }); 
 
    test("True for every word", () { 
      // no required attribute that is not id 
    }); 
 
    test("Random word", () { 
      var word1 = words.random(); 
      expect(word1, isNotNull); 
      var word2 = words.random(); 
      expect(word2, isNotNull); 
 
      //word1.display(prefix: "random1"); 
      //word2.display(prefix: "random2"); 
    }); 
 
    test("Update word id with try", () { 
      var randomWord = words.random(); 
      var beforeUpdate = randomWord.name; 
      try { 
        randomWord.name = 'algorithm'; 
      } on UpdateError catch (e) { 
        expect(randomWord.name, equals(beforeUpdate)); 
      } 
    }); 
 
    test("Update word id without try", () { 
      var randomWord = words.random(); 
      var beforeUpdateValue = randomWord.name; 
      expect(() => randomWord.name = 'sin', throws); 
      expect(randomWord.name, equals(beforeUpdateValue)); 
    }); 
 
    test("Update word id with success", () { 
      var randomWord = words.random(); 
      var afterUpdateEntity = randomWord.copy(); 
      var attribute = randomWord.concept.attributes.singleWhereCode("name"); 
      expect(attribute.update, isFalse); 
      attribute.update = true; 
      afterUpdateEntity.name = 'offence'; 
      expect(afterUpdateEntity.name, equals('offence')); 
      attribute.update = false; 
      var updated = words.update(randomWord, afterUpdateEntity); 
      expect(updated, isTrue); 
 
      var entity = words.singleWhereAttributeId("name", 'offence'); 
      expect(entity, isNotNull); 
      expect(entity.name, equals('offence')); 
 
      //words.display("After update word id"); 
    }); 
 
    test("Update word non id attribute with failure", () { 
      // no attribute that is not id 
    }); 
 
    test("Copy Equality", () { 
      var randomWord = words.random(); 
      randomWord.display(prefix:"before copy: "); 
      var randomWordCopy = randomWord.copy(); 
      randomWordCopy.display(prefix:"after copy: "); 
      expect(randomWord, equals(randomWordCopy)); 
      expect(randomWord.oid, equals(randomWordCopy.oid)); 
      expect(randomWord.code, equals(randomWordCopy.code)); 
      expect(randomWord.name, equals(randomWordCopy.name)); 
 
      expect(randomWord.id, isNotNull); 
      expect(randomWordCopy.id, isNotNull); 
      expect(randomWord.id, equals(randomWordCopy.id)); 
 
      var idsEqual = false; 
      if (randomWord.id == randomWordCopy.id) { 
        idsEqual = true; 
      } 
      expect(idsEqual, isTrue); 
 
      idsEqual = false; 
      if (randomWord.id.equals(randomWordCopy.id)) { 
        idsEqual = true; 
      } 
      expect(idsEqual, isTrue); 
    }); 
 
    test("New word action undo and redo", () { 
      var wordConcept = words.concept; 
      var wordCount = words.length; 
          var word = new Word(words.concept); 
      word.name = 'electronic'; 
      words.add(word); 
      expect(words.length, equals(++wordCount)); 
      words.remove(word); 
      expect(words.length, equals(--wordCount)); 
 
      var action = new AddAction(session, words, word); 
      action.doit(); 
      expect(words.length, equals(++wordCount)); 
 
      action.undo(); 
      expect(words.length, equals(--wordCount)); 
 
      action.redo(); 
      expect(words.length, equals(++wordCount)); 
    }); 
 
    test("New word session undo and redo", () { 
      var wordConcept = words.concept; 
      var wordCount = words.length; 
          var word = new Word(words.concept); 
      word.name = 'resolution'; 
      words.add(word); 
      expect(words.length, equals(++wordCount)); 
      words.remove(word); 
      expect(words.length, equals(--wordCount)); 
 
      var action = new AddAction(session, words, word); 
      action.doit(); 
      expect(words.length, equals(++wordCount)); 
 
      session.past.undo(); 
      expect(words.length, equals(--wordCount)); 
 
      session.past.redo(); 
      expect(words.length, equals(++wordCount)); 
    }); 
 
    test("Word update undo and redo", () { 
      // no attribute that is not id 
    }); 
 
    test("Word action with multiple undos and redos", () { 
      var wordCount = words.length; 
      var word1 = words.random(); 
 
      var action1 = new RemoveAction(session, words, word1); 
      action1.doit(); 
      expect(words.length, equals(--wordCount)); 
 
      var word2 = words.random(); 
 
      var action2 = new RemoveAction(session, words, word2); 
      action2.doit(); 
      expect(words.length, equals(--wordCount)); 
 
      //session.past.display(); 
 
      session.past.undo(); 
      expect(words.length, equals(++wordCount)); 
 
      session.past.undo(); 
      expect(words.length, equals(++wordCount)); 
 
      //session.past.display(); 
 
      session.past.redo(); 
      expect(words.length, equals(--wordCount)); 
 
      session.past.redo(); 
      expect(words.length, equals(--wordCount)); 
 
      //session.past.display(); 
    }); 
 
    test("Transaction undo and redo", () { 
      var wordCount = words.length; 
      var word1 = words.random(); 
      var word2 = words.random(); 
      while (word1 == word2) { 
        word2 = words.random();  
      } 
      var action1 = new RemoveAction(session, words, word1); 
      var action2 = new RemoveAction(session, words, word2); 
 
      var transaction = new Transaction("two removes on words", session); 
      transaction.add(action1); 
      transaction.add(action2); 
      transaction.doit(); 
      wordCount = wordCount - 2; 
      expect(words.length, equals(wordCount)); 
 
      words.display(title:"Transaction Done"); 
 
      session.past.undo(); 
      wordCount = wordCount + 2; 
      expect(words.length, equals(wordCount)); 
 
      words.display(title:"Transaction Undone"); 
 
      session.past.redo(); 
      wordCount = wordCount - 2; 
      expect(words.length, equals(wordCount)); 
 
      words.display(title:"Transaction Redone"); 
    }); 
 
    test("Transaction with one action error", () { 
      var wordCount = words.length; 
      var word1 = words.random(); 
      var word2 = word1; 
      var action1 = new RemoveAction(session, words, word1); 
      var action2 = new RemoveAction(session, words, word2); 
 
      var transaction = new Transaction( 
        "two removes on words, with an error on the second", session); 
      transaction.add(action1); 
      transaction.add(action2); 
      var done = transaction.doit(); 
      expect(done, isFalse); 
      expect(words.length, equals(wordCount)); 
 
      //words.display(title:"Transaction with an error"); 
    }); 
 
    test("Reactions to word actions", () { 
      var wordConcept = words.concept; 
      var wordCount = words.length; 
 
      var reaction = new WordReaction(); 
      expect(reaction, isNotNull); 
 
      wordDomain.startActionReaction(reaction); 
          var word = new Word(words.concept); 
      word.name = 'smog'; 
      words.add(word); 
      expect(words.length, equals(++wordCount)); 
      words.remove(word); 
      expect(words.length, equals(--wordCount)); 
 
      var session = wordDomain.newSession(); 
      var addAction = new AddAction(session, words, word); 
      addAction.doit(); 
      expect(words.length, equals(++wordCount)); 
      expect(reaction.reactedOnAdd, isTrue); 
 
      // no attribute that is not id 
    }); 
 
  }); 
} 
 
class WordReaction implements ActionReactionApi { 
  bool reactedOnAdd    = false; 
  bool reactedOnUpdate = false; 
 
  react(BasicAction action) { 
    if (action is EntitiesAction) { 
      reactedOnAdd = true; 
    } else if (action is EntityAction) { 
      reactedOnUpdate = true; 
    } 
  } 
} 
 
void main() { 
  var repository = new Repository(); 
  var wordDomain = repository.getDomainModels("Word");   
  assert(wordDomain != null); 
  var synonymsModel = wordDomain.getModelEntries("Synonyms");  
  assert(synonymsModel != null); 
  var words = synonymsModel.words; 
  testWordSynonymsWords(wordDomain, synonymsModel, words); 
} 
 
