FROM ubuntu:20.04 

LABEL maintainer="Andrés Sánchez García <asg1612@gmail.com>"

WORKDIR /github/workspace

RUN apt update && apt install -y docker.io \
                   gcc \
                   git-core \
                   python3-pip  && \
    apt clean all

RUN pip3 install docker ansible-lint "molecule>=3,<4" testinfra

CMD cd ${GITHUB_REPOSITORY} ; PY_COLORS=1 ANSIBLE_FORCE_COLOR=1 molecule ${command:-test}
