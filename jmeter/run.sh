#!/bin/bash
# === set below parameters ========
export MASTER_POD="jmeter-distributed-jmeter-master-54c678bf88-92lnp"
# To get: $ kubectl describe pod -l app.kubernetes.io/component=server | grep IP:
export SLAVE_IP="10.129.5.20:1099,10.128.3.0:1099"
export JMX_FILE="./wordpress4hpa.jmx"
export OUTPUT_FILE="jmeter.jtl"
# =================================

export WDIR=`oc exec -it ${MASTER_POD} /bin/pwd | tr -d '\r'`
mkdir -p results

NAME=$(basename ${JMX_FILE})
NAME="${NAME%.*}"
eval "oc exec ${MASTER_POD} -- mkdir -p $WDIR/scripts"
eval "oc cp ${JMX_FILE} ${MASTER_POD}:$WDIR/scripts"
eval "oc exec -it ${MASTER_POD} -- mkdir -p ${NAME}"
eval "oc exec -it ${MASTER_POD} -- jmeter -n -t ./scripts/${NAME}.jmx -e -l ${NAME}/${OUTPUT_FILE} -R ${SLAVE_IP}"
eval "oc cp ${MASTER_POD}:$WDIR/$NAME results/"
eval "oc exec -it ${MASTER_POD} -- rm -rf ${NAME}"

