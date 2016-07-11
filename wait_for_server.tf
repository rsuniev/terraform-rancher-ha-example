resource "null_resource" "wait_for_server" {
  #depends_on = [ "aws_instance.rancher_ha_a" ]

    connection {
      user = "${var.rancher_username}"
      private_key = "${file("${var.key_path}")}"
      host = "${aws_instance.rancher_ha_a.public_ip}"
    }

    provisioner "remote-exec" {
        inline = [
          "sudo su -",
          "docker pull radial/busyboxplus:curl",
          "echo 'docker run --rm radial/busyboxplus:curl curl $@' > /usr/bin/curl && chmod +x /usr/bin/curl",
          "TRY=0;until [ $(curl -s -o /dev/null -w \"%{http_code}\" \"http://${aws_instance.rancher_ha_a.public_ip}:8080\" ) == 401 ] || [ $TRY -gt 15 ]; do echo \"Waiting for rancher server\";sleep 5;let \"TRY++\";done",
        ]
    }
}
