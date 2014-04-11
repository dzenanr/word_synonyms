part of word_synonyms; 
 
// lib/gen/word/synonyms/synonyms.dart 
 
abstract class SynonymGen extends ConceptEntity<Synonym> { 
 
  SynonymGen(Concept concept) : super.of(concept); 
 
  SynonymGen.withId(Concept concept, Word word, String name) : super.of(concept) { 
    setParent("word", word); 
    setAttribute("name", name); 
  } 
 
  Reference get wordReference => getReference("word"); 
  set wordReference(Reference reference) => setReference("word", reference); 
  
  Word get word => getParent("word"); 
  set word(Word p) => setParent("word", p); 
  
  String get name => getAttribute("name"); 
  set name(String a) => setAttribute("name", a); 
  
  Synonym newEntity() => new Synonym(concept); 
  Synonyms newEntities() => new Synonyms(concept); 
  
  int nameCompareTo(Synonym other) { 
    return name.compareTo(other.name); 
  } 
 
} 
 
abstract class SynonymsGen extends Entities<Synonym> { 
 
  SynonymsGen(Concept concept) : super.of(concept); 
 
  Synonyms newEntities() => new Synonyms(concept); 
  Synonym newEntity() => new Synonym(concept); 
  
} 
 
