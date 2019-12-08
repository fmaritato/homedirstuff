#!/bin/bash -x


buckets=$(aws s3api list-buckets --query "Buckets[].Name" --profile dag_airflow_prod | jq -r '.[]')
for bucket in $buckets; do
  echo $bucket
  case "$bucket" in
    ot-dag-*)
      echo yep!
      $(aws s3api put-bucket-tagging --bucket $bucket --tagging 'TagSet=[{Key=ot-bucket-name,Value='$bucket'},{Key=Team,Value=DAG}]' --profile dag_airflow_prod)
      ;;
  esac
done


