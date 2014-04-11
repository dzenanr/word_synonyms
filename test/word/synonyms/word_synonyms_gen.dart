 
// test/word/synonyms/word_synonyms_gen.dart 
 
import "package:word_synonyms/word_synonyms.dart"; 
 
genCode(Repository repository) { 
  repository.gen("word_synonyms"); 
} 
 
initData(Repository repository) { 
   var wordDomain = repository.getDomainModels("Word"); 
   var synonymsModel = wordDomain.getModelEntries("Synonyms"); 
   synonymsModel.init(); 
   //synonymsModel.display(); 
} 
 
void main() { 
  var repository = new Repository(); 
  genCode(repository); 
  //initData(repository); 
} 
 
