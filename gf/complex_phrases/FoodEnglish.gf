concrete FoodEnglish of Food = {
  lincat
    Phrase, SimplePhrase, Item, Kind, Quality = {s : Str};

  lin
    Is item quality = {s = item.s ++ "is" ++ quality.s};
    Simple p = p;
    ExcusemePhrase p = {s = "excuse me but" ++ p.s};
    This kind = {s = "this" ++ kind.s};
    That kind = {s = "that" ++ kind.s};
    QKind quality kind = {s = quality.s ++ kind.s};
    Wine = {s = "wine"};
    Cheese = {s = "cheese"};
    Fish = {s = "fish"};
    Very quality = {s = "very" ++ quality.s};
    Fresh = {s = "fresh"};
    Warm = {s = "warm"};
    Italian = {s = "Italian"};
    Expensive = {s = "expensive"};
    Delicious = {s = "delicious" | "exquisit" | "tasty"};
    Boring = {s = "boring"};

    -- exercise
    IsQ item quality = {s =  "is" ++ item.s ++ quality.s};
}
