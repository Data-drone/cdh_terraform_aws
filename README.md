# CDH Terraform script for AWS


A quick script to deploy CDH clusters on AWS
leveraging Terraform and Ansible

Lveerages Terraform to start nodes then uses ansible to to provision resouces as per:
https://github.com/cloudera/cloudera-playbook

# Quick Env settings to run

clone https://github.com/Data-drone/cloudera-playbook

edit `cloudera-playbook/group_vars/all` as needed

### Extra Tips
- Currently the script breaks if there isn't a krb5 server (none flag doesn't seem to work)
- The hosts files are geared for 3 masters will need to alter a fair bit to change
- need to edit /roles/cdh/templates/host.j2 as needed
  - by default assumes 3 master setup

```{bash}
export ANSIBLE_HOST_KEY_CHECKING=False
export AWS_ACCESS_KEY_ID=blah
export AWS_SECRET_ACCESS_KEY=blah
export AWS_DEFAULT_REGION=blah

terraform apply --var-file="myfile.tfvars"

# wait a while

ansible-playbook -i inventory ansible-prework/main.yml --private-key /path/to/my_aws_key.pem

# change cloudera-playbook location to wherever it is
## moved paywall auth here
ansible-playbook -i inventory ../cloudera-playbook/site.yml --extra-vars="cloudera_archive_authn=<user>:<pass>" --private-key /path/to/my_aws_key.pem

```

# current add node

Currently in the add node subfolder

separate terraform there

need to manually paste over db_server / scm_server / krb5_server

run prework as per normal

run 

# Testing postwork

we need to fiddle around and get keytabs and user accounts sorted

```{bash}

ansible-playbook -i inventory postwork/setup.yml --private-key /path/to/my_aws_key.pem


```

# adding security

need to look at how we do tls and kerberise interfaces
need to have a ca? and an ldap?