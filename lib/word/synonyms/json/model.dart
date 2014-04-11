part of word_synonyms;

// http://www.json.org/
// http://jsonformatter.curiousconcept.com/

// lib/word/synonyms/json/model.dart

var wordSynonymsModelJson = r'''
{
    "width":990,
    "height":580,
    "boxes":[
        {
            "name":"Word",
            "entry":true,
            "x":90,
            "y":62,
            "width":60,
            "height":60,
            "items":[
                {
                    "sequence":10,
                    "name":"name",
                    "category":"identifier",
                    "type":"String",
                    "init":"",
                    "essential":true,
                    "sensitive":false
                }
            ]
        },
        {
            "name":"Synonym",
            "entry":false,
            "x":308,
            "y":161,
            "width":60,
            "height":60,
            "items":[
                {
                    "sequence":10,
                    "name":"name",
                    "category":"identifier",
                    "type":"String",
                    "init":"",
                    "essential":true,
                    "sensitive":false
                }
            ]
        }
    ],
    "lines":[
        {
            "box1Name":"Word",
            "box2Name":"Synonym",
            "category":"relationship",
            "internal":true,
            "box1box2Name":"synonyms",
            "box1box2Min":"0",
            "box1box2Max":"N",
            "box1box2Id":false,
            "box2box1Name":"word",
            "box2box1Min":"1",
            "box2box1Max":"1",
            "box2box1Id":true
        }
    ]
}
''';
  