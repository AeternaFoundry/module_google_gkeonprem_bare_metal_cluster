resource "google_gkeonprem_bare_metal_cluster" "gkeonprem_bare_metal_clusters" {
  for_each = var.gkeonprem_bare_metal_clusters

  admin_cluster_membership = each.value.admin_cluster_membership
  bare_metal_version       = each.value.bare_metal_version
  location                 = each.value.location
  name                     = each.value.name
  annotations              = each.value.annotations
  deletion_policy          = each.value.deletion_policy
  description              = each.value.description
  project                  = each.value.project

  control_plane {
    dynamic "api_server_args" {
      for_each = each.value.control_plane.api_server_args != null ? each.value.control_plane.api_server_args : []
      content {
        argument = api_server_args.value.argument
        value    = api_server_args.value.value
      }
    }
    control_plane_node_pool_config {
      node_pool_config {
        labels = each.value.control_plane.control_plane_node_pool_config.node_pool_config.labels
        dynamic "node_configs" {
          for_each = each.value.control_plane.control_plane_node_pool_config.node_pool_config.node_configs != null ? each.value.control_plane.control_plane_node_pool_config.node_pool_config.node_configs : []
          content {
            labels  = node_configs.value.labels
            node_ip = node_configs.value.node_ip
          }
        }
        operating_system = each.value.control_plane.control_plane_node_pool_config.node_pool_config.operating_system
        dynamic "taints" {
          for_each = each.value.control_plane.control_plane_node_pool_config.node_pool_config.taints != null ? each.value.control_plane.control_plane_node_pool_config.node_pool_config.taints : []
          content {
            effect = taints.value.effect
            key    = taints.value.key
            value  = taints.value.value
          }
        }
      }
    }
  }

  load_balancer {
    dynamic "bgp_lb_config" {
      for_each = each.value.load_balancer.bgp_lb_config != null ? [each.value.load_balancer.bgp_lb_config] : []
      content {
        dynamic "address_pools" {
          for_each = bgp_lb_config.value.address_pools
          content {
            addresses       = address_pools.value.addresses
            avoid_buggy_ips = address_pools.value.avoid_buggy_ips
            manual_assign   = address_pools.value.manual_assign
            pool            = address_pools.value.pool
          }
        }
        asn = bgp_lb_config.value.asn
        dynamic "bgp_peer_configs" {
          for_each = bgp_lb_config.value.bgp_peer_configs
          content {
            asn                 = bgp_peer_configs.value.asn
            control_plane_nodes = bgp_peer_configs.value.control_plane_nodes
            ip_address          = bgp_peer_configs.value.ip_address
          }
        }
        dynamic "load_balancer_node_pool_config" {
          for_each = bgp_lb_config.value.load_balancer_node_pool_config != null ? [bgp_lb_config.value.load_balancer_node_pool_config] : []
          content {
            dynamic "node_pool_config" {
              for_each = load_balancer_node_pool_config.value.node_pool_config != null ? [load_balancer_node_pool_config.value.node_pool_config] : []
              content {
                dynamic "kubelet_config" {
                  for_each = node_pool_config.value.kubelet_config != null ? [node_pool_config.value.kubelet_config] : []
                  content {
                    registry_burst                 = kubelet_config.value.registry_burst
                    registry_pull_qps              = kubelet_config.value.registry_pull_qps
                    serialize_image_pulls_disabled = kubelet_config.value.serialize_image_pulls_disabled
                  }
                }
                labels = node_pool_config.value.labels
                dynamic "node_configs" {
                  for_each = node_pool_config.value.node_configs != null ? node_pool_config.value.node_configs : []
                  content {
                    labels  = node_configs.value.labels
                    node_ip = node_configs.value.node_ip
                  }
                }
                operating_system = node_pool_config.value.operating_system
                dynamic "taints" {
                  for_each = node_pool_config.value.taints != null ? node_pool_config.value.taints : []
                  content {
                    effect = taints.value.effect
                    key    = taints.value.key
                    value  = taints.value.value
                  }
                }
              }
            }
          }
        }
      }
    }
    dynamic "manual_lb_config" {
      for_each = each.value.load_balancer.manual_lb_config != null ? [each.value.load_balancer.manual_lb_config] : []
      content {
        enabled = manual_lb_config.value.enabled
      }
    }
    dynamic "metal_lb_config" {
      for_each = each.value.load_balancer.metal_lb_config != null ? [each.value.load_balancer.metal_lb_config] : []
      content {
        dynamic "address_pools" {
          for_each = metal_lb_config.value.address_pools
          content {
            addresses       = address_pools.value.addresses
            avoid_buggy_ips = address_pools.value.avoid_buggy_ips
            manual_assign   = address_pools.value.manual_assign
            pool            = address_pools.value.pool
          }
        }
        dynamic "load_balancer_node_pool_config" {
          for_each = metal_lb_config.value.load_balancer_node_pool_config != null ? [metal_lb_config.value.load_balancer_node_pool_config] : []
          content {
            dynamic "node_pool_config" {
              for_each = load_balancer_node_pool_config.value.node_pool_config != null ? [load_balancer_node_pool_config.value.node_pool_config] : []
              content {
                labels = node_pool_config.value.labels
                dynamic "node_configs" {
                  for_each = node_pool_config.value.node_configs != null ? node_pool_config.value.node_configs : []
                  content {
                    labels  = node_configs.value.labels
                    node_ip = node_configs.value.node_ip
                  }
                }
                operating_system = node_pool_config.value.operating_system
                dynamic "taints" {
                  for_each = node_pool_config.value.taints != null ? node_pool_config.value.taints : []
                  content {
                    effect = taints.value.effect
                    key    = taints.value.key
                    value  = taints.value.value
                  }
                }
              }
            }
          }
        }
      }
    }
    port_config {
      control_plane_load_balancer_port = each.value.load_balancer.port_config.control_plane_load_balancer_port
    }
    vip_config {
      control_plane_vip = each.value.load_balancer.vip_config.control_plane_vip
      ingress_vip       = each.value.load_balancer.vip_config.ingress_vip
    }
  }

  network_config {
    advanced_networking = each.value.network_config.advanced_networking
    dynamic "island_mode_cidr" {
      for_each = each.value.network_config.island_mode_cidr != null ? [each.value.network_config.island_mode_cidr] : []
      content {
        pod_address_cidr_blocks     = island_mode_cidr.value.pod_address_cidr_blocks
        service_address_cidr_blocks = island_mode_cidr.value.service_address_cidr_blocks
      }
    }
    dynamic "multiple_network_interfaces_config" {
      for_each = each.value.network_config.multiple_network_interfaces_config != null ? [each.value.network_config.multiple_network_interfaces_config] : []
      content {
        enabled = multiple_network_interfaces_config.value.enabled
      }
    }
    dynamic "sr_iov_config" {
      for_each = each.value.network_config.sr_iov_config != null ? [each.value.network_config.sr_iov_config] : []
      content {
        enabled = sr_iov_config.value.enabled
      }
    }
  }

  storage {
    lvp_node_mounts_config {
      path          = each.value.storage.lvp_node_mounts_config.path
      storage_class = each.value.storage.lvp_node_mounts_config.storage_class
    }
    lvp_share_config {
      lvp_config {
        path          = each.value.storage.lvp_share_config.lvp_config.path
        storage_class = each.value.storage.lvp_share_config.lvp_config.storage_class
      }
      shared_path_pv_count = each.value.storage.lvp_share_config.shared_path_pv_count
    }
  }

  dynamic "binary_authorization" {
    for_each = each.value.binary_authorization != null ? [each.value.binary_authorization] : []
    content {
      evaluation_mode = binary_authorization.value.evaluation_mode
    }
  }

  dynamic "cluster_operations" {
    for_each = each.value.cluster_operations != null ? [each.value.cluster_operations] : []
    content {
      enable_application_logs = cluster_operations.value.enable_application_logs
    }
  }

  dynamic "maintenance_config" {
    for_each = each.value.maintenance_config != null ? [each.value.maintenance_config] : []
    content {
      maintenance_address_cidr_blocks = maintenance_config.value.maintenance_address_cidr_blocks
    }
  }

  dynamic "node_access_config" {
    for_each = each.value.node_access_config != null ? [each.value.node_access_config] : []
    content {
      login_user = node_access_config.value.login_user
    }
  }

  dynamic "node_config" {
    for_each = each.value.node_config != null ? [each.value.node_config] : []
    content {
      container_runtime = node_config.value.container_runtime
      max_pods_per_node = node_config.value.max_pods_per_node
    }
  }

  dynamic "os_environment_config" {
    for_each = each.value.os_environment_config != null ? [each.value.os_environment_config] : []
    content {
      package_repo_excluded = os_environment_config.value.package_repo_excluded
    }
  }

  dynamic "proxy" {
    for_each = each.value.proxy != null ? [each.value.proxy] : []
    content {
      no_proxy = proxy.value.no_proxy
      uri      = proxy.value.uri
    }
  }

  dynamic "security_config" {
    for_each = each.value.security_config != null ? [each.value.security_config] : []
    content {
      dynamic "authorization" {
        for_each = security_config.value.authorization != null ? [security_config.value.authorization] : []
        content {
          dynamic "admin_users" {
            for_each = authorization.value.admin_users
            content {
              username = admin_users.value.username
            }
          }
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }

  dynamic "upgrade_policy" {
    for_each = each.value.upgrade_policy != null ? [each.value.upgrade_policy] : []
    content {
      policy = upgrade_policy.value.policy
    }
  }
}

