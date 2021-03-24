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
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_capabilities>`_ for details.

::

  collectd_plugin_capabilities_host: localhost
  collectd_plugin_capabilities_port: "9104"

collectd_plugin_ceph_*
~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``ceph`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_ceph>`_ for details.

::

  collectd_plugin_ceph_daemon:
    - name: "osd.0"
      socketpath: "/var/run/ceph/ceph-osd.0.asok"
    - name: "osd.1"
      socketpath: "/var/run/ceph/ceph-osd.1.asok"
  collectd_plugin_ceph_longrunlatency: False
  collectd_plugin_ceph_convertspecialmetrictypes: True

collectd_plugin_connectivity_*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``connectivity`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_connectivity>`_ for details.

::

  collectd_plugin_connectivity_interface: []
  collectd_plugin_connectivity_ignoreselected: False

collectd_plugin_cpu_*
~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``cpu`` plugin.
See the collectd `wiki <https://collectd.org/wiki/index.php/Plugin:cpu>`_ for details.

::

  collectd_plugin_cpu_reportbycpu: true
  collectd_plugin_cpu_reportbystate: true
  collectd_plugin_cpu_reportnumcpu: false
  collectd_plugin_cpu_valuespercentage: true
  collectd_plugin_cpu_reportgueststate: true
  collectd_plugin_cpu_subtractgueststate: true

collectd_plugin_csv_*
~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``csv`` plugin.
See the collectd `wiki <https://collectd.org/wiki/index.php/Plugin:csv>`_ for details.

::

  collectd_plugin_csv_datadir: /var/log/collectd/csv/
  collectd_plugin_csv_storerates: false

collectd_plugin_cgroups_*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``cgroups`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_cgroups>`_ for details.

::

  collectd_plugin_cgroups_cgroups: []
  collectd_plugin_cgroups_cgroups:
    - libvirt

  collectd_plugin_cgroups_ignoreselected: False

collectd_plugin_dcpmm_*
~~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``dcpmm`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_dcpmm>`_ for details.

::

  collectd_plugin_dcpmm_interval: 10.0
  collectd_plugin_dcpmm_collect_health: False
  collectd_plugin_dcpmm_collect_perf_metrics: True
  collectd_plugin_dcpmm_enable_dispatch_all: False

collectd_plugin_df_*
~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``df`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_df>`_ for details.

::

  collectd_plugin_df_devices: []
  collectd_plugin_df_mountpoints: []
  collectd_plugin_df_fstype: []
  collectd_plugin_df_ignoreselected: true
  collectd_plugin_df_reportbydevice: true
  collectd_plugin_df_reportinodes: true
  collectd_plugin_df_reportreserved: true
  collectd_plugin_df_valuesabsolute: true
  collectd_plugin_df_valuespercentage: true

collectd_plugin_disk_*
~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``disk`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_disk>`_ for details.

::

  collectd_plugin_disk_disk: []
  collectd_plugin_disk_ignoreselected: False
  collectd_plugin_disk_udevnameattr: DM_NAME

collectd_plugin_dns_*
~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``dns`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_dns>`_ for details.

::

  collectd_plugin_dns_interface: 'any'
  collectd_plugin_dns_ignoresource: 123.45.67.89
  collectd_plugin_dns_selectnumericquerytypes: True

collectd_plugin_ethstat_*
~~~~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``ethstat`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_ethstat>`_ for details.

::

  collectd_plugin_ethstat_map: []
  OR
  collectd_plugin_ethstat_map:
     - '"rx_csum_offload_errors" "if_rx_errors" "checksum_offload"'
     - '"multicast" "if_multicast"'

  collectd_plugin_ethstat_interface: "eth0"
  collectd_plugin_ethstat_mappedonly: False

collectd_plugin_hddtemp_*
~~~~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``hddtemp`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_hddtemp>`_ for details.

::

  collectd_plugin_hddtemp_host: '127.0.0.1'
  collectd_plugin_hddtemp_port: 7638

collectd_plugin_interface_*
~~~~~~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``interface`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_interface>`_ for details.

::

  collectd_plugin_interface_interfaces: []
  collectd_plugin_interface_interfaces:
    - "lo"
    - "/^veth/"
    - "/^tun[0-9]+/"
  collectd_plugin_interface_ignoreselected: False
  collectd_plugin_interface_reportinactive: False

collectd_plugin_ipmi_*
~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``ipmi`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_ipmi>`_ for details.

