------------------------ MODULE TPaxosWithVotes ---------------------------
EXTENDS TPaxos
VARIABLE votes \*votes[q]: the set of votes cast by q \in Participant
varsV == <<vars, votes>>
--------------------------------------------------------------------------
InitV == 
    /\ Init 
    /\ votes = [q \in Participant |-> {}]

TypeOKV == 
    /\ votes \in [Participant -> SUBSET (Ballot \X Value)]   
    /\ TypeOK      
--------------------------------------------------------------------------   
PrepareV(p, b) == 
    /\ Prepare(p, b)
    /\ votes' = votes
           
AcceptV(p, b, v) == 
    /\ Accept(p, b, v)
    /\ votes' = [votes EXCEPT ![p] = @ \cup {<<b, v>>}]\*collecting proposal <<b,v>>
                    
OnMessageV(q) == 
    /\ OnMessage(q)
    /\ IF state'[q][q].maxVBal # state[q][q].maxVBal \*accept
         THEN votes' = [votes EXCEPT ![q] = @ \cup  \*collecting proposal
                                {<<state'[q][q].maxVBal, state'[q][q].maxVVal>>}]
         ELSE UNCHANGED votes
                        
NextV == \E p \in Participant : 
                \/ OnMessageV(p)
                \/ \E b \in Ballot : \/ PrepareV(p, b)
                                     \/ \E v \in Value : AcceptV(p, b, v)
SpecV == InitV /\ [][NextV]_varsV
---------------------------------------------------------------------------
maxBal == [p \in Participant |-> state[p][p].maxBal]
V == INSTANCE Voting WITH Acceptor <- Participant 
                               (*votes <- votes, maxBal <- maxBal*)
THEOREM SpecR => V!Spec

=============================================================================
\* Modification History
\* Last modified Sun Sep 08 21:35:31 CST 2019 by pure_
\* Created Tue Aug 06 20:46:18 CST 2019 by pure_
