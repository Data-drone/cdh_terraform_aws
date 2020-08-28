/* datetime conversion */ 
Select from_unixtime(unix_timestamp(requestdatetime, 'dd/MMM/yyyy:HH:mm:ss Z')), requestdatetime from s3_access_logs_external limit 10;

/* group by string date roll up testing */
select substr(requestdatetime, 1, 20), count(*) from s3_access_logs_external
group by substr(requestdatetime, 1, 20);

/* look at different group latencies */
select substr(requestdatetime, 1, 16), useragent, count(*), avg(cast(turnaroundtime as int)) from s3_access_logs_external
group by substr(requestdatetime, 1, 16), useragent;

/* Impala Queries */
/* Date Conversion */
Select max(from_unixtime(unix_timestamp(requestdatetime, 'dd/MMM/yyyy:HH:mm:ss SSSS')))
from s3_access_logs_external_test2; 

-- grouping test
select substr(requestdatetime, 1, 6) as day_month, count(*) from s3_access_logs_external_test2
GROUP BY (day_month)


-- Latest partitioned table test
-- this doesn't matter I think since spark created table alrdy
SET hive.exec.dynamic.partition.mode = nonstrict

-- Run in hive
CREATE EXTERNAL TABLE IF NOT EXISTS s3_access_logs_hr_partition(
    BucketOwner STRING,
    Bucket STRING,
    RequestDateTime STRING,
    RemoteIP STRING,
    Requester STRING,
    RequestID STRING,
    Operation STRING,
    Key STRING,
    Request STRING,
    HTTPstatus STRING,
    ErrorCode STRING,
    BytesSent INT,
    ObjectSize INT,
    TotalTime INT,
    TurnAroundTime INT,
    Referrer STRING,
    UserAgent STRING,
    VersionId STRING,
    HostId STRING,
    SigV STRING,
    CipherSuite STRING,
    AuthType STRING,
    EndPoint STRING,
    TLSVersion STRING,
    RequestURI_operation STRING,
    RequestURI_key STRING,
    RequestURI_httpProtoversion STRING,
    RequestTimestamp TIMESTAMP
) PARTITIONED BY (RequestDate STRING, RequestHour STRING )
STORED AS PARQUET
LOCATION 's3a://blaws3logsorganised/dateparquet/test3/';


-- test impala code to create the table
CREATE EXTERNAL TABLE s3_access_logs_parquet_partition 
LIKE PARQUET 's3a://blaws3logsorganised/dateparquet/test3/RequestDate=2020-06-08/RequestHour=0/part-00000-6726c00b-20f6-47d4-ac3b-5de0cb0a8278.c000.snappy.parquet'
PARTITIONED BY (RequestDate STRING, RequestHour INT)
STORED AS PARQUET
LOCATION 's3a://blaws3logsorganised/dateparquet/test3/';

RECOVER PARTITIONS s3_access_logs_parquet_partition

ALTER TABLE s3_access_logs_parquet_partition ADD PARTITION (requestdate='2020-06-08',requesthour=0)
LOCATION 's3a://blaws3logsorganised/dateparquet/test3/RequestDate=2020-06-08/RequestHour=0/';


SELECT to_date(requesttimestamp), hour(requesttimestamp), minute(requesttimestamp), count(*), avg(bytessent), avg(turnaroundtime) from s3_access_logs_parquet_partition
group by to_date(requesttimestamp), hour(requesttimestamp), minute(requesttimestamp);
