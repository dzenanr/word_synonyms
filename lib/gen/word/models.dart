part of word_synonyms; 
 
// lib/gen/word/models.dart 
 
class WordModels extends DomainModels { 
 
  WordModels(Domain domain) : super(domain) { 
    // fromJsonToModel function from dartling/lib/domain/model/transfer.json.dart 
 
    Model model = fromJsonToModel(wordSynonymsModelJson, domain, "Synonyms"); 
    SynonymsModel synonymsModel = new SynonymsModel(model); 
    add(synonymsModel); 
 
  } 
 
} 
 
