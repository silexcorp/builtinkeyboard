enum Language {
  EN,
  FR,
  DE,
  AR,
  KAQ,
  QAN,
  KCH,
  QEQ,
  MAM,
  POP,
  POQ,
  TZU,
  ACH,
  IXI,
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
  Language.KAQ: kaqchikelConfig,
  Language.QAN: qanjobalConfig,
  Language.KCH: kicheConfig,
  Language.QEQ: qeqchiConfig,
  Language.MAM: mamConfig,
  Language.POP: poptiConfig,
  Language.POQ: poqConfig,
  Language.TZU: tzutujilConfig,
  Language.ACH: achiConfig,
  Language.IXI: ixilConfig,
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

var kaqchikelConfig = {
  Layout.QWERTYKAQ: <String, String>{
    'layout': "q w e r t y u i o p ? a s tz ' j k l , x ch b' n m .",
    'horizontalSpacing': '6.0',
    'topLength': '10',
    'middleLength': '8',
  }
};
var qanjobalConfig = {
  Layout.QWERTYKAQ: <String, String>{
    'layout': "q w e r t y u i o p a s tz tx xh h j k l , x ch ' b' n m",
    'horizontalSpacing': '6.0',
    'topLength': '10',
    'middleLength': '9',
  }
};
var kicheConfig = {
  Layout.QWERTYKAQ: <String, String>{
    'layout': "q w e r t y u i o p ? a s tz ' j k l , x ch b' n m",
    'horizontalSpacing': '6.0',
    'topLength': '10',
    'middleLength': '8',
  }
};
var qeqchiConfig = {
  Layout.QWERTYKAQ: <String, String>{
    'layout': "q w e r t y u i o p a s tz ' h j k l , x ch b' n m",
    'horizontalSpacing': '6.0',
    'topLength': '10',
    'middleLength': '8',
  }
};
var mamConfig = {
  Layout.QWERTYKAQ: <String, String>{
    'layout': "q w e r t y u i o p a s tz tx ẍ j k ky l , x ch ' b' n m",
    'horizontalSpacing': '6.0',
    'topLength': '10',
    'middleLength': '9',
  }
};
var poptiConfig = {
  Layout.QWERTYKAQ: <String, String>{
    'layout': "q' w e r t y u i o p a s tz tx xh h j k l x ch ' b' n nh m",
    'horizontalSpacing': '6.0',
    'topLength': '10',
    'middleLength': '9',
  }
};
var poqConfig = {
  Layout.QWERTYKAQ: <String, String>{
    'layout': "q w e r t y u i o p a s tz ' h j k l , x ch b' n m",
    'horizontalSpacing': '6.0',
    'topLength': '10',
    'middleLength': '9',
  }
};
var tzutujilConfig = {
  Layout.QWERTYKAQ: <String, String>{
    'layout': "q w e r t y u i o p ? a s tz ' j k l , x ch b' n m .",
    'horizontalSpacing': '6.0',
    'topLength': '10',
    'middleLength': '8',
  }
};
var achiConfig = {
  Layout.QWERTYKAQ: <String, String>{
    'layout': "q w e r t y u i o p ? a s tz ' j k l , x ch b' n m .",
    'horizontalSpacing': '6.0',
    'topLength': '10',
    'middleLength': '8',
  }
};
var ixilConfig = {
  Layout.QWERTYKAQ: <String, String>{
    'layout': "q w e r t y u i o p a s v tz tx ' j k l h x ch b' n m ,",
    'horizontalSpacing': '6.0',
    'topLength': '10',
    'middleLength': '9',
  }
};