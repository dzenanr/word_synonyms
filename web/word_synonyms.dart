import 'package:word_synonyms/word_synonyms.dart';
import 'package:word_synonyms/wc/domain_model.dart';

main() {
  var repository = new Repository(); 
  WordModels domain = repository.getDomainModels('Word');
  new EntriesTable(domain);
}
 
