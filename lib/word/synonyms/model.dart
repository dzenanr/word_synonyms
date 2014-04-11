 
part of word_synonyms; 
 
// lib/word/synonyms/model.dart 
 
class SynonymsModel extends SynonymsEntries { 
 
  SynonymsModel(Model model) : super(model); 
 
  fromJsonToWordEntry() { 
    fromJsonToEntry(wordSynonymsWordEntry); 
  } 
 
  fromJsonToModel() { 
    fromJson(wordSynonymsModel); 
  } 
 
  init() { 
    initWords(); 
  } 
 
  initWords() { 
    var word1 = new Word(words.concept); 
      word1.name = 'hall'; 
      words.add(word1); 
 
    var word1synonyms1 = new Synonym(word1.synonyms.concept); 
      word1synonyms1.name = 'computer'; 
    word1synonyms1.word = word1; 
    word1.synonyms.add(word1synonyms1); 
 
    var word1synonyms2 = new Synonym(word1.synonyms.concept); 
      word1synonyms2.name = 'enquiry'; 
    word1synonyms2.word = word1; 
    word1.synonyms.add(word1synonyms2); 
 
    var word2 = new Word(words.concept); 
      word2.name = 'agreement'; 
      words.add(word2); 
 
    var word2synonyms1 = new Synonym(word2.synonyms.concept); 
      word2synonyms1.name = 'fascination'; 
    word2synonyms1.word = word2; 
    word2.synonyms.add(word2synonyms1); 
 
    var word2synonyms2 = new Synonym(word2.synonyms.concept); 
      word2synonyms2.name = 'center'; 
    word2synonyms2.word = word2; 
    word2.synonyms.add(word2synonyms2); 
 
    var word3 = new Word(words.concept); 
      word3.name = 'corner'; 
      words.add(word3); 
 
    var word3synonyms1 = new Synonym(word3.synonyms.concept); 
      word3synonyms1.name = 'entertainment'; 
    word3synonyms1.word = word3; 
    word3.synonyms.add(word3synonyms1); 
 
    var word3synonyms2 = new Synonym(word3.synonyms.concept); 
      word3synonyms2.name = 'time'; 
    word3synonyms2.word = word3; 
    word3.synonyms.add(word3synonyms2); 
 
  } 
 
  // added after code gen - begin 
 
  // added after code gen - end 
 
} 
 
