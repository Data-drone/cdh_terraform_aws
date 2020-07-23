# Post Creation Work to get cluster usable

## TODO Create Super User 
  - Create hdfs superuser
    - `sudo -u cloudera-scm kadmin`

## TODO Generate super keytabs
  - create in kerberos
    - `sudo -u cloudera-scm kinit`
  - get keytabs?
      `hive / hdfs`

      `ktutil add_entry -password -p principal@REALM -k 1 -e aes256-cts-hmac-sha1-96`
      encryption type is per default in krb5.conf
      as per https://www.ibm.com/support/knowledgecenter/SSZUMP_7.1.2/management_sym/sym_kerberos_creating_principal_keytab.html
      `ktutil wkt /home/centos/blah.keytab`

## Initiate Users (check SSSD config and if we have an ldap? maybe easier route there)

  - Create each user on each node (master / workers / edge)
  - Create the home folder for each
  - Create a kerberos for each user

## To Do - Setup sentry roles so that we can do things...

  - Create Hue users
  - Create Sentry grants on db

## To Add - Kudu Configs
  - Add service
  - Add service users
  - Add kerb?
  

## CDF Configs
  - NiFi
    - parcel loading
    - Configs for Manager
  - Kafka
  - SMM and friends too
  - Flink
