#!/bin/bash 

# basic 
oc delete -f cronjob.yaml 
oc delete -f daemonset.yaml
oc delete -f deploy-mvp-sample-front.yaml
oc delete -f hpa.yaml
oc delete -f job.yaml
oc delete -f guestbook/guestbook.yaml
oc delete -f guestbook/redis.yaml  
oc delete -f serverless/demo-backend.yaml  
oc delete -f serverless/demo-frontend.yaml 
oc delete -f wordpress/mysql.yaml
oc delete -f wordpress/wordpress.yaml 

echo "############# Finished to clearup ! ##############"

