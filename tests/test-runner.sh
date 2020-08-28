#!/usr/bin/env bash
set -e
REL=$(dirname "$0")
podman run -it -v ${REL}/../:/collectd-config-ansible-role/ localhost/ansible-config-tester

# TODO: does not currently clean up after itself
