Kubernetes resource manifest (appliable with `kubectl apply -f`) with next constraints:
- Deployment scalable with one pod per node (like DaemonSet)
- Pods executes provided script and then wait till termination
- Script mounted using ConfigMap
- Script could be modified

-----------------------------------

OPTIONAL POINT:
- Container runs in unprivileged mode
- Rewrite config for monitoring host network (withContainerNet and withOut)
