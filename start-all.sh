#!/usr/bin/env bash

set -eu

source services.sh

for SERVICE in "${SERVICES[@]}"; do
    kubectl apply -f "deployments/$SERVICE.yaml"
done


