FROM python:2.7

RUN echo "===> Installing Ansible & Boto..."  && \
    pip --disable-pip-version-check --no-cache-dir install boto boto3 ansible==2.7.6 && \
    pip install --upgrade pip && \
    pip install boto3 botocore --upgrade && \
    \
    \
    echo "===> Adding handy tools..."  && \
    apt-get update && \
    apt-get install -y --no-install-recommends curl git zip jq unzip sshpass openssh-client groff && \
    mkdir -p /etc/ansible && \
    echo "localhost              ansible_connection=local ansible_python_interpreter=python" > /etc/ansible/hosts

# default command: display Ansible version
CMD [ "ansible-playbook", "--version" ]
