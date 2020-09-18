module Lib where

import Pana
import Pana.QQ

sentenceILoveYouAndYouLoveMe :: Sentence SentenceC
sentenceILoveYouAndYouLoveMe =
  SntC $ Conjunction (SimpleConj [kj|cten|]) (SntQuoteC iLoveYou) (SntQuoteC youLoveMe)
  where
    iLoveYou = SntCS1S2 (SimpleC [n|mi|]) (SimpleS1 [l|he|]) (AdvRS2 (C'AdvR (SimpleC [n|ta|])) (SimpleS2 [r|yamo|]))
    youLoveMe = SntCS1S2 (SimpleC [n|ta|]) (SimpleS1 [l|he|]) (AdvRS2 (C'AdvR (SimpleC [n|mi|])) (SimpleS2 [r|yamo|]))
