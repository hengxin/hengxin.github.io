为了提高可扩展性, 分布式存储系统通常采用数据分区技术
将数据划分成多个分区, 存储到不同的物理节点上。
为了进一步提高容错性与系统性能, 它们又采用数据复制技术
将每个分区的数据以多副本的形式进行存储。
在这种分区复制架构下, 要实现强
Modern online services rely on data stores that replicate their
data across geographically distributed data centers.
Providing strong consistency in such data stores results in high latencies
and makes the system vulnerable to network partitions.
The alternative of relaxing consistency violates crucial correctness properties.
A compromise is to allow multiple consistency levels to coexist
in the data store.
In this paper we present UniStore,
the first fault-tolerant and scalable data store that
combines causal and strong consistency.
The key challenge we address in UniStore
is to maintain liveness despite data center failures:
this could be compromised if a strong transaction
takes a dependency on a causal transaction
that is later lost because of a failure.
UniStore ensures that such situations do not arise
while paying the cost of durability for causal transactions only when necessary.
We evaluate UniStore on Amazon EC2
using both microbenchmarks and a sample application.
Our results show that UniStore effectively and scalably
combines causal and strong consistency.