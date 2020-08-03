/* datetime conversion */ 
Select from_unixtime(unix_timestamp(requestdatetime, 'dd/MMM/yyyy:HH:mm:ss Z')), requestdatetime from s3_access_logs_external limit 10;

/* group by string date roll up testing */
select substr(requestdatetime, 1, 20), count(*) from s3_access_logs_external
group by substr(requestdatetime, 1, 20);

/* look at different group latencies */
select substr(requestdatetime, 1, 16), useragent, count(*), avg(cast(turnaroundtime as int)) from s3_access_logs_external
group by substr(requestdatetime, 1, 16), useragent;

