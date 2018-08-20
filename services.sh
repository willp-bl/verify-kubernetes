#!/usr/bin/env bash

set -eu

# "test-rp-msa" won't start as it can't consume certs/keys from env vars
# "config" needs to inject the federation config files into the container
# "policy" needs a trust store...
# "saml-soap-proxy" needs lots of truststores in env vars

SERVICES=( "stub-idp" "stub-event-sink" "frontend" )

echo "this script intentionally left blank"
