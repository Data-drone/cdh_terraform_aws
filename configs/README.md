# Configs

This folder is tended to house different collections of stuff to test different use cases

# Projects

## Python3 Deploy

- setup python 3 and some libs for testing
- in Prod really should use conda parcels will look at those later

- if we wanna use spark magic need
  - python3-devel
  - gcc
  - add a livy server to the edge for use to connect to
    - add the livy user to kerberos and setup with access to spark too


- need jupyter lab extension
  - need to add the node 10 source and install
  - need to build the jupyter extension

snippet to connect with and send things to the cluster

```{python}

import os

os.environ['SPARK_HOME'] = '/opt/cloudera/parcels/CDH/lib/spark'
os.environ['HADOOP_CONF_DIR'] = '/etc/spark/conf/yarn-conf'

from pyspark.sql import SparkSession
from pyspark.sql.types import *

spark = SparkSession.builder \
                    .master("yarn") \
                    .appName("testy") \
                    .getOrCreate()

```
