enum Language {
  EN,
  FR,
  DE,
  AR,
  KAQ,
}

enum Layout {
  QWERTY,
  QWERTZ,
  AZERTY,
  ARABIC,
  QWERTYKAQ,
}

var languageConfig = {
  Language.EN: englishConfig,
  Language.FR: frenchConfig,
  Language.DE: germanConfig,
  Language.AR: arabicConfig,
  Language.KAQ: kaqConfig,
};

// Languages Configurations

var englishConfig = {
  Layout.QWERTY: <String, String>{
    'layout': 'qwertyuiopasdfghjklzxcvbnm',
    'horizontalSpacing': '6.0',
    'topLength': '10',
    'middleLength': '9',
  },
  Layout.QWERTZ: <String, String>{
    'layout': 'qwertzuiopasdfghjklyxcvbnm',
    'horizontalSpacing': '6.0',
    'topLength': '10',
    'middleLength': '9',
  },
};

var frenchConfig = {
  Layout.QWERTY: <String, String>{
    'layout': 'qwertyuiopasdfghjklzxcvbnm',
    'horizontalSpacing': '6.0',
    'topLength': '10',
    'middleLength': '9',
  },
  Layout.AZERTY: <String, String>{
    'layout': 'azertyuiopqsdfghjklmwxcvbn',
    'horizontalSpacing': '6.0',
    'topLength': '10',
    'middleLength': '9',
  },
};

var germanConfig = {
  Layout.QWERTY: <String, String>{
    'layout': 'qwertyuiopüasdfghjklöäzxcvbnmß',
    'horizontalSpacing': '2.5',
    'topLength': '11',
    'middleLength': '11',
  },
  Layout.QWERTZ: <String, String>{
    'layout': 'qwertzuiopüasdfghjklöäyxcvbnmß',
    'horizontalSpacing': '2.5',
    'topLength': '11',
    'middleLength': '11',
  },
};

var arabicConfig = {
  Layout.ARABIC: <String, String>{
    'layout': 'ثةورزدذطظكمنتالبيسشجحخهعغفقصض',
    'horizontalSpacing': '2.8',
    'topLength': '11',
    'middleLength': '10',
  },
};

var kaqConfig = {
  Layout.QWERTYKAQ: <String, String>{
    'layout': "q w e r t y u i o p ? a s tz ' j k l , x ch b' n m .",
    'horizontalSpacing': '6.0',
    'topLength': '10',
    'middleLength': '9',
  }
};

var kaqConfigDefault = {
  Layout.QWERTYKAQ: <String, String>{
    'layout': "q w e r t y u i o p ? a s tz ' j k l , x ch b' n m",
    'horizontalSpacing': '6.0', // space between keys
    'topLength': '10', // number of keys
    'middleLength': '9', // number of keys
  }
};