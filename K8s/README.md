Kubernetes resource manifest (appliable with `kubectl apply -f`) with next constraints:
- Deployment scalable with one pod per node (like DaemonSet)
- Pods executes provided script and then wait till termination
- Script mounted using ConfigMap
- Script could be modified
<<<<<<< HEAD

-----------------------------------

=======
-----------------------------------
>>>>>>> a16481a4e168f6fed37d9b0298d500954db10f8e
OPTIONAL POINT:
- Container runs in unprivileged mode
- Rewrite config for monitoring host network (withContainerNet and withOut)
