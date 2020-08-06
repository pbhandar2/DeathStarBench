
cd $(dirname $0)/..

NS="social-network"

oc create namespace ${NS}

oc create -f pv.yaml
oc create -f user-mongo-pvc.yaml

for service in *service*.yaml ; do
  oc apply -f $service -n ${NS}
done

cd - >/dev/null
