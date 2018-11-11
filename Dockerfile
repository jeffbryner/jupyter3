FROM python:3

#clean/udate
RUN apt-get update
RUN apt-get -y install net-tools less vim

# install jupyter via pip
RUN pip install jupyter

# set base requirements
COPY ./requirements.txt /root

# startup script
COPY ./entryscript.sh /root

WORKDIR /root
# install base stuffs
RUN pip install -r requirements.txt

EXPOSE 8888
WORKDIR /opt/notebooks

ENTRYPOINT ["/root/entryscript.sh"]