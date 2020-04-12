#!/bin/bash

CLUSTER_NAME_PREFIX="gke-cluster-"
CLUSTER_CREATE_COMMAND="gcloud container clusters create ${CLUSTER_NAME_PREFIX}$1 --zone=us-central1-c --num-nodes 3"
CLUSTER_EXIST_CHECK_COMMAND="gcloud container clusters describe ${CLUSTER_NAME_PREFIX}$1"

$CLUSTER_EXIST_CHECK_COMMAND
if [ $? -eq 0 ]; then
    $CLUSTER_CREATE_COMMAND
else
    echo "Cluster ${CLUSTER_NAME_PREFIX}$1 already exist."
    exit 0
fi