#!/bin/sh

template_path="./Stacks/master.yml"
output_template="output-master.yml"
s3_bucket="<テンプレート保存バケット>"
profile="default"
env="dev"

aws cloudformation package --template-file ${template_path} --s3-bucket ${s3_bucket} --output-template-file ${output_template} --profile ${profile}

aws cloudformation deploy \
--capabilities CAPABILITY_IAM \
--template-file output-master.yml \
--stack-name <スタック名>\
--parameter-overrides \
env=<環境> \
GitHubOwner=<GitHub レポジトリーオーナー> \
GitHubToken=<GitHub トークン> \
Repository=<GigHub レポジトリ> \
Branch=<GitHub 本番用ブランチ> \
ServiceName=<サービス名> \
Type=<インフラ種別> \
Env=${env} \
CodePipelinDeployDevBucket=<コードパイプライン開発用デプロイ先バケット名> \
CodePipelinDeployStgBucket=<コードパイプライン開発用デプロイ先バケット名> \
CodePipelineArtifactStoreBucket=<コードパイプラインアーティファクトバケット名> \
AutoSaclingGroup＝<オートスケーリング”グループ名> \
--region <リージョン> \
--profile <プロファイル> \
--no-execute-changeset