::

  collectd_plugin_ipmi_sensors: []
  collectd_plugin_ipmi_ignoreselected: false
  collectd_plugin_ipmi_notifysensoradd: false
  collectd_plugin_ipmi_notifysensorremove: true
  collectd_plugin_ipmi_notifysensornotpresent: false

collectd_plugin_irq_*
~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``irq`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_irq>`_ for details.

::

  collectd_plugin_irq_ignoreselected: False
  collectd_plugin_irq_irq: ["7", "8", "9"]
  OR
  collectd_plugin_irq_irq:
    - 7
    - 8
    - 9

collectd_plugin_logfile_*
~~~~~~~~~~~~~~~~~~~~~~~~~

These vars are ones passed to the ``logfile`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_logfile>`_ for details.

::

  collectd_plugin_logfile_loglevel: info
  collectd_plugin_logfile_file: "/var/log/collectd.log"
  collectd_plugin_logfile_timestamp: true
  collectd_plugin_logfile_printseverity: false

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

::

  collectd_plugin_mdevents_event: "DeviceDisappeared Fail DegradedArray"
  collectd_plugin_mdevents_ignore_event: False
  collectd_plugin_mdevents_array: "/dev/md[0-9]"
  collectd_plugin_mdevents_ignore_array: False

collectd_plugin_netlink_*
~~~~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``netlink`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_netlink>`_ for details.

::

  collectd_plugin_netlink_interfaces: []
  collectd_plugin_netlink_interfaces: ["All"]

  collectd_plugin_netlink_verboseinterfaces: []

  collectd_plugin_netlink_qdiscs: []
  collectd_plugin_netlink_qdiscs:
      - '"eth0" "pfifo_fast-1:0"'
      - '"ppp0"'

  collectd_plugin_netlink_classes: []
  collectd_plugin_netlink_classes:
      - '"ppp0" "htb-1:10"'

  collectd_plugin_netlink_filters: []
  collectd_plugin_netlink_filters: ['"ppp0" "u32-1:0"']

  collectd_plugin_netlink_ignoreselected: False

collectd_plugin_ntpd_*
~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``ntpd`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_ntpd>`_ for details.

::

  collectd_plugin_ntpd_host: "localhost"
  collectd_plugin_ntpd_port: 123
  collectd_plugin_ntpd_reverselookups: False
  collectd_plugin_ntpd_includeunitid: True

collectd_plugin_ovs_stats_*
~~~~~~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``ovs_stats`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_ovs_stats>`_ for details.

::

  collectd_plugin_ovs_stats_port: 6640
  collectd_plugin_ovs_stats_address: "127.0.0.1"
  collectd_plugin_ovs_stats_socket: "/var/run/openvswitch/db.sock"
  collectd_plugin_ovs_stats_bridges: br0 br_ext

collectd_plugins_processes_*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``processes`` plugin
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_processes>`_ for details.

::

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

collectd_plugins_smart_*
~~~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``smart`` plugin
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_smart>`_ f
or details.

::

  collectd_plugin_smart_disk: []
  collectd_plugin_smart_ignoreselected: False
  collectd_plugin_smart_ignoresleepmode: False
  collectd_plugin_smart_useserial: False

collectd_plugin_syslog_*
~~~~~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``syslog`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_syslog>`_ for details.

::

  collectd_plugin_syslog_loglevel: info
  collectd_plugin_syslog_notifylevel: WARNING

collectd_plugin_unixsock_*
~~~~~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``unixsock`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_unixsock>`_ for details.

::

  collectd_plugin_unixsock_socketfile: /var/run/collectd-socket
  collectd_plugin_unixsock_socketgroup: root
  collectd_plugin_unixsock_socketperms: 0770
  collectd_plugin_unixsock_deletesocket: True

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

collectd_plugin_write_kafka_*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

These vars are ones passed to the ``write_kafka`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_write_kafka>`_ for details.

::

  collectd_plugin_write_kafka_kafka_hosts: ["localhost:9092"]
  # OR
  collectd_plugin_write_kafka_kafka_hosts:
    - "localhost:9092"
    - "otherhost:9093"
  collectd_plugin_write_kafka_properties: {}
  collectd_plugin_write_kafka_topics: {}
  # OR
  collectd_plugin_write_kafka_topics:
    collectd:
      format: json
  collectd_plugin_write_kafka_meta: {}

collectd_plugin_write_prometheus_*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``write_prometheus`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_write_prometheus>`_ for details.

::

  collectd_plugin_write_prometheus_port: 9103
  collectd_plugin_write_prometheus_stalenessdelta: 300

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
