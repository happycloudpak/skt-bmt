#!/bin/bash 

# basic 
oc apply -f cronjob.yaml 
oc apply -f daemonset.yaml
oc apply -f deploy-mvp-sample-front.yaml
oc apply -f hpa.yaml
oc apply -f job.yaml
oc apply -f guestbook/guestbook.yaml
oc apply -f guestbook/redis.yaml  
oc apply -f serverless/demo-backend.yaml  
oc apply -f serverless/demo-frontend.yaml 
oc apply -f wordpress/mysql.yaml
oc apply -f wordpress/wordpress.yaml 

echo "############# Finished to install ! ##############"

