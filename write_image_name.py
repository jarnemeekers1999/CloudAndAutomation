import os
import botocore
import boto3
from urllib.parse import unquote_plus

s3_client = boto3.client('s3')

def write_handler(event, context):
       for record in event['Records']:
        bucket = record['s3']['bucket']['name']
        key = unquote_plus(record['s3']['object']['key'])
        key_name_array = key.split('/')
        image_name = key_name_array[2]
        empty_line = True
        with open("/mnt/efs/image_names","r") as file:
            for last_line in file:
                file.readline()
            if last_line == "\n":
                empty_line = True
            file.close()
        
        with open("/mnt/efs/image_names", "a+") as file:
            
            if not empty_line:
                file.write("\n")
            file.write(image_name)
            file.close()

