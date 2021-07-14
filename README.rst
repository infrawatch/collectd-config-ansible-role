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
~~~~~~~~~~~~~~~~~~~~~~~
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

  collectd_plugin_amqp1_instances: {}
  # OR
  collectd_plugin_amqp1_instances:
     openshift-notify:
       format: JSON
       presettle: False
       notify: true
     openshift-telemetry:
       format: JSON
       presettle: False
   # OR
   collectd_plugin_amqp1_instances:
     metrics:
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
    - "ceph-osd.0"
    - "ceph-osd.1"
  collectd_plugin_ceph_longrunlatency: False
  collectd_plugin_ceph_convertspecialmetrictypes: True

collectd_plugin_chrony_*
~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``chrony`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_chrony>`_ for details.

::

  collectd_plugin_chrony_host: localhost
  collectd_plugin_chrony_port: 323
  collectd_plugin_chrony_timeout: 2

collectd_plugin_connectivity_*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``connectivity`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_connectivity>`_ for details.

::

  collectd_plugin_connectivity_interfaces: []
  # OR
  collectd_plugin_connectivity_interfaces:
    - eth0
    - eth1
  collectd_plugin_connectivity_ignore_selected: False

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

collectd_plugin_cpufreq_*
~~~~~~~~~~~~~~~~~~~~~~~~~~
The ``cpufreq`` plugn doesn't have any options.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_cpufreq>`_ for details.

collectd_plugin_cpusleep_*
~~~~~~~~~~~~~~~~~~~~~~~~~~
The ``cpusleep`` plugn doesn't have any options.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_cpusleep>`_ for details.

collectd_plugin_contextswitch_*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
The ``contextswitch`` plugn doesn't have any options.
See the collectd `wiki <https://collectd.org/wiki/index.php/Plugin:ContextSwitch>`_ for details.

collectd_plugin_csv_*
~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``csv`` plugin.
See the collectd `wiki <https://collectd.org/wiki/index.php/Plugin:csv>`_ for details.

::

  collectd_plugin_csv_datadir: /var/log/collectd/csv/
  collectd_plugin_csv_storerates: false

collectd_plugin_cgroups_*
~~~~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``cgroups`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_cgroups>`_ for details.

::

  collectd_plugin_cgroups_cgroups: []
  collectd_plugin_cgroups_cgroups:
    - libvirt

  collectd_plugin_cgroups_ignore_selected: False

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

  collectd_plugin_df_devices:
    - "/dev/hda1"
    - "192.168.0.2:/mnt/nfs"
  collectd_plugin_df_mountpoints: []
  collectd_plugin_df_fstypes: []
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

collectd_plugin_dpdk_telemetry_*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``dpdk_telemetry`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_dpdk_telemetry>`_ for details.

::

  collectd_plugin_dpdk_telemetry_client_socket_path: "/var/run/.client"
  collectd_plugin_dpdk_telemetry_dpdk_socket_path: "/var/run/dpdk/rte/telemetry"

collectd_plugin_ethstat_*
~~~~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``ethstat`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_ethstat>`_ for details.

::

  collectd_plugin_ethstat_maps: []
  # OR
  collectd_plugin_ethstat_maps:
     - '"rx_csum_offload_errors" "if_rx_errors" "checksum_offload"'
     - '"multicast" "if_multicast"'

  collectd_plugin_ethstat_interfaces: []
  # OR
  collectd_plugin_ethstat_interfaces:
    - eth0
    - eth1
  collectd_plugin_ethstat_mappedonly: False

collectd_plugin_exec_*
~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``exec`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_exec>`_ for details.

::

  collectd_plugin_exec_exec: []
  # OR
  collectd_plugin_exec_exec:
   - user: collectd
     group: collectd
     exec: "my-prog"
     args: ["arg0", "arg1"]
  collectd_plugin_exec_notification: []
  # OR
  collectd_plugin_exec_notification:
   - user: collectd
     group: collectd
     notification_exec: "my-notifier"
     args: ["arg0", "arg1"]

collectd_plugin_hddtemp_*
~~~~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``hddtemp`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_hddtemp>`_ for details.

::

  collectd_plugin_hddtemp_host: '127.0.0.1'
  collectd_plugin_hddtemp_port: 7638

collectd_plugin_hugepages_*
~~~~~~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``hugepages`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_hugepages>`_ for details.

