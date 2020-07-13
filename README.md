# CDH Terraform script for AWS


A quick script to deploy CDH clusters on AWS
leveraging Terraform and Ansible

Lveerages Terraform to start nodes then uses ansible to to provision resouces as per:
https://github.com/cloudera/cloudera-playbook

# Quick Env settings to run

clone https://github.com/cloudera/cloudera-playbook
to the folder.

edit `cloudera-playbook/group_vars/all` as needed

```{bash}
export ANSIBLE_HOST_KEY_CHECKING=False
export AWS_ACCESS_KEY_ID=blah
export AWS_SECRET_ACCESS_KEY=blah
export AWS_DEFAULT_REGION=blah

terraform apply --var-file="myfile.tfvars"

# wait a while

ansible-playbook -i inventory cloudera-playbook/site.yml --private-key /path/to/my_aws_key.pem
```
