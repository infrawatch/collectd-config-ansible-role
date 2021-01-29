#! /bin/sh -l

ls
pwd

dnf install -y rpmdevtools git-core

rpmdev-setuptree

VERSION=${VERSION:-0}
RELEASE=${RELEASE:-0}
UPSTREAM_VERSION=${UPSTREAM_VERSION:-master}

# TODO: make upstream_version, release and specfile configurable
spectool -g --define "upstream_version ${UPSTREAM_VERSION}" --define "version 0" --define "release 0" --directory $HOME/rpmbuild/SOURCES/ collectd-config-ansible-role.spec

rpmbuild -bb --define "upstream_version ${UPSTREAM_VERSION}" --define "version ${VERSION}" --define "release ${RELEASE}" collectd-config-ansible-role.spec


if [ -d "/usr/share/ansible/roles/collectd_config" ]
then
	echo "Removing existing ansible-role-collectd-config package..."
	dnf -y remove ansible-role-collectd-config
fi

if [ -d "/usr/share/ansible/roles/collectd_config" ]
then
	echo "Forcibly removing ansible role collectd_config..."
	rm -rf /usr/share/ansible/roles/collectd_config
fi

ls -R $HOME/rpmbuild

ls $HOME/rpmbuild/RPMS/noarch/

echo "Installing RPM..."
dnf install -y $HOME/rpmbuild/RPMS/noarch/ansible-role-collectd-config-${VERSION}-${RELEASE}.noarch.rpm

if [ ! -d "/usr/share/ansible/roles/collectd_config" ]
then
	echo "Directory /usr/share/ansible/roles/collectd_config does not exist"
	exit 1
else
	echo "collectd_config was successfully installed!"
fi

cp $HOME/rpmbuild/RPMS/noarch/ansible-role-collectd-config-${VERSION}-${RELEASE}.noarch.rpm /opt/
