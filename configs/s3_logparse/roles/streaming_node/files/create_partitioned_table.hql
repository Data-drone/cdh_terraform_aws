CREATE TABLE IF NOT EXISTS s3_access_logs_hr_partition(
    BucketOwner STRING,
    Bucket STRING,
    RequestDateTime STRING,
    RemoteIP STRING,
    Requester STRING,
    RequestID STRING,
    Operation STRING,
    Key STRING,
    RequestURI_operation STRING,
    RequestURI_key STRING,
    RequestURI_httpProtoversion STRING,
    HTTPstatus STRING,
    ErrorCode STRING,
    BytesSent STRING,
    ObjectSize STRING,
    TotalTime STRING,
    TurnAroundTime STRING,
    Referrer STRING,
    UserAgent STRING,
    VersionId STRING,
    HostId STRING,
    SigV STRING,
    CipherSuite STRING,
    AuthType STRING,
    EndPoint STRING,
    TLSVersion STRING
) PARTITIONED BY (RequestDateHr STRING)
STORED AS PARQUET;

set hive.exec.dynamic.partition.mode=nonstrict;

INSERT OVERWRITE TABLE s3_access_logs_hr_partition PARTITION (RequestDateHr)
SELECT BucketOwner, Bucket, RequestDateTime,
    RemoteIP, Requester, RequestID,
    Operation, Key, RequestURI_operation,
    RequestURI_key, RequestURI_httpProtoversion,
    HTTPstatus, ErrorCode, BytesSent,
    ObjectSize, TotalTime, TurnAroundTime,
    Referrer, UserAgent, VersionId,
    HostId, SigV, CipherSuite,
    AuthType, EndPoint,
    TLSVersion, substr(RequestDateTime, 1, 14) as RequestDateHr 
FROM s3_access_logs_external_test2;