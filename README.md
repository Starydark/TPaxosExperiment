## Model Checking TPaxos with TLA+

An experiment of model checking the consensus algorithm TPaxos in paper [PaxosStore@VLDB2017](http://www.vldb.org/pvldb/vol10/p1730-lin.pdf). We introduce a variant of TPaxos, TPaxosAP, and check the consistency of TPaxos and TPaxosAP. Meanwhile we establish the refinement relation from TPaxos to Voting, from TPaxos to EagerVoting(an algorithm equals to Voting) and model check the refinement mapping. The project includes three experiments:

- TPaxos and TPaxosAP satisfies Consistency.
- TPaxos refines Voting, TPaxosAP refines EagerVoting.
- EagerVoting refines Consensus.

### Requirements

- Linux with JDK 8.
- Some [tlaps](http://tla.msr-inria.inria.fr/tlaps/content/Home.html) modules. 

### TLC Parameters

- Participant(Symmetry set): all servers. e.g. {p1, p2, p3} and {p1, p2, p3, p4, p5}
- Value(Symmetry set): all proposal value. e.g. {v1, v2} and {v1, v2, v3, v4}
- Ballot(redefines Nat): ballot numbers. e.g. 1..2 and 1..3
- worker = 10
- heap > 40GB
- profile: off(to increase efficiency)

### Invariants and Properties
- Consistency: Invariant in model checking TPaxos and TPaxosAP satisfying Consistency.
- SpecV = > V!Spec: Properties in model checking refinement mapping.

### How to run

```
# Usage Note: "make" is identical to "make run".
$make
```

