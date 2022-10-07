# docker-composeでFDRをテスト

オリジナルの[FDR](https://github.com/CrowdStrike/FDR)にいくつか追加し、Docker-composeで実行できるようにしています。  
オリジナルから変更した点は下記。

- Target S3への認証をAccess keyベースに変更
  - オリジナルでは `~/.aws/credential` のAccess keyを利用する動作をしています。  
- コンテナで実行できるように Dockerfile と Docker-compose.yml を用意  

## 実施前準備  

### 環境準備  
DockerとDocker-compose、gitをインストールします。  
通常の方法で必要となるpythonなどはコンテナーで稼働させるので不要です。  

- [Install Docker Engine](https://docs.docker.com/engine/install/)
- [Install Docker Compose](https://docs.docker.com/compose/install/)
- [Gitのインストール](https://git-scm.com/book/ja/v2/%E4%BD%BF%E3%81%84%E5%A7%8B%E3%82%81%E3%82%8B-Git%E3%81%AE%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB) 
  
### FDR情報の準備  
FDRのフィードの認証情報、SQS URLを入手しておきます。  

### S3 Bucketの準備  
FDRから取得したログを転送するS3バケットを作成します。  
バケット名とリージョンをメモしておきます。  

### accesskeyの用意  
作成したS3 Bucketに書き込むためのAccessKeyを用意します。

## リポジトリをクローン  
リポジトリをクローンします。  
```
git clone https://github.com/keisz/FDR.git
cd FDR
```

## iniファイルの編集
[falcon_data_replicator.ini](./falcon_data_replicator.ini)を編集します。  
実施前準備で用意した値を設定していきます。  
[オリジナル](https://github.com/CrowdStrike/FDR/blob/main/README.md)と異なる部分は下記です。

```
# Target bucket Access Key
TARGET_AWS_KEY =
# Target bucket Secret
TARGET_AWS_SECRET =
```
事前に作成したS3 Bucket用のAccessKeyを指定します。  

## docker-composeの実行  
`docker-compose`を実行し、転送を開始します。  

```
docker-compose up -d --build
```

## 動作の確認  
dockerの稼働状況とログを確認します。  

- 稼働状況  
  `docker ps`  

- ログ  
  `docker logs fdr_fdr_1`  

## 停止
`docker-compose down`  


