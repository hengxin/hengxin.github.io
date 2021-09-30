Causal consistency is a widely used weak consistency model
and there are plenty of research prototypes and industrial deployments of
causally consistent distributed systems. However, none of them consider
Byzantine faults, except Byz-RCM proposed by Tseng et al. Byz-RCM
achieves causal consistency in the client-server model with 3f + 1 servers
where up to f servers may suffer Byzantine faults, but assumes that
clients are non-Byzantine. In this work, we present Byz-Gentlerain, the
first causal consistency protocol which tolerates up to f Byzantine servers
among 3f + 1 servers in each partition and any number of Byzantine clients.
Byz-GentleRain is inspired by the stabilization mechanism of
GentleRain for causal consistency. To prevent causal violations due to
Byzantine faults, Byz-GentleRain relies on PBFT to reach agreement
on a sequence of global stable times and updates among servers,
and only updates with timestamps less than or equal to such common global
stable times are visible to clients. Byz-GentleRain achieves Byz-CC, the
causal consistency variant in the presence of Byzantine faults.
All reads and updates complete in one round-trip. The preliminary experiments
show that Byz-GentleRain is efficient on typical workloads.