part of word_synonyms; 
 
// lib/repository.dart 
 
class Repository extends Repo { 
 
  static const REPOSITORY = "Repository"; 
 
  Repository([String code=REPOSITORY]) : super(code) { 
    var domain = new Domain("Word"); 
    domains.add(domain); 
    add(new WordDomain(domain)); 
 
  } 
 
} 
 
