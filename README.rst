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

Each set of config options below include some sample values.

collectd_plugin_capabilities_*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``capabilities`` plugin.
See the collectd `wiki <https://collectd.org/wiki/index.php/Plugin:capabilities>`_ for details.
collectd_plugin_capabilities_host: localhost
collectd_plugin_capabilities_port: "9104"

collectd_plugin_ethstat_*
~~~~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``ethstat`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_ethstat>`_ for details.

collectd_plugin_ethstat_interface: "eth0"
collectd_plugin_ethstat_map: []
collectd_plugin_ethstat_mappedonly: False

collectd_plugin_irq_*
~~~~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``irq`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_irq>`_ for details.

collectd_plugin_irq_ignoreselected: False
collectd_plugin_irq_irq: ["7", "8", "9"]
OR
collectd_plugin_irq_irq:
   - 7
   - 8
   - 9

collectd_plugin_mdevents_*
~~~~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``mdevents`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_mdevents>`_ for details.

collectd_plugin_mdevents_event: "DeviceDisappeared Fail DegradedArray"
collectd_plugin_mdevents_ignore_event: False
collectd_plugin_mdevents_array: "/dev/md[0-9]"
collectd_plugin_mdevents_ignore_array: False

collectd_plugin_ovs_stats_*
~~~~~~~~~~~~~~~~~~~~~~~~~~~

These vars are ones passed to the ``ovs_stats`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_ovs_stats>`_ for details.
collectd_plugin_ovs_stats_port: 6640
collectd_plugin_ovs_stats_address: "127.0.0.1"
collectd_plugin_ovs_stats_socket: "/var/run/openvswitch/db.sock"
collectd_plugin_ovs_stats_bridges: br0 br_ext

collectd_plugins_processes_*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``processes`` plugin
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_processes>`_ f
or details.

collectd_plugin_processes_process:
  - name: "someprocessname"
    collectfiledescriptor: True
    collectcontextswitch: True
collectd_plugin_processes_processmatch:
  - name: "someprocessname"
    regex: "(^_^|*.*)"
    collectfiledescriptor: True
    collectcontextswitch: True
collectd_plugin_processes_collectfiledescriptor: True
collectd_plugin_processes_collectcontextswitch: True
collectd_plugin_processes_collectmemorymaps: True

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
