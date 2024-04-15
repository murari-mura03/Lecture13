# 第13回講義課題

`・CircleCI のサンプルに ServerSpec や Ansible の処理を追加し結果を報告`

## 構成図


### 使用したツール

1. Cloudformation
   - 第10回講義課題で作成したCloudformationの環境を使用。
   - VPC,ALB,EC2,RDS,S3を作成。

2. Ansible
   - サンプルアプリケーションのデプロイを行う
3. serverspec