import boto3
import configparser
import psycopg2

parser = configparser.ConfigParser()
parser.read('pipeline.conf')
dbname = parser.get('aws_creds', 'database')
user = parser.get('aws_creds', 'username')
password = parser.get('aws_creds', 'password')
host = parser.get('aws_creds', 'host')  # make sure cluster and s3 buckets are in the same region
port = parser.get('aws_creds', 'port')


#connect to redshift cluster
conn = psycopg2.connect(database= dbname,
                        user= user, password=  password,
                        host= host, port= port
)


parser = configparser.ConfigParser()
parser.read('pipeline.conf')
account_id = parser.get('aws_boto_credentials', 'account_id')
iam_role = parser.get('aws_creds', 'iam_role')
bucket_name = parser.get('aws_boto_credentials', 'bucket_name')

file_path = ('s3://' + bucket_name + '/order_extract.csv')
role_string = ('arn:aws:iam::' + account_id + ':role/' + iam_role)



sql= 'COPY public.orders'
sql = sql + ' from %s '
sql = sql + ' iam_role %s '



cur = conn.cursor()
cur.execute(sql, (file_path, role_string))
cur.close()
conn.commit()
conn.close()

# make sure the VPC security group accepts your ip otherwise the script won't work