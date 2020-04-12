# 概要
特定のgitリポジトリに新しいブランチが作成されてpushされたとき、そのブランチ名を含むGKEクラスタを作成するcloudbuild設定ファイル及びスクリプトです。

GithubやCloud Source Repositoryなど、Cloud Buildのトリガーとして利用できるgitリポジトリにpushがあったとき、pushされたブランチ名を含むGKEクラスタを作成します。ただし、すでにそのクラスタが存在する場合は何もしません。

# 設定
## リポジトリを接続
1. Cloud Buildからリポジトリを接続してください。その際、トリガーは「ブランチにpushする」を選択し、ブランチの正規表現は「.*」を設定してください。特定のブランチ名のみを対象にしたい場合は正規表現を編集してください。
## サービスアカウントの編集
1. Cloud Build サービスアカウントに以下のロールをアサインしてください。Kubernetes Engine Cluster 管理者はKubernetes Engine開発者とは異なりますので注意してください。
    * Cloud Build サービスアカウント(デフォルトで付与)
    * Kubernetes Engine Cluster 管理者
    * サービス アカウント ユーザー  
## create_GKE_cluster.shの編集
1. 必要に応じてcreate_CKE_cluster.shを編集してください。現在のスクリプトでは、`us-central1-c`ゾーンに3ノードデプロイする設定になっています。また、デプロイされるクラスタ名は`gke-cluster-<branch名>`です。
## リポジトリをpush
1. リポジトリをpushしてください。GKEクラスタが作成されます。