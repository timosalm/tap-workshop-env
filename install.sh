set -x

ytt template -f resources -f values.yaml --ignore-unknown-comments | kapp deploy -n tap-install -a tap-workshop-env -f- --diff-changes --yes
kubectl delete pod -l deployment=learningcenter-operator -n learningcenter