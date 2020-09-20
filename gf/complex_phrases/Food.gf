abstract Food = {
  flags startcat = Phrase;

  cat
    Phrase; SimplePhrase; Item; Kind; Quality;

  fun
    Is : Item -> Quality -> SimplePhrase;
    Simple : SimplePhrase -> Phrase;
    ExcusemePhrase : SimplePhrase -> Phrase;
    This,  That : Kind -> Item;
    QKind : Quality -> Kind -> Kind;
    Wine, Cheese, Fish : Kind;
    Very : Quality -> Quality;
    Fresh, Warm, Italian, Expensive, Delicious, Boring : Quality;
    -- exercise
    IsQ : Item -> Quality -> SimplePhrase;
}