::

  collectd_plugin_hugepages_report_per_node_hp: true
  collectd_plugin_hugepages_report_root_hp: true
  collectd_plugin_hugepages_values_pages: true
  collectd_plugin_hugepages_values_bytes: false
  collectd_plugin_hugepages_values_percentage: false

collectd_plugin_intel_pmu_*
~~~~~~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``intel_pmu`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_intel_pmu>`_ for details.

::

  collectd_plugin_intel_pmu_report_hardware_cache_events: true
  collectd_plugin_intel_pmu_report_kernel_pmu_events: true
  collectd_plugin_intel_pmu_report_software_events: true
  collectd_plugin_intel_pmu_dispatch_multi_pmu: false
  collectd_plugin_intel_pmu_cores: []
  # NOTE: The square brackets are semantically significent; when they are used,
  each core is added to a separate group i.e. the cores are not aggregated.
  Grouping without square brackets adds them to the same group and aggregates
  the events for that core group.
  collectd_plugin_intel_pmu_cores: ["1", "2", "3-4", "[12-15]"]

  # NOTE: collectd_intel_pmu_hardware_events requires collectd_intel_pmu_event_list to be set
  collectd_plugin_intel_pmu_event_list: "/path/to/event/list.json"
  collectd_plugin_intel_pmu_hardware_events: ["L2_RQSTS.CODE_RD_HIT,L2_RQSTS.CODE_RD_MISS", "L2_RQSTS.ALL_CODE_RD"]

collectd_plugin_intel_rdt_*
~~~~~~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``intel_rdt`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_intel_rdt>`_ for details.

::

  collectd_plugin_intel_rdt_cores: []
  # OR
  collectd_plugin_intel_rdt_cores: ["0-2", "3,4,6", "8-10,15"]


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

collectd_plugin_ipc_*
~~~~~~~~~~~~~~~~~~~~~
The ``ipc`` plugn doesn't have any options.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_ipc>`_ for details.

collectd_plugin_ipmi_*
~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``ipmi`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_ipmi>`_ for details.

::

    collectd_plugin_ipmi_instances: {}
    # OR
    collectd_plugin_ipmi_instances:
      local:
        sensors:
          - "some_sensor"
          - "another_one"
        ignore_selected: false
        notify_sensor_add: false
        notify_sensor_remove: true
        notify_sensor_not_present: false
        notify_ipmi_connection_state: false
        sel_enabled: false
        sel_clear_event: false
      remote:
        host: "server.example.com"
        address: "1.2.3.4"
        username: "user"
        password: "secret"
        auth_type: "md5"
        sensors:
          - "some_sensor"
          - "another_one"
        ignore_selected: false
        notify_sensor_add: false
        notify_sensor_remove: true
        notify_sensor_not_present: false
        notify_ipmi_connection_state: false
        sel_enabled: true
        sel_clear_event: false
        sel_sensors: []
        sel_ignore_selected: false
        sel_clear_event: false

collectd_plugin_irq_*
~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``irq`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_irq>`_ for details.

::

  collectd_plugin_irq_ignoreselected: False
  collectd_plugin_irq_irqs: ["7", "8", "9"]
  OR
  collectd_plugin_irq_irqs:
    - 7
    - 8
    - 9

collectd_plugin_load_*
~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``load`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_load>`_ for details.

::

  collectd_plugin_load_report_relative: true

collectd_plugin_logfile_*
~~~~~~~~~~~~~~~~~~~~~~~~~

These vars are ones passed to the ``logfile`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_logfile>`_ for details.

::

  collectd_plugin_logfile_log_level: info
  collectd_plugin_logfile_file: "/var/log/collectd.log"
  collectd_plugin_logfile_timestamp: true
  collectd_plugin_logfile_print_severity: false

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

collectd_plugin_memcached_*
~~~~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``memcached`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_memcached>`_ for details.

::

  collectd_plugin_memcached_instances: {}
  # OR
  collectd_plugin_memcached_instances:
    first_instance:
      host: localhost
      address: 127.0.0.1
      port: 11211
    second_instance:
      socket: path/to/socket

collectd_plugin_memory_*
~~~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``memory`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_memory>`_ for details.

::

  collectd_plugin_memory_valuesabsolute: True
  collectd_plugin_memory_valuespercentage: True

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

collectd_plugin_network_*
~~~~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``network`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_network>`_ for details.

