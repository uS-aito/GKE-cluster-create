# 生じたエラーと対処
* クラスタを作成する権限がないといわれる
  → cloud buildの設定からKubernetes Engine開発者のロールを有効にした → ダメだった
  → サービスアカウントでKubernetes Engine Cluster管理者のロールを有効にした → できた
* 「The user does not have access to service account "default"」
  → サービスアカウントでサービスアカウントの作成権限を足した → ダメだった
  → 設定からサービスアカウントユーザを有効にした → できた
* 「Insufficient regional quota to satisfy request: resource "IN_USE_ADDRESSES": request requires '9.0' and is short '1.0'.」
  → 手元からus-west1にデプロイする分には何も言われないが、us-central1にデプロイすると同じことを言われる
  → cloud buildからus-west1にデプロイすると同じことを言われる。ノードをいくつ作る気だこいつ...
  → Webコンソールからクラスタ作成用のコマンドラインを引っ張ってきたところ通った。具体的な原因究明はまだ。
  → デプロイ先の指定をリージョンで行っていたため、リージョン内の各ゾーンに3つずつノードをデプロイしようとしていた模様
* すでにあるクラスタのブランチにpushするとエラー終了する。デプロイに問題があったのか、単にすでにあったから辞めたのか判断着かない。
  → 正直、今のままだと各ステップでどんなコマンドを実行しようとしたのかはっきりしない。シェルスクリプトを実行させて、必要なechoを仕込んだほうが良いきがする
  → そのようにした