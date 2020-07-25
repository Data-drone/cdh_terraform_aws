# Post Creation Work to get cluster usable

## Initiate Users (check SSSD config and if we have an ldap? maybe easier route there)
  - nah not needed for now

  ### If we use linux only....
  - Create each user on each node (master / workers / edge)
  - Create the home folder for each
  - Create a kerberos for each user

## Niggles
  - something needs fixing with Hue setup can't sync the sysadmins group properly?
    - but we can do stuff so does it matter?

## CDF Configs
  - NiFi
    - parcel loading
    - Configs for Manager
  - Kafka
  - SMM and friends too
  - Flink