::

  collectd_plugin_network_timetolive:
  collectd_plugin_network_maxpacketsize: 1452
  collectd_plugin_network_forward: false
  collectd_plugin_network_reportstats: false

  collectd_plugin_network_server: []
  # OR
  collectd_plugin_network_server:
      - name: "first_server"
      - name: "second_server"
        port: 12345
        securitylevel: "Encrypt"
        username: "other"
        password: "lastPass"
        interface:
        resolveinterval:
  collectd_plugin_network_listen: []
  # OR
  collectd_plugin_network_listen:
      - name: "first_server"
      - name: "second_server"
        port: 12345
        securitylevel: "Encrypt"
        username: "other"
        password: "lastPass"
        interface:

collectd_plugin_ntpd_*
~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``ntpd`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_ntpd>`_ for details.

::

  collectd_plugin_ntpd_host: "localhost"
  collectd_plugin_ntpd_port: 123
  collectd_plugin_ntpd_reverselookups: False
  collectd_plugin_ntpd_includeunitid: True

collectd_plugin_numa_*
~~~~~~~~~~~~~~~~~~~~~~
The ``numa`` plugn doesn't have any options.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_numa>`_ for details.

collectd_plugin_ovs_events_*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``ovs_events`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_ovs_events>`_ for details.

::

  collectd_plugin_ovs_events_port: 6640
  collectd_plugin_ovs_events_address: "127.0.0.1"
  collectd_plugin_ovs_events_socket: "/var/run/openvswitch/db.sock"
  collectd_plugin_ovs_events_interfaces: ["br0", "veth0"]
  collectd_plugin_ovs_events_send_notification: true
  collectd_plugin_ovs_events_dispatch_values: false

collectd_plugin_ovs_stats_*
~~~~~~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``ovs_stats`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_ovs_stats>`_ for details.

::

  collectd_plugin_ovs_stats_port: 6640
  collectd_plugin_ovs_stats_address: "127.0.0.1"
  collectd_plugin_ovs_stats_socket: "/var/run/openvswitch/db.sock"
  collectd_plugin_ovs_stats_bridges: ["br0", "br_ext"]

collectd_plugin_ping_*
~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``ping`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_ping>`_ for details.

::

  collectd_plugin_ping_hosts: []
  # OR
  collectd_plugin_ping_hosts:
    - example.org
    - provider.net
  collectd_plugin_ping_interval: 1.0
  collectd_plugin_ping_timeout: 0.9
  collectd_plugin_ping_ttl: 255
  collectd_plugin_ping_source_address: localhost
  collectd_plugin_ping_device: eth0
  collectd_plugin_ping_max_missed: -1  # disabled
  collectd_plugin_ping_size: 56

collectd_plugin_processes_*
~~~~~~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``processes`` plugin
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_processes>`_ for details.

::

  collectd_plugin_processes_processes:
    someprocessname:
      collect_file_descriptor: True
      collect_context_switch: True
  collectd_plugin_processes_process_matches:
    someprocessname:
      regex: "(^_^|*.*)"
      collect_file_descriptor: True
      collect_context_switch: True
  collectd_plugin_processes_collect_file_descriptor: True
  collectd_plugin_processes_collect_context_switch: True
  collectd_plugin_processes_collect_memory_maps: True

collectd_plugin_procevent_*
~~~~~~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``procevent`` plugin
See the collectd `collectd wiki <https://collectd.org/wiki/index.php/Plugin:procevent>`_ for details.

::

  collectd_plugin_procevent_process: tuned
  collectd_plugin_procevent_process_regex: "/^ovs.*$/"
  collectd_plugin_procevent_buffer_length: 10

collectd_plugin_python_*
~~~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``python`` plugin
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd-python.5.shtml>`_ f
or details.

::

  collectd_plugin_python_globals: true
  collectd_plugin_python_interactive: false
  collectd_plugin_python_logtraces: false
  collectd_plugin_python_modulepaths: []
  collectd_plugin_python_modules: []
  # OR
  collectd_plugin_python_modules:
    sqlalchemy:
      module_import: 'sqlalchemy_collectd.server.plugin'
      config:
        listen: ["bind_host", 25827]
        loglevel: "debug"

collectd_plugin_smart_*
~~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``smart`` plugin
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_smart>`_ f
or details.

