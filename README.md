# TPaxosProject

#### TLC参数

- Participant: {p1, p2, p3} 以及 {p1, p2, p3, p4, p5}
- Value: {v1, v2} 以及 {v1, v2, v3, v4}
- Ballot(需要重定义Nat): 1..2以及 1..3
- Quorum(依赖于Participant): {{p1, p2}, {p1, p3}, {p2, p3}} 或者 {{p1, p2, p3}, {p1, p2, p4}, {p1, p2, p5}, {p1, p3, p4}, {p1, p3, p5}, {p1, p4, p5}, {p2, p3, p4}, {p2, p3, p5}, {p2, p4, p5}, {p3, p4, p5}}

#### TLC优化设置

- Participant、Value均设为Symmetric Set
- worker = 10
- head > 40g
- profile: off

#### Note

- 总共需要跑三个module：EagerVoting.tla，TPaxos.tla，TPaxosRefVoting.tla
- EagerVoting: Properties中添加C!Spec，另外，EagerVoting中参数是Acceptor(非Participant)，Value，Quorum
- TPaxos: Invariants中添加Consistency。
- TPaxosRefVoting: Properties中添加V!Spec，另外Temporal formula为SpecR