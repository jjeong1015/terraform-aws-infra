# terraform-aws-infra
## ✏️ 명령어
```bash
$ aws --version
```

```bash
$ sudo -i
```

```bash
# wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
# echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
# apt-get update && apt-get install terraform -y
# terraform -version
# exit
```

```bash
$ terraform init
$ terraform plan
$ terraform apply -auto-approve
```

## ✏️ 역할
**provider.tf**: Terraform이 AWS와 상호작용할 수 있도록 AWS provider를 설정한다.<br>
**ec2.tf**: EC2 인스턴스를 생성하고 설정한다.<br>
**s3.tf**: S3 버킷을 생성하고 설정한다.<br>
**iampolicy.tf**: EC2 인스턴스가 S3에 접근할 수 있도록 IAM 역할과 정책을 설정한다.<br>
**endpoint.tf**: VPC 엔드포인트를 생성하여 EC2와 S3 간의 통신을 최적화한다.<br>
**upload_main.tf**: S3에 업로드할 HTML 파일을 관리하는 주요 설정 파일이다.<br>
**upload_new_index.tf**: 새로운 HTML 파일을 생성하거나 기존 인덱스 파일을 업데이트하는 작업을 정의한다.<br>
**modify_index.tf**: AWS 리소스나 HTML 파일의 인덱스를 수정하거나 갱신하는 작업을 정의한다.<br>

**iampolicy2.tf**: EC2 인스턴스가 S3에 접근할 수 있는 IAM 역할과 정책을 설정한다.<br>
**vpc.tf**: AWS 네트워크 인프라를 위한 VPC를 생성한다.<br>
**web-subnets.tf**: 외부에서 접근 가능한 두 개의 퍼블릭 서브넷을 생성한다.<br>
**-subnets.tf**: 두 개의 프라이빗 애플리케이션 서브넷을 생성한다.<br>
**internet-gw.tf**: VPC가 인터넷에 연결될 수 있도록 인터넷 게이트웨이를 생성한다.<br>
**eip.tf**: NAT 게이트웨이에 사용할 Elastic IP를 생성한다.<br>
**nat-gw.tf**: 프라이빗 서브넷의 외부 통신을 위해 NAT 게이트웨이를 생성한다.<br>
**public-rt.tf**: 퍼블릭 서브넷에서 인터넷 게이트웨이를 통해 인터넷으로 나가는 라우팅 테이블을 설정한다.<br>
**private-rt.tf**: 프라이빗 서브넷에서 NAT 게이트웨이를 통해 인터넷으로 나가는 라우팅 테이블을 설정한다.<br>