::

  collectd_plugin_smart_disks: []
  # OR
  collectd_plugin_smart_disks:
    - "/^dm/"
  collectd_plugin_smart_ignoreselected: False
  collectd_plugin_smart_ignoresleepmode: False
  collectd_plugin_smart_useserial: False

collectd_plugin_swap_*
~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``swap`` plugin
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_swap>`_ f
or details.

::

  collectd_plugin_swap_reportbydevice: false
  collectd_plugin_swap_reportbytes: true
  collectd_plugin_swap_valuesabsolute: true
  collectd_plugin_swap_valuespercentage: false
  collectd_plugin_swap_reportio: true

collectd_plugin_syslog_*
~~~~~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``syslog`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_syslog>`_ for details.

::

  collectd_plugin_syslog_log_level: info
  collectd_plugin_syslog_notify_level: WARNING

collectd_plugin_turbostat_*
~~~~~~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``turbostat`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_turbostat>`_ for details.

::

  collectd_plugin_turbostat_core_c_states: 392
  collectd_plugin_turbostat_package_c_states: 396
  collectd_plugin_turbostat_system_management_interrupt: true
  collectd_plugin_turbostat_digital_temperature_sensor: true
  collectd_plugin_turbostat_package_thermal_management: true
  collectd_plugin_turbostat_tcc_activation_temp: 100
  collectd_plugin_turbostat_running_average_power_limit: 7
  collectd_plugin_turbostat_logical_core_names: true
  collectd_plugin_turbostat_restore_affinity_policy: "AllCPUs"

collectd_plugin_unixsock_*
~~~~~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``unixsock`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_unixsock>`_ for details.

::

  collectd_plugin_unixsock_socketfile: /var/run/collectd-socket
  collectd_plugin_unixsock_socketgroup: root
  collectd_plugin_unixsock_socketperms: 0770
  collectd_plugin_unixsock_deletesocket: True

collectd_plugin_uptime_*
~~~~~~~~~~~~~~~~~~~~~~~~
The ``uptime`` plugn doesn't have any options.
See the collectd `wiki <https://collectd.org/wiki/index.php/Plugin:Uptime>`_ for details.

collectd_plugin_uuid_*
~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``uuid`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_uuid>`_ for details.

::

  collectd_plugin_uuid_uuid_file: "/etc/uuid"

collectd_plugin_virt_*
~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``virt`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_virt>`_ for details.

::

  collectd_plugin_virt_connection: qemu:///system
  collectd_plugin_virt_refresh_interval: 10
  collectd_plugin_virt_domain: "name"
  collectd_plugin_virt_report_block_devices: true
  collectd_plugin_virt_report_network_interfaces: true
  collectd_plugin_virt_block_device: "name:device"
  collectd_plugin_virt_block_device_format: target
  collectd_plugin_virt_block_device_format_basename: false
  collectd_plugin_virt_interface_device: "name:device"
  collectd_plugin_virt_ignore_selected: false
  collectd_plugin_virt_hostname_format: hostname
  collectd_plugin_virt_hostname_metadata_xpath: "/instance/name/text()"
  collectd_plugin_virt_hostname_metadata_ns: "http://openstack.org/xmlns/libvirt/nova/1.0"
  collectd_plugin_virt_interface_format: name
  collectd_plugin_virt_plugin_instance_format: name
  collectd_plugin_virt_instances: 1
  collectd_plugin_virt_extra_stats: cpu_util disk disk_err pcpu job_stats_background perf vcpupin
  collectd_plugin_virt_persistent_notification: false

collectd_plugin_vmem_*
~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``vmem`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_vmem>`_ for details.

::

  collectd_plugin_vmem_verbose: False

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
      user: "username"
      password: "pass"
      verifypeer: true|false
      verifyhost: true|false
      cacert: "/etc/ssl/ca.crt"
      capath: "/etc/ssl/certs/"
      clientkey: "/etc/ssl/client.pem"
      clientcert: "/etc/ssl/client.crt"
      clientkeypass: "secret"
      headers:
        - "X-Custom-Header: custom_value"
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
      headers:
       - 'foo'

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
    other_topic:
      format: json
      store_rates: true

collectd_plugin_write_prometheus_*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
These vars are ones passed to the ``write_prometheus`` plugin.
See the collectd `config guide <https://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_write_prometheus>`_ for details.

::

  collectd_plugin_write_prometheus_port: 9103
  collectd_plugin_write_prometheus_staleness_delta: 300

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
