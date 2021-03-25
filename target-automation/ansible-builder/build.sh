#!/bin/sh

BLD_EXEC="${BLD_EXEC:-ansible-builder}"
BLD_ACTION="${BLD_ACTION:-build}"

ENV_DEF="${ENV_DEF:-execution-environment.yml}"
CONT_RUNTIME="${CONT_RUNTIME:-podman}"
CONTEXT_DIR="${CONTEXT_DIR:-RUNNER-CONTEXT}"
VERBOSITY="${VERBOSITY:-3}"
CONT_TAG="${CONT_TAG:-auto-target}"
REG_URL="${REG_URL:-quay.io/mpetrive/auto-exec-env}"

$BLD_EXEC $BLD_ACTION --file=$ENV_DEF --container-runtime $CONT_RUNTIME --context $CONTEXT_DIR -v $VERBOSITY --tag $CONT_TAG

$CONT_RUNTIME login -u $REG_USER -p $REG_PASS
# requires previous login
$CONT_RUNTIME push auto-target $REG_URL
