# cloudformation テンプレート集

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
| VPC |	| {sysname}-{env}-vpc |  |	
| Subnet | {sysname}-{env}-{nlayer}-subnetXX | XXは連番、AZ毎に分ける | 
| RouteTable | {sysname}-{env}-{nlayer}-rtb | 	NatGawatayをAZ毎に分ける場合はprotectedのみ連番を付与 |
| InternetGateway | {sysname}-{env}-igw | |
| ELB | {sysname}-{env}-alb/clb | インターナルなELBを作成する場合、役割毎に分ける場合はその部分も考慮 |
| TargetGroup | {sysname}-{env}-tg | 同上 |
| EC2 | {sysname}-{env}-{type}XX | 	 |
| IAMRole | {sysname}-{env}-{type}-role | |
| SecurityGroup | {sysname}-{env}-{type}-sg | |	
| RDS | {sysname}-{env}-rds | | 
| S3 | {sysname}-{env}-{use}-{AccountID} | S3のリソースは全体で一意にする必要があるためAWSのアカウント番号を付与 |