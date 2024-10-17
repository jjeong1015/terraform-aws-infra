# nat gateway 사용을 위한 선행 작업

# Elastic IP 생성
resource "aws_eip" "eip" {
  # 이 Elastic IP가 VPC에 연결될 것임을 지정.
  domain = "vpc"

  # 태그를 추가하여 식별하기 쉽게 설정할 수 있음.
  tags = {
    Name = "ce26-terraform-eip"  # Elastic IP의 이름
  }
}