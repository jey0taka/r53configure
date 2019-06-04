# これは何？

Gitを使って、Route53を管理する仕組み。

# 環境手順

## Codecommitリポジトリの作成
- マネジメントコンソールからCodecommitリポジトリを作成します。
- リポジトリ名とリポジトリURLを下記のファイルに追記します。
- デプロイされるリソース名のプレフィックスを設定します。
- `roadwaker.tfvars`

# 以下のコマンドを実行する。
```
roadwork -e --target-zone xxxxxxx.com. -o Routefile
```

`xxxxxxx.com.`は対象にしたいドメイン名

出力されたRoutefileと`buildsppec/buildspec.yml`を、コードコミットの`master`ブランチにPushします。

## 環境のデプロイ
- 以下のコマンドを実行した、環境のデプロイをします。
`terraform plan -var-file=roadwaker.tfvars `