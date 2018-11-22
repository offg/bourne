import boto3
import json

s3 = boto3.client('s3')
response = s3.list_objects(
    Bucket='atamaplus-recommendation-log',
    Prefix='default/1.0.1/4036/math',
)
for content in response['Contents']:
    key = content.get('Key')
    obj = s3.get_object(Bucket='atamaplus-recommendation-log', Key=key)
    print(json.loads(obj['Body'].read().decode('utf-8')))
