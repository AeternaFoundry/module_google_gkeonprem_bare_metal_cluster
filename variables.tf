variable "gkeonprem_bare_metal_clusters" {
  description = <<EOT
Map of gkeonprem_bare_metal_clusters, attributes below
Required:
    - admin_cluster_membership
    - bare_metal_version
    - location
    - name
    - control_plane (block):
        - api_server_args (optional, block):
            - argument (required)
            - value (required)
        - control_plane_node_pool_config (required, block):
            - node_pool_config (required, block):
                - labels (optional)
                - node_configs (optional, block):
                    - labels (optional)
                    - node_ip (optional)
                - operating_system (optional)
                - taints (optional, block):
                    - effect (optional)
                    - key (optional)
                    - value (optional)
    - load_balancer (block):
        - bgp_lb_config (optional, block):
            - address_pools (required, block):
                - addresses (required)
                - avoid_buggy_ips (optional)
                - manual_assign (optional)
                - pool (required)
            - asn (required)
            - bgp_peer_configs (required, block):
                - asn (required)
                - control_plane_nodes (optional)
                - ip_address (required)
            - load_balancer_node_pool_config (optional, block):
                - node_pool_config (optional, block):
                    - kubelet_config (optional, block):
                        - registry_burst (optional)
                        - registry_pull_qps (optional)
                        - serialize_image_pulls_disabled (optional)
                    - labels (optional)
                    - node_configs (optional, block):
                        - labels (optional)
                        - node_ip (optional)
                    - operating_system (optional)
                    - taints (optional, block):
                        - effect (optional)
                        - key (optional)
                        - value (optional)
        - manual_lb_config (optional, block):
            - enabled (required)
        - metal_lb_config (optional, block):
            - address_pools (required, block):
                - addresses (required)
                - avoid_buggy_ips (optional)
                - manual_assign (optional)
                - pool (required)
            - load_balancer_node_pool_config (optional, block):
                - node_pool_config (optional, block):
                    - labels (optional)
                    - node_configs (optional, block):
                        - labels (optional)
                        - node_ip (optional)
                    - operating_system (optional)
                    - taints (optional, block):
                        - effect (optional)
                        - key (optional)
                        - value (optional)
        - port_config (required, block):
            - control_plane_load_balancer_port (required)
        - vip_config (required, block):
            - control_plane_vip (required)
            - ingress_vip (required)
    - network_config (block):
        - advanced_networking (optional)
        - island_mode_cidr (optional, block):
            - pod_address_cidr_blocks (required)
            - service_address_cidr_blocks (required)
        - multiple_network_interfaces_config (optional, block):
            - enabled (optional)
        - sr_iov_config (optional, block):
            - enabled (optional)
    - storage (block):
        - lvp_node_mounts_config (required, block):
            - path (required)
            - storage_class (required)
        - lvp_share_config (required, block):
            - lvp_config (required, block):
                - path (required)
                - storage_class (required)
            - shared_path_pv_count (optional)
Optional:
    - annotations
    - deletion_policy
    - description
    - project
    - binary_authorization (block):
        - evaluation_mode (optional)
    - cluster_operations (block):
        - enable_application_logs (optional)
    - maintenance_config (block):
        - maintenance_address_cidr_blocks (required)
    - node_access_config (block):
        - login_user (optional)
    - node_config (block):
        - container_runtime (optional)
        - max_pods_per_node (optional)
    - os_environment_config (block):
        - package_repo_excluded (required)
    - proxy (block):
        - no_proxy (optional)
        - uri (required)
    - security_config (block):
        - authorization (optional, block):
            - admin_users (required, block):
                - username (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
    - upgrade_policy (block):
        - policy (optional)
EOT

  type = map(object({
    admin_cluster_membership = string
    bare_metal_version       = string
    location                 = string
    name                     = string
    annotations              = optional(map(string))
    deletion_policy          = optional(string)
    description              = optional(string)
    project                  = optional(string)
    control_plane = object({
      api_server_args = optional(list(object({
        argument = string
        value    = string
      })))
      control_plane_node_pool_config = object({
        node_pool_config = object({
          labels = optional(map(string))
          node_configs = optional(list(object({
            labels  = optional(map(string))
            node_ip = optional(string)
          })))
          operating_system = optional(string)
          taints = optional(list(object({
            effect = optional(string)
            key    = optional(string)
            value  = optional(string)
          })))
        })
      })
    })
    load_balancer = object({
      bgp_lb_config = optional(object({
        address_pools = list(object({
          addresses       = list(string)
          avoid_buggy_ips = optional(bool)
          manual_assign   = optional(bool)
          pool            = string
        }))
        asn = number
        bgp_peer_configs = list(object({
          asn                 = number
          control_plane_nodes = optional(list(string))
          ip_address          = string
        }))
        load_balancer_node_pool_config = optional(object({
          node_pool_config = optional(object({
            kubelet_config = optional(object({
              registry_burst                 = optional(number)
              registry_pull_qps              = optional(number)
              serialize_image_pulls_disabled = optional(bool)
            }))
            labels = optional(map(string))
            node_configs = optional(list(object({
              labels  = optional(map(string))
              node_ip = optional(string)
            })))
            operating_system = optional(string)
            taints = optional(list(object({
              effect = optional(string)
              key    = optional(string)
              value  = optional(string)
            })))
          }))
        }))
      }))
      manual_lb_config = optional(object({
        enabled = bool
      }))
      metal_lb_config = optional(object({
        address_pools = list(object({
          addresses       = list(string)
          avoid_buggy_ips = optional(bool)
          manual_assign   = optional(bool)
          pool            = string
        }))
        load_balancer_node_pool_config = optional(object({
          node_pool_config = optional(object({
            labels = optional(map(string))
            node_configs = optional(list(object({
              labels  = optional(map(string))
              node_ip = optional(string)
            })))
            operating_system = optional(string)
            taints = optional(list(object({
              effect = optional(string)
              key    = optional(string)
              value  = optional(string)
            })))
          }))
        }))
      }))
      port_config = object({
        control_plane_load_balancer_port = number
      })
      vip_config = object({
        control_plane_vip = string
        ingress_vip       = string
      })
    })
    network_config = object({
      advanced_networking = optional(bool)
      island_mode_cidr = optional(object({
        pod_address_cidr_blocks     = list(string)
        service_address_cidr_blocks = list(string)
      }))
      multiple_network_interfaces_config = optional(object({
        enabled = optional(bool)
      }))
      sr_iov_config = optional(object({
        enabled = optional(bool)
      }))
    })
    storage = object({
      lvp_node_mounts_config = object({
        path          = string
        storage_class = string
      })
      lvp_share_config = object({
        lvp_config = object({
          path          = string
          storage_class = string
        })
        shared_path_pv_count = optional(number)
      })
    })
    binary_authorization = optional(object({
      evaluation_mode = optional(string)
    }))
    cluster_operations = optional(object({
      enable_application_logs = optional(bool)
    }))
    maintenance_config = optional(object({
      maintenance_address_cidr_blocks = list(string)
    }))
    node_access_config = optional(object({
      login_user = optional(string)
    }))
    node_config = optional(object({
      container_runtime = optional(string)
      max_pods_per_node = optional(number)
    }))
    os_environment_config = optional(object({
      package_repo_excluded = bool
    }))
    proxy = optional(object({
      no_proxy = optional(list(string))
      uri      = string
    }))
    security_config = optional(object({
      authorization = optional(object({
        admin_users = list(object({
          username = string
        }))
      }))
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
    upgrade_policy = optional(object({
      policy = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.gkeonprem_bare_metal_clusters : (
        v.load_balancer.bgp_lb_config == null || (length(v.load_balancer.bgp_lb_config.address_pools) >= 1)
      )
    ])
    error_message = "Each address_pools list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.gkeonprem_bare_metal_clusters : (
        v.load_balancer.bgp_lb_config == null || (length(v.load_balancer.bgp_lb_config.bgp_peer_configs) >= 1)
      )
    ])
    error_message = "Each bgp_peer_configs list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.gkeonprem_bare_metal_clusters : (
        v.load_balancer.metal_lb_config == null || (length(v.load_balancer.metal_lb_config.address_pools) >= 1)
      )
    ])
    error_message = "Each address_pools list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.gkeonprem_bare_metal_clusters : (
        v.security_config == null || (v.security_config.authorization == null || (length(v.security_config.authorization.admin_users) >= 1))
      )
    ])
    error_message = "Each admin_users list must contain at least 1 items"
  }
  # Note: 6 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

