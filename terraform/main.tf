resource "aws_key_pair" "prometheuskey" {
  key_name = "prometheuskey.pub"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}

resource "aws_instance" "promethues" {
  ami = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.prometheuskey.key_name}"
  # the VPC subnet
  subnet_id = "${aws_subnet.main-public-1.id}"
  # the security group
   vpc_security_group_ids = ["${aws_security_group.main_security_group.id}"]
   provisioner "file" {
     source      = "prometheus/node_exporter.service"
     destination = "/tmp/node_exporter.service"
    }
   provisioner "file" {
     source      = "prometheus/prometheus.service"
     destination = "/tmp/prometheus.service"
    }
   provisioner "file" {
     source      = "prometheus/prometheus-1.8.yml"
     destination = "/tmp/prometheus-1.8.yml"
    }

   provisioner "file" {
     source      = "prometheus/Prometheus-1.8.sh"
     destination = "/tmp/Prometheus-1.8.sh"
    }

   provisioner "remote-exec" {
        inline = [
           "chmod +x /tmp/Prometheus-1.8.sh",
           "sudo  /tmp/Prometheus-1.8.sh"
        ]
    }
  
connection {
    user = "${var.INSTANCE_USERNAME}"
    private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
  }
}
