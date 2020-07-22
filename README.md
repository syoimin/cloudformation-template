# cloudformation テンプレート集

AWS アカウントごとやサービスごとの CloudFormation を管理する テンプレート集

## 目次



## deploy コマンド

ヘルパースクリプト
```
sh init.sh 
```

スタック削除コマンド
```
aws cloudformation delete-stack --stack-name <stack 名> --region ap-northeast-1 --profile default
```

## 命名規則
https://dev.classmethod.jp/articles/aws-name-rule/


| AWSリソース | 命名規則 | 備考 |
| :---: | :---: | :---: |
| VPC |	{serviceName}-{env}-vpc |  |	
| Subnet | {serviceName}-{env}-{nlayer}-subnetXX | XXは連番、AZ毎に分ける | 
| RouteTable | {serviceName}-{env}-{nlayer}-rtb | 	NatGawatayをAZ毎に分ける場合はprotectedのみ連番を付与 |
| InternetGateway | {serviceName}-{env}-igw | |
| ELB | {serviceName}-{env}-alb/clb | インターナルなELBを作成する場合、役割毎に分ける場合はその部分も考慮 |
| TargetGroup | {serviceName}-{env}-tg | 同上 |
| EC2 | {serviceName}-{env}-{type}XX | 	 |
| IAMRole | {serviceName}-{env}-{type}-role | |
| SecurityGroup | {serviceName}-{env}-{type}-sg | |	
| RDS | {serviceName}-{env}-rds | | 
| S3 | {serviceName}-{env}-{use}-{AccountID} | S3のリソースは全体で一意にする必要があるためAWSのアカウント番号を付与 |