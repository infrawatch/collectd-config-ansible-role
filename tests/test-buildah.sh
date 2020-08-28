#!/usr/bin/env bash
set -e

base=$(buildah from "${1:-fedora}")

## install Ansible
buildah run "$base" -- dnf install ansible -y

buildah config --annotation "watch.infra.build.host=$(uname -n)" "$base"

buildah config --cmd "/usr/bin/ansible-playbook -i /collectd-config-ansible-role/tests/inventory /collectd-config-ansible-role/tests/test.yml" "$base"

buildah commit "$base" "${2:-ansible-config-tester}"
