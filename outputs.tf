output "gkeonprem_bare_metal_clusters_id" {
  description = "Map of id values across all gkeonprem_bare_metal_clusters, keyed the same as var.gkeonprem_bare_metal_clusters except keys with no id are omitted"
  value       = { for k, v in google_gkeonprem_bare_metal_cluster.gkeonprem_bare_metal_clusters : k => v.id if v.id != null && length(v.id) > 0 }
}
output "gkeonprem_bare_metal_clusters_admin_cluster_membership" {
  description = "Map of admin_cluster_membership values across all gkeonprem_bare_metal_clusters, keyed the same as var.gkeonprem_bare_metal_clusters except keys with no admin_cluster_membership are omitted"
  value       = { for k, v in google_gkeonprem_bare_metal_cluster.gkeonprem_bare_metal_clusters : k => v.admin_cluster_membership if v.admin_cluster_membership != null && length(v.admin_cluster_membership) > 0 }
}
output "gkeonprem_bare_metal_clusters_annotations" {
  description = "Map of annotations values across all gkeonprem_bare_metal_clusters, keyed the same as var.gkeonprem_bare_metal_clusters except keys with no annotations are omitted"
  value       = { for k, v in google_gkeonprem_bare_metal_cluster.gkeonprem_bare_metal_clusters : k => v.annotations if v.annotations != null && length(v.annotations) > 0 }
}
output "gkeonprem_bare_metal_clusters_bare_metal_version" {
  description = "Map of bare_metal_version values across all gkeonprem_bare_metal_clusters, keyed the same as var.gkeonprem_bare_metal_clusters except keys with no bare_metal_version are omitted"
  value       = { for k, v in google_gkeonprem_bare_metal_cluster.gkeonprem_bare_metal_clusters : k => v.bare_metal_version if v.bare_metal_version != null && length(v.bare_metal_version) > 0 }
}
output "gkeonprem_bare_metal_clusters_binary_authorization" {
  description = "Map of binary_authorization values across all gkeonprem_bare_metal_clusters, keyed the same as var.gkeonprem_bare_metal_clusters except keys with no binary_authorization are omitted"
  value       = { for k, v in google_gkeonprem_bare_metal_cluster.gkeonprem_bare_metal_clusters : k => one(v.binary_authorization) if v.binary_authorization != null && length(v.binary_authorization) > 0 }
}
output "gkeonprem_bare_metal_clusters_cluster_operations" {
  description = "Map of cluster_operations values across all gkeonprem_bare_metal_clusters, keyed the same as var.gkeonprem_bare_metal_clusters except keys with no cluster_operations are omitted"
  value       = { for k, v in google_gkeonprem_bare_metal_cluster.gkeonprem_bare_metal_clusters : k => one(v.cluster_operations) if v.cluster_operations != null && length(v.cluster_operations) > 0 }
}
output "gkeonprem_bare_metal_clusters_control_plane" {
  description = "Map of control_plane values across all gkeonprem_bare_metal_clusters, keyed the same as var.gkeonprem_bare_metal_clusters except keys with no control_plane are omitted"
  value       = { for k, v in google_gkeonprem_bare_metal_cluster.gkeonprem_bare_metal_clusters : k => one(v.control_plane) if v.control_plane != null && length(v.control_plane) > 0 }
}
output "gkeonprem_bare_metal_clusters_create_time" {
  description = "Map of create_time values across all gkeonprem_bare_metal_clusters, keyed the same as var.gkeonprem_bare_metal_clusters except keys with no create_time are omitted"
  value       = { for k, v in google_gkeonprem_bare_metal_cluster.gkeonprem_bare_metal_clusters : k => v.create_time if v.create_time != null && length(v.create_time) > 0 }
}
output "gkeonprem_bare_metal_clusters_delete_time" {
  description = "Map of delete_time values across all gkeonprem_bare_metal_clusters, keyed the same as var.gkeonprem_bare_metal_clusters except keys with no delete_time are omitted"
  value       = { for k, v in google_gkeonprem_bare_metal_cluster.gkeonprem_bare_metal_clusters : k => v.delete_time if v.delete_time != null && length(v.delete_time) > 0 }
}
output "gkeonprem_bare_metal_clusters_deletion_policy" {
  description = "Map of deletion_policy values across all gkeonprem_bare_metal_clusters, keyed the same as var.gkeonprem_bare_metal_clusters except keys with no deletion_policy are omitted"
  value       = { for k, v in google_gkeonprem_bare_metal_cluster.gkeonprem_bare_metal_clusters : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "gkeonprem_bare_metal_clusters_description" {
  description = "Map of description values across all gkeonprem_bare_metal_clusters, keyed the same as var.gkeonprem_bare_metal_clusters except keys with no description are omitted"
  value       = { for k, v in google_gkeonprem_bare_metal_cluster.gkeonprem_bare_metal_clusters : k => v.description if v.description != null && length(v.description) > 0 }
}
output "gkeonprem_bare_metal_clusters_effective_annotations" {
  description = "Map of effective_annotations values across all gkeonprem_bare_metal_clusters, keyed the same as var.gkeonprem_bare_metal_clusters except keys with no effective_annotations are omitted"
  value       = { for k, v in google_gkeonprem_bare_metal_cluster.gkeonprem_bare_metal_clusters : k => v.effective_annotations if v.effective_annotations != null && length(v.effective_annotations) > 0 }
}
output "gkeonprem_bare_metal_clusters_endpoint" {
  description = "Map of endpoint values across all gkeonprem_bare_metal_clusters, keyed the same as var.gkeonprem_bare_metal_clusters except keys with no endpoint are omitted"
  value       = { for k, v in google_gkeonprem_bare_metal_cluster.gkeonprem_bare_metal_clusters : k => v.endpoint if v.endpoint != null && length(v.endpoint) > 0 }
}
output "gkeonprem_bare_metal_clusters_etag" {
  description = "Map of etag values across all gkeonprem_bare_metal_clusters, keyed the same as var.gkeonprem_bare_metal_clusters except keys with no etag are omitted"
  value       = { for k, v in google_gkeonprem_bare_metal_cluster.gkeonprem_bare_metal_clusters : k => v.etag if v.etag != null && length(v.etag) > 0 }
}
output "gkeonprem_bare_metal_clusters_fleet" {
  description = "Map of fleet values across all gkeonprem_bare_metal_clusters, keyed the same as var.gkeonprem_bare_metal_clusters except keys with no fleet are omitted"
  value       = { for k, v in google_gkeonprem_bare_metal_cluster.gkeonprem_bare_metal_clusters : k => v.fleet if v.fleet != null && length(v.fleet) > 0 }
}
output "gkeonprem_bare_metal_clusters_load_balancer" {
  description = "Map of load_balancer values across all gkeonprem_bare_metal_clusters, keyed the same as var.gkeonprem_bare_metal_clusters except keys with no load_balancer are omitted"
  value       = { for k, v in google_gkeonprem_bare_metal_cluster.gkeonprem_bare_metal_clusters : k => one(v.load_balancer) if v.load_balancer != null && length(v.load_balancer) > 0 }
}
output "gkeonprem_bare_metal_clusters_local_name" {
  description = "Map of local_name values across all gkeonprem_bare_metal_clusters, keyed the same as var.gkeonprem_bare_metal_clusters except keys with no local_name are omitted"
  value       = { for k, v in google_gkeonprem_bare_metal_cluster.gkeonprem_bare_metal_clusters : k => v.local_name if v.local_name != null && length(v.local_name) > 0 }
}
output "gkeonprem_bare_metal_clusters_location" {
  description = "Map of location values across all gkeonprem_bare_metal_clusters, keyed the same as var.gkeonprem_bare_metal_clusters except keys with no location are omitted"
  value       = { for k, v in google_gkeonprem_bare_metal_cluster.gkeonprem_bare_metal_clusters : k => v.location if v.location != null && length(v.location) > 0 }
}
output "gkeonprem_bare_metal_clusters_maintenance_config" {
  description = "Map of maintenance_config values across all gkeonprem_bare_metal_clusters, keyed the same as var.gkeonprem_bare_metal_clusters except keys with no maintenance_config are omitted"
  value       = { for k, v in google_gkeonprem_bare_metal_cluster.gkeonprem_bare_metal_clusters : k => one(v.maintenance_config) if v.maintenance_config != null && length(v.maintenance_config) > 0 }
}
output "gkeonprem_bare_metal_clusters_name" {
  description = "Map of name values across all gkeonprem_bare_metal_clusters, keyed the same as var.gkeonprem_bare_metal_clusters except keys with no name are omitted"
  value       = { for k, v in google_gkeonprem_bare_metal_cluster.gkeonprem_bare_metal_clusters : k => v.name if v.name != null && length(v.name) > 0 }
}
output "gkeonprem_bare_metal_clusters_network_config" {
  description = "Map of network_config values across all gkeonprem_bare_metal_clusters, keyed the same as var.gkeonprem_bare_metal_clusters except keys with no network_config are omitted"
  value       = { for k, v in google_gkeonprem_bare_metal_cluster.gkeonprem_bare_metal_clusters : k => one(v.network_config) if v.network_config != null && length(v.network_config) > 0 }
}
output "gkeonprem_bare_metal_clusters_node_access_config" {
  description = "Map of node_access_config values across all gkeonprem_bare_metal_clusters, keyed the same as var.gkeonprem_bare_metal_clusters except keys with no node_access_config are omitted"
  value       = { for k, v in google_gkeonprem_bare_metal_cluster.gkeonprem_bare_metal_clusters : k => one(v.node_access_config) if v.node_access_config != null && length(v.node_access_config) > 0 }
}
output "gkeonprem_bare_metal_clusters_node_config" {
  description = "Map of node_config values across all gkeonprem_bare_metal_clusters, keyed the same as var.gkeonprem_bare_metal_clusters except keys with no node_config are omitted"
  value       = { for k, v in google_gkeonprem_bare_metal_cluster.gkeonprem_bare_metal_clusters : k => one(v.node_config) if v.node_config != null && length(v.node_config) > 0 }
}
output "gkeonprem_bare_metal_clusters_os_environment_config" {
  description = "Map of os_environment_config values across all gkeonprem_bare_metal_clusters, keyed the same as var.gkeonprem_bare_metal_clusters except keys with no os_environment_config are omitted"
  value       = { for k, v in google_gkeonprem_bare_metal_cluster.gkeonprem_bare_metal_clusters : k => one(v.os_environment_config) if v.os_environment_config != null && length(v.os_environment_config) > 0 }
}
output "gkeonprem_bare_metal_clusters_project" {
  description = "Map of project values across all gkeonprem_bare_metal_clusters, keyed the same as var.gkeonprem_bare_metal_clusters except keys with no project are omitted"
  value       = { for k, v in google_gkeonprem_bare_metal_cluster.gkeonprem_bare_metal_clusters : k => v.project if v.project != null && length(v.project) > 0 }
}
output "gkeonprem_bare_metal_clusters_proxy" {
  description = "Map of proxy values across all gkeonprem_bare_metal_clusters, keyed the same as var.gkeonprem_bare_metal_clusters except keys with no proxy are omitted"
  value       = { for k, v in google_gkeonprem_bare_metal_cluster.gkeonprem_bare_metal_clusters : k => one(v.proxy) if v.proxy != null && length(v.proxy) > 0 }
}
output "gkeonprem_bare_metal_clusters_reconciling" {
  description = "Map of reconciling values across all gkeonprem_bare_metal_clusters, keyed the same as var.gkeonprem_bare_metal_clusters except keys with no reconciling are omitted"
  value       = { for k, v in google_gkeonprem_bare_metal_cluster.gkeonprem_bare_metal_clusters : k => v.reconciling if v.reconciling != null }
}
output "gkeonprem_bare_metal_clusters_security_config" {
  description = "Map of security_config values across all gkeonprem_bare_metal_clusters, keyed the same as var.gkeonprem_bare_metal_clusters except keys with no security_config are omitted"
  value       = { for k, v in google_gkeonprem_bare_metal_cluster.gkeonprem_bare_metal_clusters : k => one(v.security_config) if v.security_config != null && length(v.security_config) > 0 }
}
output "gkeonprem_bare_metal_clusters_state" {
  description = "Map of state values across all gkeonprem_bare_metal_clusters, keyed the same as var.gkeonprem_bare_metal_clusters except keys with no state are omitted"
  value       = { for k, v in google_gkeonprem_bare_metal_cluster.gkeonprem_bare_metal_clusters : k => v.state if v.state != null && length(v.state) > 0 }
}
output "gkeonprem_bare_metal_clusters_status" {
  description = "Map of status values across all gkeonprem_bare_metal_clusters, keyed the same as var.gkeonprem_bare_metal_clusters except keys with no status are omitted"
  value       = { for k, v in google_gkeonprem_bare_metal_cluster.gkeonprem_bare_metal_clusters : k => v.status if v.status != null && length(v.status) > 0 }
}
output "gkeonprem_bare_metal_clusters_storage" {
  description = "Map of storage values across all gkeonprem_bare_metal_clusters, keyed the same as var.gkeonprem_bare_metal_clusters except keys with no storage are omitted"
  value       = { for k, v in google_gkeonprem_bare_metal_cluster.gkeonprem_bare_metal_clusters : k => one(v.storage) if v.storage != null && length(v.storage) > 0 }
}
output "gkeonprem_bare_metal_clusters_uid" {
  description = "Map of uid values across all gkeonprem_bare_metal_clusters, keyed the same as var.gkeonprem_bare_metal_clusters except keys with no uid are omitted"
  value       = { for k, v in google_gkeonprem_bare_metal_cluster.gkeonprem_bare_metal_clusters : k => v.uid if v.uid != null && length(v.uid) > 0 }
}
output "gkeonprem_bare_metal_clusters_update_time" {
  description = "Map of update_time values across all gkeonprem_bare_metal_clusters, keyed the same as var.gkeonprem_bare_metal_clusters except keys with no update_time are omitted"
  value       = { for k, v in google_gkeonprem_bare_metal_cluster.gkeonprem_bare_metal_clusters : k => v.update_time if v.update_time != null && length(v.update_time) > 0 }
}
output "gkeonprem_bare_metal_clusters_upgrade_policy" {
  description = "Map of upgrade_policy values across all gkeonprem_bare_metal_clusters, keyed the same as var.gkeonprem_bare_metal_clusters except keys with no upgrade_policy are omitted"
  value       = { for k, v in google_gkeonprem_bare_metal_cluster.gkeonprem_bare_metal_clusters : k => one(v.upgrade_policy) if v.upgrade_policy != null && length(v.upgrade_policy) > 0 }
}
output "gkeonprem_bare_metal_clusters_validation_check" {
  description = "Map of validation_check values across all gkeonprem_bare_metal_clusters, keyed the same as var.gkeonprem_bare_metal_clusters except keys with no validation_check are omitted"
  value       = { for k, v in google_gkeonprem_bare_metal_cluster.gkeonprem_bare_metal_clusters : k => v.validation_check if v.validation_check != null && length(v.validation_check) > 0 }
}

