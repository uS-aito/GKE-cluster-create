# Notification
This readme was machine translated. The source readme file is readme_jp.md.

# Overview
A cloudbuild configuration file and script files that creates a GKE cluster containing the branch name when a new branch is created and pushed in a particular git repository.

When there is a push in a git repository that can be used as a trigger for Cloud Build, such as Github or Cloud Source Repository, create a GKE cluster containing the pushed branch name. However, if the cluster already exists, do nothing.

# Setting
## Connect repository
1. Connect the repository from Cloud Build. At that time, select "push to branch" for the trigger and set ".*" for the regular expression of the branch. Edit the regular expression if you want to target only specific branch names.
## Edit service account
1. Assign the following roles to the Cloud Build service account. Note that Kubernetes Engine Cluster administrators are different from Kubernetes Engine developers.
    * Cloud Build service account (granted by default)
    * Kubernetes Engine Cluster Administrator
    * Service account user
## Edit create_GKE_cluster.sh
1. Edit create_CKE_cluster.sh as needed. The current script is configured to deploy three nodes in the `us-central1-c` zone. The cluster name to be deployed is `gke-cluster- <branch name>`.
## Push repository
1. Push the repository. A GKE cluster is created.