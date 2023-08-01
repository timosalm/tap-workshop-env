#!/bin/bash
set -x
set +e

kubectl annotate namespace ${SESSION_NAMESPACE} secretgen.carvel.dev/excluded-from-wildcard-matching-
kubectl label namespaces ${SESSION_NAMESPACE} apps.tanzu.vmware.com/tap-ns=""
kubectl patch serviceaccount default -p '{"secrets": [{"name": "registry-credentials"}], "imagePullSecrets": [{"name": "registry-credentials"}]}'