----------------------- MODULE EagerVotingWithChosen -----------------------
EXTENDS EagerVoting
----------------------------------------------------------------------------
ChosenAt(b, v) == 
    \E Q \in Quorum : \A a \in Q : VotedFor(a, b, v)

chosen == {v \in Value : \E b \in Ballot : ChosenAt(b, v)}

Consistency == chosen = {} \/ \E v \in Value : chosen = {v} \* Cardinality(chosen) <= 1

C == INSTANCE Consensus \* WITH Acceptor <- Acceptor, chosen <- chosen 

THEOREM Refinement == Spec => C!Spec
=============================================================================
\* Modification History
\* Last modified Sun Sep 08 22:00:19 CST 2019 by pure_
\* Created Sun Sep 08 21:56:04 CST 2019 by pure_
