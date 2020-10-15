Collectd-config-ansible-role
============================

A role that generates collectd configs.

Requirements
------------

Any pre-requisites that may not be covered by Ansible itself or the role should be mentioned here. For instance, if the role uses the EC2 module, it may be a good idea to mention in this section that the boto package is required.

Role Variables
--------------
The config values have the following naming convention: ``collectd_plugin_<plugin_name>_<config_option>``
The config options for each plugin can be found in the `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml>`_.
An incomplete list of supported options is below (list is WIP). To check whether a plugin or config option is set, check the ``templates/<plugin>.conf.j2`` and ``defaults/main/<plugin>.yml``
If there are no defaults set (e.g. all config options are optional), then the ``defaults/main/<plugin>.yml`` will not exist. Otherwise, commented examples are given for the unset, optional config options.


collectd_plugin_ovs_stats_*
~~~~~~~~~~~~~~~~~~~~~~~~~~~

These vars are ones passed to the ``ovs_stats`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_ovs_stats>`_ for details.
collectd_plugin_ovs_stats_port: 6640
collectd_plugin_ovs_stats_address: "127.0.0.1"
collectd_plugin_ovs_stats_socket: "/var/run/openvswitch/db.sock" # definitely a string
collectd_plugin_ovs_stats_bridges: br0 br_ext

Dependencies
------------

Example Playbook
----------------

An example can be found in tests/test.yml.

License
-------

Apache 2

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
