output "server_vpc_id" {
    value = aws_vpc.webserver_vpc.id
}

output "webserver_id" {
    value = aws_instance.webserver.id
}

output "webserver_sg_id" {
    value = aws_security_group.webserver_sg.id
}

output "webserver_subnet_1_id" {
    value = aws_subnet.webserver_subnet_1.id
}

output "webserver_subnet_2_id" {
    value = aws_subnet.webserver_subnet_2.id
}