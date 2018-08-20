#!/usr/bin/env bash

set -eu

source services.sh

for SERVICE in "${SERVICES[@]}"; do
    kubectl delete -f "deployments/$SERVICE.yaml"
done


