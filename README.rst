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

collectd_plugin_amqp1_*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``amqp1`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_amqp1>`_ for details.

::

  collectd_plugin_amqp1_transport: 'metrics'
  collectd_plugin_amqp1_host: 'localhost'
  collectd_plugin_amqp1_port: '5672'
  collectd_plugin_amqp1_user: 'guest'
  collectd_plugin_amqp1_password: 'guest'
  collectd_plugin_amqp1_address: 'collectd'
  collectd_plugin_amqp1_retry_delay: 1
  collectd_plugin_amqp1_send_queue_limit:

  collectd_plugin_amqp1_instances: []
  # OR
  collectd_plugin_amqp1_instances:
     - name: "openshift-notify"
       format: JSON
       presettle: False
       notify: true
     - name: "openshift-telemetry"
       format: JSON
       presettle: False
   # OR
   collectd_plugin_amqp1_instances:
     - name: metrics
       format: "Command|JSON|Graphite"
       presettle: false
       notify: false
       store_rates: false
       graphite_prefix:
       graphite_postfix:
       graphite_escape_char: '_'
       graphite_separate_instances: False
       graphite_always_append_ds: False
       graphite_preserve_separator: False

collectd_plugin_capabilities_*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``capabilities`` plugin.
See the collectd `wiki <https://collectd.org/wiki/index.php/Plugin:capabilities>`_ for details.
collectd_plugin_capabilities_host: localhost
collectd_plugin_capabilities_port: "9104"

collectd_plugin_dcpmm_*
~~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``dcpmm`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_dcpmm>`_ for details.

collectd_plugin_dcpmm_interval: 10.0
collectd_plugin_dcpmm_collect_health: False
collectd_plugin_dcpmm_collect_perf_metrics: True
collectd_plugin_dcpmm_enable_dispatch_all: False

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

collectd_plugin_mcelog_*
~~~~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``mcelog`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_mcelog>`_ for details.

::
  collectd_plugin_mcelog_mceloglogfile: "/var/log/mcelog"
  collectd_plugin_mcelog_memory:
    mcelogclientsocket: "/var/run/mcelog-client"
    persistentnotification: False

.. NOTE::

  The two config options (``collectd_plugin_mcelog_mceloglogfile`` and
  ``collectd_plugin_mcelog_memory`` are mutually exclusive in collectd.
  Collectd will complain about this, however this role will not.

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


collectd_plugins_write_http_*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``write_http`` plugin
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_write_http>`_ for details.

::

  collectd_plugin_write_http_nodes: {}
  # OR
  collectd_plugin_write_http_nodes:
    example:
      url: "http://example.com/collectd-post"
      password: "pass"
      verifypeer: true|false
      verifyhost: true|false
      cacert: "/etc/ssl/ca.crt"
      capath: "/etc/ssl/certs/"
      clientkey: "/etc/ssl/client.pem"
      clientcert: "/etc/ssl/client.crt"
      clientkeypass: "secret"
      header: ["X-Custom-Header: custom_value"]
      ssl_version: "SSLv2"|"SSLv3"|"TLSv1"|"TLSv1_0"|"TLSv1_1"|"TLSv1_2"
      format: "Command"|"JSON"
      metrics: true|false
      notifications: false|true
      storerates: false|true
      buffer_size: 4096
      low_speed_limit: 0
      timeout: 0
  # OR
  collectd_plugin_write_http_nodes:
    collectd:
      url: 'write_http_server'
      metrics: True
      header: 'foo'

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
