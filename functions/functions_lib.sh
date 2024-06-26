#!/bin/sh

host_configuration() {
  check_1
  check_1_1
  check_1_1_1
  check_1_1_2
  check_1_1_3
  check_1_1_4
  check_1_1_5
  check_1_1_6
  check_1_1_7
  check_1_1_8
  check_1_1_9
  check_1_1_10
  check_1_1_11
  check_1_1_12
  check_1_1_13
  check_1_1_14
  check_1_1_15
  check_1_1_16
  check_1_1_17
  check_1_1_18
  check_1_2
  check_1_2_1
  check_1_2_2
  check_1_end
}

host_configuration_level1() {
  check_1
  check_1_end
}

linux_hosts_specific_configuration() {
  check_1_1
  check_1_1_1
  check_1_1_2
  check_1_1_3
  check_1_1_4
  check_1_1_5
  check_1_1_6
  check_1_1_7
  check_1_1_8
  check_1_1_9
  check_1_1_10
  check_1_1_11
  check_1_1_12
  check_1_1_13
  check_1_1_14
  check_1_1_15
  check_1_1_16
  check_1_1_17
  check_1_1_18
}

host_general_configuration() {
  check_1
  check_1_2
  make_check "1_2_1" "Ensure a separate partition for containers has been created"
  check_1_2_2
  check_1_end
}

docker_daemon_configuration() {
  check_2
  make_check "2_1" "Ensure network traffic is restricted between containers on the default bridge"
  make_check "2_2" "Ensure the logging level is set to 'info'"
  make_check "2_3" "Ensure Docker is allowed to make changes to iptables"
  make_check "2_4" "Ensure insecure registries are not used"
  make_check "2_5" "Ensure aufs storage driver is not used"
  check_2_6
  check_2_7
  make_check "2_8" "Enable user namespace support"
  check_2_9
  make_check "2_10" "Ensure base device size is not changed until needed"
  make_check "2_11" "Ensure that authorization for Docker client commands is enabled"
  make_check "2_12" "Ensure centralized and remote logging is configured"
  make_check "2_13" "Ensure live restore is Enabled"
  make_check "2_14" "Ensure Userland Proxy is Disabled"
  check_2_15
  check_2_16
  check_2_17
  check_2_18
  check_2_end
}

docker_daemon_configuration_level1() {
  check_2
  check_2_end
}

docker_daemon_files() {
  check_3
  check_3_1
  check_3_2
  check_3_3
  check_3_4
  check_3_5
  check_3_6
  check_3_7
  check_3_8
  check_3_9
  check_3_10
  check_3_11
  check_3_12
  check_3_13
  check_3_14
  check_3_15
  check_3_16
  check_3_17
  check_3_18
  check_3_19
  check_3_20
  check_3_21
  check_3_22
  check_3_23
  check_3_24
  check_3_end
}

docker_daemon_files_level1() {
  check_3
  check_3_end
}

container_images() {
  check_4
  check_4_1
  check_4_2
  check_4_3
  check_4_4
  check_4_5
  check_4_6
  check_4_7
  check_4_8
  check_4_9
  check_4_10
  check_4_11
  check_4_12
  check_4_end
}

container_images_level1() {
  check_4
  check_4_end
}

container_runtime() {
  check_5
  check_running_containers
  check_5_1
  check_5_2
  check_5_3
  check_5_4
  check_5_5
  check_5_6
  check_5_7
  check_5_8
  check_5_9
  check_5_10
  check_5_11
  check_5_12
  check_5_13
  check_5_14
  check_5_15
  check_5_16
  check_5_17
  check_5_18
  check_5_19
  check_5_20
  check_5_21
  check_5_22
  check_5_23
  check_5_24
  check_5_25
  check_5_26
  check_5_27
  check_5_28
  check_5_29
  check_5_30
  check_5_31
  check_5_end
}

container_runtime_level1() {
  check_5
  check_5_end
}

docker_security_operations() {
  check_6
  check_6_1
  check_6_2
  check_6_end
}

docker_security_operations_level1() {
  check_6
  check_6_1
  check_6_2
  check_6_end
}

docker_swarm_configuration() {
  check_7
  make_check "7.1" "Ensure swarm mode is not Enabled, if not needed"
  make_check "7.2" "Ensure that the minimum number of manager nodes have been created in a swarm"
  make_check "7.3" "Ensure that swarm services are bound to a specific host interface"
  check_7_4
  check_7_5
  make_check "7.6" "Ensure that swarm manager is run in auto-lock mode"
  check_7_7
  check_7_8
  check_7_9
  check_7_10
  check_7_end
}

docker_swarm_configuration_level1() {
  check_7
  check_7_end
}

docker_enterprise_configuration() {
  check_8
  check_product_license
  check_8_1
  check_8_1_1
  check_8_1_2
  check_8_1_3
  check_8_1_4
  check_8_1_5
  check_8_1_6
  check_8_1_7
  check_8_2
  check_8_2_1
  check_8_end
}

docker_enterprise_configuration_level1() {
  check_8
  check_product_license
  check_8_1
  check_8_1_1
  check_8_1_2
  check_8_1_3
  check_8_1_4
  check_8_1_5
  check_8_1_6
  check_8_1_7
  check_8_2
  check_8_2_1
  check_8_end
}

universal_control_plane_configuration() {
  check_8
  check_8_1
  check_8_1_1
  check_8_1_2
  check_8_1_3
  check_8_1_4
  check_8_1_5
  check_8_1_6
  check_8_1_7
  check_8_end
}

docker_trusted_registry_configuration() {
  check_8
  check_8_2
  check_8_2_1
  check_8_end
}

community_checks() {
  check_c
  check_c_1
  check_c_1_1
  check_c_2
  check_c_5_3_1
  check_c_5_3_2
  check_c_5_3_3
  check_c_5_3_4
  check_c_end
}

# CIS
cis() {
  host_configuration
  docker_daemon_configuration
  docker_daemon_files
  container_images
  container_runtime
  docker_security_operations
  docker_swarm_configuration
}

cis_level1() {
  host_configuration_level1
  docker_daemon_configuration_level1
  docker_daemon_files_level1
  container_images_level1
  container_runtime_level1
  docker_security_operations_level1
  docker_swarm_configuration_level1
}

# Community contributed
community() {
  community_checks
}

# All
all() {
  cis
  docker_enterprise_configuration
  community
}
