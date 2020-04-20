#!/bin/bash

# install jmeter 
../helm install jmeter -f config.yaml stable/distributed-jmeter -n az-bmt-general

# == apply wordpress, hpa
oc apply -k ../wordpress/kustomization/
oc apply -f ../wordpress/mysql.yaml
oc apply -f ../wordpress/wordpress.yaml
