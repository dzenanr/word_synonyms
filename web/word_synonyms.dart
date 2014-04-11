import 'package:word_synonyms/word_synonyms.dart';
import 'package:dartling_app/dartling_app.dart';

main() {
  var repository = new Repository(); 
  WordModels domain = repository.getDomainModels('Word');
  new EntriesTable(domain, 'Synonyms');
}
 
