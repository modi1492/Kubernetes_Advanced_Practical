#!/usr/bin/env bash
helm install incubator/elasticsearch -n efk-els --namespace=logs --set master.persistence.enabled="false",data.persistence.enabled="false",rbac.create="true"

helm install stable/redis -n redis --set persistence.enabled="true"