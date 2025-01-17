# Prerequisites for using Cloud Lab

- 본 학기 클라우드서비스의 활용 Lab은 온라인 이벤트스토밍 도구인 MSAEz(https://labs.msaez.io)와 온라인 개발환경인 GitPod에서 진행된다.
  - 내 로컬 머신에 설치해야 하는 소프트웨어는 전혀 없음

- MSAEz는 마이크로서비스의 최신 분석/설계 방법론인 EventStorming을 온라인 환경에서 완벽 제공해 주는 혁신적인 도구이다. 

- GitPod는 Git기반 형상서버인 Github, 또는 Gitlab상에서 VSCode(Visual Studio Code) 통합 IDE 도구를 제공해 주는 무료  플랫폼이다.
  - GitPod는 웹브라우저 Github 레포지토리에서 URL앞에 gitpod.io/# 를 붙이면 손쉽게 Gitpod IDE로 들어갈 수 있다.


## About MSAEz
![image](https://user-images.githubusercontent.com/35618409/190940132-b2223bc1-eec1-4821-bc2e-44908b54e9e3.png)

- MSAEz 자세히 알아보기 (https://intro-kor.msaez.io/started/)

## Prepare GitHub Account (Just once)
- 본 클라우드서비스(Microservices) 학기동안 사용할 내 Local Machine 에
  - 학습을 수강하는 Local 머신에 Chrome 브라우저가 설치되어 있어야 한다.
  - Gihub 가입 : https://github.com 도메인에 회원가입(sign-up) 후, 반드시 입력한 메일주소에서 확인까지 수행

- 클라우드서비스(Microservices) Lab을 내 GitHub 계정으로 복사
  - 먼저, Chrome 브라우저를 실행하고 Github에 로그인한다.
  - https://github.com/acmexii/msaez-labs에 접속 후, 해당 리소스를 Fork하여 나의 Git계정으로 복사한다.
![image](https://user-images.githubusercontent.com/35618409/187021900-f0285913-5fab-4ab0-9fe9-a9a4d75a2618.png)
  - Fork가 완료되면 Github URL이 내 계정의 리소스로 페이지가 전환된다.


## Entering the GitPod environment (Every time)
- 복사한 내 Github에 접속: https://github.com/MY-GIT-ACCOUNT/msaez-labs
  - Github 페이지가 로딩되고 나면, 도메인 URL 앞에 https://gitpod.io/# 을 추가 후, 새창에서 재접속해 본다.
  - https://gitpod.io/#https://github.com/MY-GIT-ACCOUNT/msaez-labs


### When Connecting 

- Gitpod 인증화면이 나타나며 Gihub 계정정보를 입력한다.
![image](https://user-images.githubusercontent.com/35618409/187013335-cee187a1-cd43-4752-b881-424af1a9f2f9.png)

- Gitpod 로고가 중앙에 나타나며 접속이 진행된다.
- 성공적으로 접속이 이루어지면 VSCode 통합 IDE가 나타난다.
![image](https://user-images.githubusercontent.com/35618409/187012423-53229178-9221-492f-bf75-b493e99782be.png)
- 왼쪽(Explorer) 영역에는 Github에 있는 Cloud Lab 리소스 목록이, 오른쪽에는 편집기와 터미널이 위치해 있다.

- GitPod 로딩 후, 설정된 스크립트가 터미널에서 실행되는데 이때 대문자 'A'를 눌러 기존설치를 Overwrite 한다.
![image](https://user-images.githubusercontent.com/35618409/190939445-68358ce2-53cd-4565-af1d-25aa29c9ebcf.png)



## 여기까지만 진행하면 되고, 이하는 각 주차에서 필요시 진행예정임 

## 
## 

## Built-in Utilities & How to add Tools 
- 개발환경은 2022년 기준 ubuntu 20.04.3 LTS이며 go, java, python, node 등 기본 프레임워크는 설치되어 있다.
- 추가 설치가 필요한 Software는 Gitpod 접속과 동시에 실행되는 .gitpod.yml에 기술하여 설치 가능하다.
- 아래 4개의 목록은 .gitpod.yml에 정의되어 설치되도록 설정되어 있다. (init.sh)

- CLI기반 Web Client - Httpie (curl, POSTMAN 대용) 
```
sudo apt-get update
sudo apt-get install net-tools
sudo apt install iputils-ping
pip install httpie
```

- kubernetes utilities (kubectl)
```
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```

- aws cli (aws)
```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```

- eksctl 
```
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
```

## Install Kafka for EDA-based Microservices Communication (if, necessary)

### Docker Compose 이용 (Docker Runtime이 설치되어 있을때 강추)
- Kafka 의 실행 (Docker Compose)
```
cd kafka
docker-compose up -d     # docker-compose 가 모든 kafka 관련 리소스를 받고 실행할 때까지 기다림
```
- Kafka 정상 실행 확인
```
$ docker-compose logs kafka | grep -i started    

kafka-kafka-1  | [2022-04-21 22:07:03,262] INFO [KafkaServer id=1] started (kafka.server.KafkaServer)
```
- Kafka consumer 접속
```
docker-compose exec -it kafka /bin/bash   # kafka docker container 내부 shell 로 진입

[appuser@e23fbf89f899 bin]$ cd /bin
[appuser@e23fbf89f899 bin]$ ./kafka-console-consumer --bootstrap-server localhost:9092 --topic mall
```


### 로컬 설치 (Docker Runtime이 설치되어 있지 않을 때, 비추)
- Kafka Download
```
wget https://archive.apache.org/dist/kafka/3.0.0/kafka_2.13-3.0.0.tgz
tar -xvf kafka_2.13-3.0.0.tgz
```

- Run Kafka
```
cd kafka_2.13-3.0.0
bin/zookeeper-server-start.sh config/zookeeper.properties &
bin/kafka-server-start.sh config/server.properties &
```

- Kafka Event 컨슈밍하기 (별도 터미널)
```
cd kafka_2.13-3.0.0
bin/kafka-console-consumer.sh --bootstrap-server 127.0.0.1:9092 --topic mall
```

## 자주 사용하는 명령어
```
netstat -lntp | grep :80 #포트확인
kill -9 `netstat -lntp|grep 808|awk '{ print $7 }'|grep -o '[0-9]*'`   # 80번대 마이크로서비스 모두 삭제
```

# Deploy to Kubernetes

## Docker 배포 관련

- 각 프로젝트 내에는 Dockerfile이 포함되어 있다. 이것을 빌드하기 위해서는 우선 maven 빌드로 jar 를 만들어준 후, jar를 Dockerfile 로 다시 빌드해준다.

```
cd order
mvn package -B
docker build -t order:v1 .
docker run order:v1
```

## Istall Kafka on Kubernetes Cluster (if, necessary)

### Helm 
Helm(패키지 인스톨러) 설치
- Helm 3.x 설치(권장)
```bash
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 > get_helm.sh
chmod 700 get_helm.sh
./get_helm.sh
```

### Install Kafka with helm
```bash
helm repo update
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install my-kafka bitnami/kafka
```
 
