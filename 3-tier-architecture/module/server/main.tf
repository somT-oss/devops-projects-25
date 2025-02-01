resource "aws_vpc" "webserver_vpc" {
    cidr_block = var.vpc_cidr_block_ip

    tags = {
        Name = "webserver_vpc"
    }
}

resource "aws_subnet" "webserver_subnet" {
    vpc_id = aws_vpc.webserver_vpc.id
    cidr_block = var.subnet_cidr_block_ip
    availability_zone = var.availability_zone
    map_public_ip_on_launch = true
    

    tags = {
        Name = "webserver_subnet"
    }
    depends_on = [aws_vpc.webserver_vpc]
}

resource "aws_internet_gateway" "webserver_ig" {
    vpc_id = aws_vpc.webserver_vpc.id

    tags = {
        Name = "webserver_ig"
    }
}

resource "aws_route_table" "webserver_rt" {
    vpc_id = aws_vpc.webserver_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.webserver_ig.id
    }

    tags = {
        Name = "webserver_rt"
    }
}

resource "aws_route_table_association" "webserver_rta" {
    subnet_id = aws_subnet.webserver_subnet.id
    route_table_id = aws_route_table.webserver_rt.id
}

resource "aws_security_group" "webserver_sg" {
    name = var.sg_name
    vpc_id = aws_vpc.webserver_vpc.id

    # Allow HTTP connections to port 80
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    # Allow SSH connection to port 22
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    # Allow all outbound traffic
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1" # All protocols
        cidr_blocks =  ["0.0.0.0/0"]
    }

    tags = {
      Name = "webserver_sg"
    }
    depends_on = [aws_vpc.webserver_vpc]
}


resource "aws_instance" "webserver" {
    ami = var.instance_ami
    instance_type = var.instance_type
    associate_public_ip_address = true
    subnet_id = aws_subnet.webserver_subnet.id
    vpc_security_group_ids = [aws_security_group.webserver_sg.id]

    credit_specification {
        cpu_credits = "standard"
    }

    tags = {
      Name = "webserver1"
    }

    user_data = <<-EOF
    #!/bin/bash
    sudo apt update -y
    sudo apt install -y nginx
    sudo systemctl enable nginx
    sudo systemctl start nginx
    EOF


    depends_on = [ aws_security_group.webserver_sg ]
}