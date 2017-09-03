# FROM python:2
FROM continuumio/miniconda

WORKDIR /snorkel
SHELL ["/bin/bash", "-c"]

COPY python-package-requirement.txt ./
COPY docker/install.sh ./docker/install.sh
RUN source docker/install.sh &&\
 install_python_pkgs &&\
 cleanup

COPY install-parser.sh ./
RUN source docker/install.sh &&\
 install_corenlp &&\
 cleanup

COPY . .
ENTRYPOINT /snorkel/docker/entry.sh
