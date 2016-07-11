#------------------------------------------#
# AWS Outputs
#------------------------------------------#
output "elb_endpoint" {
    value = "${aws_elb.rancher_ha.dns_name}"
}

output "instance_a_ip" {
    value = "${aws_instance.rancher_ha_a.public_ip}"
}

/*output "instance_b_ip" {
    value = "${aws_instance.rancher_ha_b.public_ip}"
}

output "instance_c_ip" {
    value = "${aws_instance.rancher_ha_c.public_ip}"
}*/

output "CATTLE_DB_CATTLE_MYSQL_HOST" {
    value = "${aws_rds_cluster.rancher_ha.endpoint}"
}

output "CATTLE_DB_CATTLE_MYSQL_PORT" {
    value = "${aws_rds_cluster.rancher_ha.port}"
}

output "CATTLE_DB_CATTLE_MYSQL_NAME" {
    value = "${aws_rds_cluster.rancher_ha.database_name}"
}

output "CATTLE_DB_CATTLE_USERNAME" {
    value = "rancher"
}

output "CATTLE_DB_CATTLE_PASSWORD" {
    value = "${var.db_password}"
}

output "depends_id" { value = "${null_resource.wait_for_server.id}" }
