Substantial research efforts have been devoted to studying the performance optimality problem for distributed database transactions. However, they focus just on optimizing transactional reads, and thus overlook crucial factors, such as the efficiency of writes, which also impact the overall system performance. Motivated by a recent study on Twitter’s workloads showing the prominence of write-heavy workloads in practice, we make a substantial step towards performance-optimal distributed transactions by also aiming to optimize writes, a fundamentally new dimension to this problem. We propose a new design objective and establish impossibility results with respect to the achievable isolation levels. Guided by these results, we present two new transaction algorithms with different isolation guarantees that fulfill this design objective. Our evaluation demonstrates that these algorithms outperform the state of the art.