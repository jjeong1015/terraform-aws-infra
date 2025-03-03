# 🚀 Terraform을 활용한 AWS 인프라 구축

## 📌 Terraform이란?
**Terraform**은 HashiCorp에서 개발한 **오픈소스 인프라스트럭처 코드(IaC, Infrastructure as Code) 도구**입니다.
AWS, Azure, GCP와 같은 클라우드 인프라를 코드로 정의하고 관리할 수 있도록 도와줍니다.

<br>

## 🛠 Terraform의 작동 방식
Terraform은 **선언형(Declarative)** 방식으로 인프라를 정의하고 관리합니다.
즉, "어떤 상태의 인프라를 원하는지"를 코드로 작성하면 Terraform이 이를 자동으로 구성하고 조정합니다.

### 🏗️ 주요 동작 원리
1. **Terraform Init (`terraform init`)**
   - Terraform 프로젝트를 초기화하고 필요한 플러그인을 다운로드합니다.
2. **Terraform Plan (`terraform plan`)**
   - 실행 전에 어떤 변경 사항이 적용될지 미리 확인할 수 있습니다.
3. **Terraform Apply (`terraform apply -auto-approve`)**
   - 정의한 인프라를 실제 AWS 환경에 적용합니다.
4. **Terraform Destroy (`terraform destroy`)**
   - 생성된 모든 리소스를 제거합니다.

<br>

## ✅ Terraform을 사용하는 이유
1. **자동화된 인프라 관리**
   - 클릭 몇 번으로 리소스를 생성하는 것이 아니라, 코드를 통해 인프라를 자동으로 생성, 수정, 삭제할 수 있습니다.
2. **버전 관리 가능**
   - Git과 같은 버전 관리 시스템과 결합하여 인프라 변경 사항을 추적할 수 있습니다.
3. **일관성 유지**
   - 동일한 코드를 사용하면 개발, 테스트, 운영 환경에서 일관된 인프라 구성이 가능합니다.
4. **빠른 배포**
   - 코드 한 줄만 수정하면 전체 인프라가 변경되므로 효율적인 운영이 가능합니다.

<br>

## 🌍 AWS 인프라 구성 파일 설명
### 📁 주요 Terraform 파일 및 역할

| 파일명 | 역할 |
|--------|------------------------------------------------------------------|
| `provider.tf` | Terraform이 AWS와 상호작용할 수 있도록 AWS Provider를 설정합니다. |
| `ec2.tf` | EC2 인스턴스를 생성하고 설정합니다. |
| `s3.tf` | S3 버킷을 생성하고 설정합니다. |
| `iampolicy.tf` | EC2 인스턴스가 S3에 접근할 수 있도록 IAM 역할과 정책을 설정합니다. |
| `endpoint.tf` | VPC 엔드포인트를 생성하여 EC2와 S3 간의 통신을 최적화합니다. |
| `upload_main.tf` | S3에 업로드할 HTML 파일을 관리하는 주요 설정 파일입니다. |
| `upload_new_index.tf` | 새로운 HTML 파일을 생성하거나 기존 인덱스 파일을 업데이트합니다. |
| `modify_index.tf` | AWS 리소스나 HTML 파일의 인덱스를 수정하거나 갱신합니다. |
| `iampolicy2.tf` | EC2 인스턴스가 S3에 접근할 수 있는 IAM 역할과 정책을 설정합니다. |
| `vpc.tf` | AWS 네트워크 인프라를 위한 VPC를 생성합니다. |
| `web-subnets.tf` | 외부에서 접근 가능한 두 개의 퍼블릭 서브넷을 생성합니다. |
| `subnets.tf` | 두 개의 프라이빗 애플리케이션 서브넷을 생성합니다. |
| `internet-gw.tf` | VPC가 인터넷에 연결될 수 있도록 인터넷 게이트웨이를 생성합니다. |
| `eip.tf` | NAT 게이트웨이에 사용할 Elastic IP를 생성합니다. |
| `nat-gw.tf` | 프라이빗 서브넷의 외부 통신을 위해 NAT 게이트웨이를 생성합니다. |
| `public-rt.tf` | 퍼블릭 서브넷에서 인터넷 게이트웨이를 통해 인터넷으로 나가는 라우팅 테이블을 설정합니다. |
| `private-rt.tf` | 프라이빗 서브넷에서 NAT 게이트웨이를 통해 인터넷으로 나가는 라우팅 테이블을 설정합니다. |

<br>

## 📌 Terraform 명령어 정리
```sh
# AWS CLI 버전 확인
$ aws --version

# Terraform 설치
$ sudo -i
# HashiCorp GPG Key 추가
# (Ubuntu 기준 설치)
$ wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
$ echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
$ apt-get update && apt-get install terraform -y
$ terraform -version
$ exit

# Terraform 초기화
$ terraform init

# 변경 사항 미리 보기
$ terraform plan

# 변경 사항 적용
$ terraform apply -auto-approve

# 리소스 삭제 (주의 필요)
$ terraform destroy
```

<br>

## 📢 결론
Terraform을 활용하면 **AWS 인프라를 코드로 관리하면서 자동화, 일관성, 버전 관리를 극대화할 수 있습니다**.
본 프로젝트에서는 EC2, S3, VPC 등의 리소스를 정의하여 **클라우드 환경을 효율적으로 구성하는 방법을 학습할 수 있습니다**.
