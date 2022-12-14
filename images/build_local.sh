#!/bin/bash
REPO=johannestang

# Hadoop base
cd hadoop-base
IMAGE=hadoop-base
VERSION=2.0.0-hadoop$(grep HADOOP_VERSION Dockerfile | head -n 1 | awk '{print $3}')-java8
docker build -t ${REPO}/${IMAGE}:${VERSION} .
cd ..

# Hadoop datanode
cd hadoop-datanode
IMAGE=hadoop-datanode
VERSION=2.0.0-$(grep hadoop-base Dockerfile |  cut -d '-' -f 3)-java8
docker build -t ${REPO}/${IMAGE}:${VERSION} .
cd ..

# Hadoop namenode
cd hadoop-namenode
IMAGE=hadoop-namenode
VERSION=2.0.0-$(grep hadoop-base Dockerfile |  cut -d '-' -f 3)-java8
docker build -t ${REPO}/${IMAGE}:${VERSION} .
cd ..

# Hive
cd hadoop-hive
IMAGE=hive
VERSION=$(grep HIVE_VERSION Dockerfile | head -n 1 | awk '{print $3}')-postgresql-metastore-s3
docker build -t ${REPO}/${IMAGE}:${VERSION} .
cd ..
