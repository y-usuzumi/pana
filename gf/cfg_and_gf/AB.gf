abstract AB = {
  flags startcat = Phrase;

  cat
    Phrase; Chars; Char;

  fun
    A, B : Char;
    Singleton : Char -> Chars;
    Append : Char -> Chars -> Chars;
    Double : Chars -> Phrase;
}
