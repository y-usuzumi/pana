module Pana where

import           Prelude hiding (Word)

type Spelling = String

data PristineWordKind = N  -- nomi, e.g. manga
                      | L  -- lefte, e.g. sive
                      | R  -- righto, e.g. anto
                      | A  -- attrit, e.g. joyit
                      | VL -- advl
                      | VR -- advr
                      | Kj -- Konjuni, e.g. cten
                      deriving Show

data PristineWord k where
  PristineN :: Spelling -> PristineWord N
  PristineL :: Spelling -> PristineWord L
  PristineR :: Spelling -> PristineWord R
  PristineA :: Spelling -> PristineWord A
  PristineVL :: Spelling -> PristineWord VL
  PristineVR :: Spelling -> PristineWord VR
  PristineKj :: Spelling -> PristineWord Kj

deriving instance Show (PristineWord N)
deriving instance Show (PristineWord L)
deriving instance Show (PristineWord R)
deriving instance Show (PristineWord A)
deriving instance Show (PristineWord VL)
deriving instance Show (PristineWord VR)
deriving instance Show (PristineWord Kj)

data ComponentKind = C | S1 | S2 | Attr | AdvL | AdvR | Conj
                   deriving Show

class Conjunctable (a :: ComponentKind)

instance Conjunctable C
instance Conjunctable S1
instance Conjunctable S2
instance Conjunctable Attr
instance Conjunctable AdvL
instance Conjunctable AdvR

data Component k where
  SimpleC :: PristineWord N -> Component C
  SimpleS1 :: PristineWord L -> Component S1
  SimpleS2 :: PristineWord R -> Component S2
  SimpleAttr :: PristineWord A -> Component Attr
  SimpleConj :: PristineWord Kj -> Component Conj
  C'AdvL :: Component C -> Component AdvL
  C'AdvR :: Component C -> Component AdvR
  AttrC :: Component Attr -> Component C -> Component C
  AdvLS1 :: Component AdvL -> Component S1 -> Component S1
  AdvRS2 :: Component AdvR -> Component S2 -> Component S2
  SntQuoteC :: (Show (Sentence k)) => Sentence k -> Component C
  Conjunction :: Conjunctable k => Component Conj -> Component k -> Component k -> Component k

deriving instance Show (Component C)
deriving instance Show (Component S1)
deriving instance Show (Component S2)
deriving instance Show (Component Attr)
deriving instance Show (Component Conj)
deriving instance Show (Component AdvL)
deriving instance Show (Component AdvR)

data SentenceKind = SentenceC | SentenceCS1S2

data Sentence k where
  SntC :: Component C -> Sentence SentenceC
  SntCS1S2 :: Component C -> Component S1 -> Component S2 -> Sentence SentenceCS1S2

deriving instance Show (Sentence SentenceC)
deriving instance Show (Sentence SentenceCS1S2)

printWord :: PristineWord k -> String
printWord (PristineN word)  = word
printWord (PristineL word)  = word
printWord (PristineR word)  = word
printWord (PristineA word)  = word
printWord (PristineVL word) = word
printWord (PristineVR word) = word
printWord (PristineKj word) = word


printComponent :: Component k -> String
printComponent (SimpleC word) = printWord word
printComponent (SimpleS1 word) = printWord word
printComponent (SimpleS2 word) = printWord word
printComponent (SimpleAttr word) = printWord word
printComponent (SimpleConj word) = printWord word
printComponent (C'AdvL c) = c'AdvL c
printComponent (C'AdvR c) = c'AdvR c
printComponent (AttrC attr c) = printComponent attr ++ " " ++ printComponent c
printComponent (AdvLS1 advl s1) = printComponent advl ++ " " ++ printComponent s1
printComponent (AdvRS2 advr s2) = printComponent advr ++ " " ++ printComponent s2
printComponent (SntQuoteC k) = "du " ++ printSentence k ++ " va"
printComponent (Conjunction conj c1 c2) = printComponent c1 ++ " " ++ printComponent conj ++ " " ++ printComponent c2

printSentence :: Sentence k -> String
printSentence (SntC c) = printComponent c
printSentence (SntCS1S2 c s1 s2) = printComponent c ++ " " ++ printComponent s1 ++ " " ++ printComponent s2

c'AdvL :: Component C -> String
c'AdvL (SimpleC (PristineN word)) = init word ++ "cl"
c'AdvL (AttrC attr c)             = printComponent attr ++ " " ++ c'AdvL c
c'AdvL (SntQuoteC s)              = "du " ++ printSentence s ++ " ycl"
c'AdvL (Conjunction conj c1 c2)   = "du " ++ printComponent conj ++ " ycl"

c'AdvR :: Component C -> String
c'AdvR (SimpleC (PristineN word)) = init word ++ "cr"
c'AdvR (AttrC attr c)             = printComponent attr ++ " " ++ c'AdvR c
c'AdvR (SntQuoteC s)              = "du " ++ printSentence s ++ " ycr"
c'AdvR (Conjunction conj c1 c2)   = "du " ++ printComponent conj ++ " ycr"
