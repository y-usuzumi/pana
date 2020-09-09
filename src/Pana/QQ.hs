module Pana.QQ where

import           Language.Haskell.TH
import           Language.Haskell.TH.Quote
import           Pana

n :: QuasiQuoter
n = QuasiQuoter { quoteExp = qe }
  where qe spelling = [|PristineN spelling|]

l :: QuasiQuoter
l = QuasiQuoter { quoteExp = qe }
  where qe spelling = [|PristineL spelling|]

r :: QuasiQuoter
r = QuasiQuoter { quoteExp = qe }
  where qe spelling = [|PristineR spelling|]

a :: QuasiQuoter
a = QuasiQuoter { quoteExp = qe }
  where qe spelling = [|PristineA spelling|]

kj :: QuasiQuoter
kj = QuasiQuoter { quoteExp = qe }
  where qe spelling = [|PristineKj spelling|]
