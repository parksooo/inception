## Inception
42seoul 과제
### 개요
- Docker와 컨테이너를 사용하여, wordpress && nginx && mariaDb을 한번에 관리하는 과제
- DockerHub에서 lastest image를 pull하지 않고, 직접 각각의 컨테이너에 대한 wordpress, nginx, mariaDb에 대한 Dockerfile 작성 해서 container 띄우기
- 각각의 Docker를 띄우기 보다, 하나의 docker-compose를 통해 하나의 host에 3개의 container를 띄워야 함
- 동적 데이터 관리, https 사용을 위해 nginx.conf 설정
- Docker에 대한 장점 및 동작 원리에 관한 이해
- conatiner는 리눅스 체제의 cgroup, namespace 사용하기에, 프로세스로 관리 가능
