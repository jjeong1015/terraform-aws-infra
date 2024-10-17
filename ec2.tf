# AWS provider 설정
provider "aws" {
  region = "ap-northeast-2"  # 서울 리전 설정
}

# EC2 인스턴스 생성
resource "aws_instance" "ce26-ec2" {
  ami           = "ami-0bcdae8006538619a"  # Ubuntu 22.04 LTS AMI ID
  instance_type = "t2.micro"               # 인스턴스 유형 (프리 티어 사용 가능)

  # 키페어 설정 (요청하신 키페어 이름 사용)
  key_name = "ce26-key"

  # 인스턴스 태그
  tags = {
    Name = "ce26-ec2"
  }

  # 네트워크 인터페이스 설정 (선택 사항)
  associate_public_ip_address = true  # 퍼블릭 IP를 할당

  # 인스턴스에 연결할 보안 그룹
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
}

# 보안 그룹 생성 (SSH 접근 허용)
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh_26"
  description = "Allow SSH inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # 모든 IP에서 SSH 접근 허용 (보안 상 변경 필요)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # 모든 트래픽 허용
    cidr_blocks = ["0.0.0.0/0"]
  }
}