part of word_synonyms; 
 
// lib/gen/word/synonyms/entries.dart 
 
class SynonymsEntries extends ModelEntries { 
 
  SynonymsEntries(Model model) : super(model); 
 
  Map<String, Entities> newEntries() { 
    var entries = new Map<String, Entities>(); 
    var concept; 
    concept = model.concepts.singleWhereCode("Word"); 
    entries["Word"] = new Words(concept); 
    return entries; 
  } 
 
  Entities newEntities(String conceptCode) { 
    var concept = model.concepts.singleWhereCode(conceptCode); 
    if (concept == null) { 
      throw new ConceptError("${conceptCode} concept does not exist.") ; 
    } 
    if (concept.code == "Word") { 
      return new Words(concept); 
    } 
    if (concept.code == "Synonym") { 
      return new Synonyms(concept); 
    } 
    return null; 
  } 
 
  ConceptEntity newEntity(String conceptCode) { 
    var concept = model.concepts.singleWhereCode(conceptCode); 
    if (concept == null) { 
      throw new ConceptError("${conceptCode} concept does not exist.") ; 
    } 
    if (concept.code == "Word") { 
      return new Word(concept); 
    } 
    if (concept.code == "Synonym") { 
      return new Synonym(concept); 
    } 
    return null; 
  } 
 
  Words get words => getEntry("Word"); 
 
} 
 
