part of word_synonyms; 
 
// lib/gen/word/synonyms/words.dart 
 
abstract class WordGen extends ConceptEntity<Word> { 
 
  WordGen(Concept concept) : super.of(concept) { 
    Concept synonymConcept = concept.model.concepts.singleWhereCode("Synonym"); 
    setChild("synonyms", new Synonyms(synonymConcept)); 
  } 
 
  WordGen.withId(Concept concept, String name) : super.of(concept) { 
    setAttribute("name", name); 
    Concept synonymConcept = concept.model.concepts.singleWhereCode("Synonym"); 
    setChild("synonyms", new Synonyms(synonymConcept)); 
  } 
 
  String get name => getAttribute("name"); 
  set name(String a) => setAttribute("name", a); 
  
  Synonyms get synonyms => getChild("synonyms"); 
  
  Word newEntity() => new Word(concept); 
  Words newEntities() => new Words(concept); 
  
  int nameCompareTo(Word other) { 
    return name.compareTo(other.name); 
  } 
 
} 
 
abstract class WordsGen extends Entities<Word> { 
 
  WordsGen(Concept concept) : super.of(concept); 
 
  Words newEntities() => new Words(concept); 
  Word newEntity() => new Word(concept); 
  
} 
 
