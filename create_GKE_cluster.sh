#!/bin/bash

CLUSTER_NAME_PREFIX="gke-cluster-"
CLUSTER_CREATE_COMMAND="gcloud container clusters create ${CLUSTER_NAME_PREFIX}$1 --zone=us-central1-c --num-nodes 3"
CLUSTER_EXIST_CHECK_COMMAND="gcloud container clusters describe ${CLUSTER_NAME_PREFIX}$1 --zone=us-central1-c"

bold() {
  echo "$(tput bold)""$*" "$(tput sgr0)";
}

bold ". Checking cluster ${CLUSTER_NAME_PREFIX}$1 exist..."
$CLUSTER_EXIST_CHECK_COMMAND
if [ $? -eq 0 ]; then
    bold "Cluster ${CLUSTER_NAME_PREFIX}$1 already exist."
    exit 0
else
    $CLUSTER_CREATE_COMMAND
fi