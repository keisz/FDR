# Wasabi Storage  
AWS S3に変わってWasabi Storageへログをアップロードすることができます。

## falcon_data_replicator.ini の設定  
`TARGET_REGION` を空欄にして、 `WASABI_ENDPOINT_URL` を指定します。
その他はS3に転送する場合と同じです。  

`WASABI_ENDPOINT_URL` は[ここから](https://wasabi-support.zendesk.com/hc/en-us/articles/360015106031-What-are-the-service-URLs-for-Wasabi-s-different-storage-regions-)ServiceURLを確認して指定します。  

```
[Destination Data]
# Target bucket (String)
# The name of your bucket. This bucket must exist.
TARGET_BUCKET = wasabi-fdr-test01
# Name of our target AWS region (String)
# Example: us-east-1
TARGET_REGION = 
# Remove local files after upload (Boolean)
# Allowed values: True, False, Yes, No
REMOVE_LOCAL_FILE = Yes
# No local file system usage
# Allowed values: True, False, Yes, No
IN_MEMORY_TRANSFER_ONLY = Yes
# Target bucket Access Key
TARGET_AWS_KEY = KEY******************
# Target bucket Secret
TARGET_AWS_SECRET = SECRET********************
# Wasabi Storage Endpoint URL
WASABI_ENDPOINT_URL = https://s3.ap-northeast-1.wasabisys.com
```
